(** This module is the core of the Lisp evaluator, where functions {!val:eval} and {!val:apply} are defined, together with their sibling functions.

    Actually, the dozen of mutually recursive functions are defined in two steps. First, all the original declarations are collected into a structure of type {!type:Types.definitions}. Then, a non-recursive subsidiary function is defined for each respective function, which receives the set of recursive definitions as an argument. This argument is always called [defs]. The subsidiary function for [f] is called [f'].
*)

open Globals
open Defs
open Objects
open Types

(** Wrapping function to trace the calls to the {!val:eval_core} function

    @param defs The recursive definitions for all related functions
    @param obj The Lisp object to be evaluated
    @param env The current Lisp environment
    @return The result of the evaluation of the object in the environment
*)
let eval' defs obj env =

  (** Extract the original eval_core function from the definitions *)
  let eval_core = defs.eval_core in

  (** If not tracing is needed, then call eval_core directly *)
  if not (!debug) then eval_core obj env

  (** Else, start tracing *)
  else begin

    (** Print a right arrow with the current nesting level *)
    Utils.print_string_level " --> ";

    (** Increment nesting level *)
    Utils.incr_counter();

    (** Print the object under evaluation *)
    Output.print obj;

    (** Print a separator *)
    print_string "\t| ";

    (** Print the current environment *)
    Output.print_env env;

    (** Terminate with a new line *)
    print_newline();

    (** Evaluate the object under evaluation with the internal eval_core function *)
    (** Note It is important to locate this evaluation at this place,
        so that the possible side effects are properly handled.
        However, the result will only be used later. *)
    let obj' = (eval_core obj env) in

    (** The object has now been evaluated and its value is kept in variable [obj'] *)
    begin

      (** Decrement nesting level *)
      Utils.decr_counter();

      (** Print a left arrow with the current nesting level *)
      Utils.print_string_level " <-- ";

      (** Print the value of the object *)
      Output.print obj';

      (** Terminate with a new line *)
      print_newline();

      (** Most important: returns the value of the object! *)
      obj'
    end
  end
;;

(** Core evaluation function, where all the work is carried out

    @param defs The recursive definitions for all related functions
    @param obj The Lisp object to be evaluated
    @param env The current Lisp environment
    @return The result of the evaluation of the object in the environment
*)
let eval_core' defs obj env =

  (** Extract the original {!val:eval} and {!val:apply} functions from the definitions *)
  let eval = defs.eval
  and apply = defs.apply
  in

  (** Start the case analysis regarding the nature of the object *)
  (** If it is [nil], then return the object itself *)
  if (nullp obj) then obj

  (** It is [t], then return the object itself *)
  else if (obj = lisp_t) then obj

  (** If it is a number, then return the object itself *)
  else if (numberp obj) then obj

  (** If it is a string, then return the object itself *)
  else if (stringp obj) then obj

  (** If it is a subroutine, then return the object itself *)
  else if (subrp obj) then obj

  (** If it is a symbol, then search its value in the current environment *)
  else if (symbolp obj)
  then (Env.get_value_env obj env)

  else
    (** At this point, the object is necessary a list *)
    begin

      (** If the head is [lambda], then return the list itself *)
      if (car obj) = lisp_lambda then obj

      (** If the head is [let], then macro-expanse it and eval the expansed result in the environment *)
      else if (car obj) = lisp_let
      then (eval (macro_let_to_lambda obj) env)

      (** If the head is [printenv], then call the {!val:Output.printenv} function *)
      else if (car obj) = lisp_printenv then (Output.print_env env; nil)

      (** If the head is [quote], then return the second element of the list *)
      (** Note: The remaining elements are disregarded *)
      else if (car obj) = lisp_quote then (cadr obj)

      (** If the head is [if], then call the {!val:do_if} function with the rest of the list and the environment *)
      else if (car obj) = lisp_if then defs.do_if (cdr obj) env

      (** If the head is [cond], then call the {!val:do_cond} function with the rest of the list and the environment *)
      else if (car obj) = lisp_cond then defs.do_cond (cdr obj) env

      (** If the head is [and] (left-to-right, sequential and), then call the {!val:do_andthen} function with the rest of the list and the environment *)
      else if (car obj) = lisp_andthen then defs.do_andthen (cdr obj) env

      (** If the head is [progn] (left-to-right sequential execution), then call the {!val:do_progn} function with the rest of the list and the environment *)
      else if (car obj) = lisp_progn then defs.do_progn (cdr obj) env

      else
        (** At this point, the object is necessary a list whose head is not  a known keyword. It can only be the application of a function to a list of arguments. *)

        let f = (car obj) (** The head is the function. Note that it may be a list. *)
        and largs = (cdr obj) (** The rest is the argument list
                                  Note It may be empty. *)

        in
        (** Evaluate the list of arguments in the current environment using function {!val:eval_list}. Note: The environment cannot be modified through this sequence of evaluations *)

        let lvals =  (defs.eval_list largs env) (** The list of resulting values *)
        in

        (** Call function {!val:apply} with the function, the list of evaluated arguments and the current environment *)
        (apply f lvals env)
    end
;;

(** Core application function, where all the work is carried out

    @param defs The recursive definitions for all related functions
    @param f The Lisp object to be applied
    @param lvals The list of its evaluated arguments
    @param env The current Lisp environment
    @return The result of the application of the function to the arguments in the environment
*)
let apply' defs f lvals env =

  (** Extract the original {!val:eval} and {!val:apply} functions from the definitions *)
  let eval = defs.eval
  and apply = defs.apply
  in

  (** If the function is [nil], then it is an error *)
  if (nullp f) then Utils.error "Cannot apply nil"

  (** If the function is a number, then it is an error *)
  else if (numberp f) then Utils.error2 f "Cannot apply a number"

  (** If the function is a string, then it is an error *)
  else if (stringp f) then Utils.error2 f "Cannot apply a string"

  (** If the function is a predefined subroutine, then extract the associated Caml function associated with it, and {!val:apply} this function to the list of arguments *)
  else if (subrp f) then ((subr_to_fun f) lvals)

  (** If the function is a symbol, then this symbol must be evaluated to get a lambda-expression eventually *)
  else if (symbolp f)

  then
    (** Eval the symbol in the current environment *)
    let new_f = (eval f env) in

    (** Apply the resulting value to the same list of arguments, in the same environment.
        Note: This algorithm may loop forever, for instance if the value of a symbol in the environment is this symbol itself *)
    (apply new_f lvals env)

  else
    (**
       At this point, the function is a list
    *)

    begin

      (**
         If its head is [lambda], then it is a lambda-expression.
      *)
      if ((car f) = lisp_lambda)
      then

        let body =  (caddr f) (** The body of the lambda-expression *)
        and lpars = (cadr f) (** The list of parameters of the lamba-expression *)
        in

        (**
           Create a new environment by pairing the list of parameters and the list of arguments, and glue this list of new associations in front of the current environment.
            Note: This shall fail if the two lists do not match
        *)
        let new_env = (Env.extend_largs_env lpars lvals env) in

        (** Call function eval with the body and this new environment *)
        (eval body new_env)

      else
        (**
           At this point, the function is a list whose head is not [lambda]. It is an error.
            Note: A possible alternative would be to evaluate this list in the current environment and then to apply the result again, as for the case the function is a symbol.
        *)
        Utils.error2 f "Cannot apply a list"
    end
;;


let rec
  (**
     The external harness for the core evaluation function. See {!val:eval'}.
  *)
  eval obj env = eval' defs obj env

and

  (**
     The core evaluation function. See {!val:eval_core}.
  *)
  eval_core obj env = eval_core' defs obj env

and

  (**
     Its sibling application function. See {!val:apply}.
  *)
  apply f lvals env = apply' defs f lvals env

and

  (**
     This function evaluates a list of objects in a given environment and returns the list of values. It is just a map.  See {!val:Defs.eval_list'}.
      Note: The order of evaluation {b is not} specified!
  *)
  eval_list l env = eval_list' defs l env

and

  (**
     This function sequentially evaluates a list of objects in a given environment and returns the last value.  See {!val:Defs.do_progn'}.
      Note: The order of evaluation {b is} specified, {b left to right}!
  *)
  do_progn l env = do_progn' defs l env

and

  (**
     This function implements a conditional. It takes a list of 3 objects. It evaluates the first one. If the value is not null, then it evaluates the second one, else it evaluates the third one. All evaluations are carried out in the same environment. The value of the last evaluation is returned. See {!val:Defs.do_if'}.
  *)
  do_if l env = do_if' defs l env

and

  (**
     This function implements a conditional. It takes a list of object pairs. It evaluates in turn the first element of each of them, until some evaluates to a non-null value. Then, it evaluates the second element of that pair, and returns its value. If none is found, it return [nil]. See {!val:Defs.do_cond'}.
  *)
  do_cond l env = do_cond' defs l env

and
  (**
     This function implements a seqential, left-to-right conjonction. It takes a list of object. It evaluates in turn each of them, until some evaluates to a null value. If none is found, it return the last value. See {!val:Defs.do_andthen'}.
  *)
  do_andthen l env = do_andthen' defs l env

and

  (**
     This function exposes the internal {!val:eval} function at the user level. The environment is the current environment. See {!val:Defs.do_eval'}.
  *)
  do_eval lvals = do_eval' defs lvals

and

  do_apply lvals = do_apply' defs lvals

and

  defs = {
  eval = eval;
  eval_core = eval_core;
  apply = apply;
  eval_list = eval_list;
  do_progn = do_progn;
  do_if = do_if;
  do_cond = do_cond;
  do_andthen = do_andthen;
  do_eval = do_eval;
  do_apply = do_apply
}
;;
