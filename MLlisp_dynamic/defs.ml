open Objects
open Types

(************************ Eval/Apply ***************)

let eval_list' defs l env =
  let eval = defs.eval
  and eval_list = defs.eval_list in
  if (nullp l) then nil
  else (cons (eval (car l) env) (eval_list (cdr l) env))

let do_progn' defs l env =
  let eval = defs.eval
  and do_progn = defs.do_progn in
  if (nullp l) then nil
  else if (nullp (cdr l))
  then (eval (car l) env)
  else
    begin
      (ignore (eval (car l) env));
      do_progn (cdr l) env
    end

let do_if' defs l env =
  let eval = defs.eval in
  let test_part = (car l)
  and then_part = (cadr l)
  and else_part = (caddr l)
  in
  if not (nullp (eval test_part env))
  then eval then_part env
  else eval else_part env

let do_cond' defs l env =
  let eval = defs.eval
  and do_cond = defs.do_cond in
  if (nullp l) then nil
  else
    let test_part = (caar l)
    and then_part = (cadar l)
    in
    if not (nullp (eval test_part env))
    then eval then_part env
    else do_cond (cdr l) env

let do_andthen' defs l env =
  let eval = defs.eval in
  let part1 = (car l)
  and part2 = (cadr l)
  in
  if not (nullp (eval part1 env))
  then (eval part2 env)
  else nil

let do_eval' defs lvals =
  let eval = defs.eval in
  eval (car lvals) !Globals.global_env_ref

let do_apply' defs lvals =
  let apply = defs.apply in
  apply (car lvals) (cadr lvals) !Globals.global_env_ref

(************************ Subroutines ***************)

let list x = cons x nil

let list2 x y = cons x (list y)

let list3 x y z = cons x (list2 y z)

let list4 x y z t = cons t (list3 x y z)

(**************************************)

let lisp_plus = string_to_symbol "+"

let do_plus lvals =
  num_to_obj
    ((obj_to_num (car lvals))
     + (obj_to_num (cadr lvals)))

let lisp_mult = string_to_symbol "*"

let do_mult lvals =
  num_to_obj
    ((obj_to_num (car lvals))
     * (obj_to_num (cadr lvals)))

let lisp_minus = string_to_symbol "-"

let do_minus lvals =
  num_to_obj
    ((obj_to_num (car lvals))
     - (obj_to_num (cadr lvals)))

let lisp_concat = string_to_symbol "concat"

let rec do_concat lvals =
  if (nullp lvals)
  then string_to_obj("")
  else
    let s = obj_to_string (car lvals)
    and t = obj_to_string (do_concat (cdr lvals))
    in string_to_obj (s^t)

(**************************************)

let lisp_car= string_to_symbol "car"

let do_car lvals = car (car lvals)

let lisp_cdr = string_to_symbol "cdr"

let do_cdr lvals = cdr (car lvals)

let lisp_cons = string_to_symbol "cons"

let do_cons lvals = cons (car lvals) (cadr lvals)

let lisp_eq = string_to_symbol "eq"

let do_eq lvals =
  bool_to_obj(eqp (car lvals) (cadr lvals))

let lisp_equal = string_to_symbol "="

let do_equal lvals = do_eq lvals

let lisp_read = string_to_symbol "read"

let do_read lvals = Output.read ()

let lisp_print = string_to_symbol "print"

let do_print lvals =
  let obj = (car lvals) in
  (Output.print obj; flush(stdout); obj)

let lisp_newline = string_to_symbol "newline"

let do_newline lvals = print_newline (); nil

let lisp_end = string_to_symbol "end"

exception Lisp_end_of_toplevel

let do_end lvals = raise Lisp_end_of_toplevel

(**************************************)

let lisp_lambda = string_to_symbol "lambda"

let lisp_quote = string_to_symbol "quote"

let lisp_setq = string_to_symbol "setq"

let lisp_define = string_to_symbol "define"

let lisp_defun = string_to_symbol "defun"

let lisp_if = string_to_symbol "if"

let lisp_cond = string_to_symbol "cond"

let lisp_andthen = string_to_symbol "andthen"

let lisp_progn = string_to_symbol "progn"

let lisp_printenv = string_to_symbol "printenv"

let lisp_debug = string_to_symbol "debug"

let lisp_load = string_to_symbol "load"

(**************************************)

let lisp_null = string_to_symbol "null"

let do_null lvals =
  bool_to_obj(nullp (car lvals))

let lisp_stringp = string_to_symbol "stringp"

let do_stringp lvals =
  bool_to_obj(stringp (car lvals))

let lisp_numberp = string_to_symbol "numberp"

let do_numberp lvals =
  bool_to_obj(numberp (car lvals))

let lisp_symbolp = string_to_symbol "symbolp"

let do_symbolp lvals =
  bool_to_obj(symbolp (car lvals))

let lisp_listp = string_to_symbol "listp"

let do_listp lvals =
  bool_to_obj(listp (car lvals))

(****************************************)

let lisp_eval = string_to_symbol "eval"

let lisp_apply = string_to_symbol "apply"

let lisp_error = string_to_symbol "error"

let do_error lvals =
  let message = obj_to_string (car lvals)
  in Utils.error message

(**********************************)

let lisp_let = string_to_symbol "let"

let rec map_car l =
  if (nullp l) then l
  else (cons (car (car l)) (map_car (cdr l)))

let rec map_cadr l =
  if (nullp l) then l
  else (cons (cadr (car l)) (map_cadr (cdr l)))

let macro_let_to_lambda obj =
  let binding_list = cadr obj
  and body = caddr obj
  in
  let lpars = map_car binding_list
  and largs = map_cadr binding_list
  in
  (cons (list3 lisp_lambda lpars body) largs)

(******************************************)

let do_debug lvals =
  begin
    if (nullp lvals) then Globals.debug := false
    else
      let v = (car lvals) in
      begin
        if (nullp v) then Globals.debug := false
        else if (numberp v) then
          begin
            Globals.max_print_level := (obj_to_num v);
            begin
              if (nullp (cdr lvals))
              then Globals.max_print_env_level := !Globals.max_print_level
              else Globals.max_print_env_level :=
                  (obj_to_num (cadr lvals))
            end;
            Globals.debug := true
          end
        else Globals.debug := true
      end
  end;
  nil

(**********************************************)
