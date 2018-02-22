open Objects
open Defs
open Eval
open Globals
open Output
open Env
open Lexer
open Utils

(********************** Toplevel loop ************************)

let handle_setq obj =
  let defined_obj = (cadr obj)
  and defining_expr = (caddr obj)
  in
  let defined_name = (obj_to_string defined_obj)
  and defining_value = (eval defining_expr !global_env_ref)
  in
  begin
    print_string ("SET: " ^ defined_name ^ " = ");
    print(defining_value);
    print_newline();
    global_env_ref := update_env_extend
        defined_obj defining_value !global_env_ref
  end

let macro_defun_to_setq obj =
  let name = (cadr obj)
  and lpars = (caddr obj)
  and body = (cadddr obj)
  in  let new_lambda =
        (list3 lisp_lambda lpars body)
  in  let new_quote =
        (list2 lisp_quote new_lambda)
  in let new_obj =
       (list3 lisp_setq name new_quote)
  in new_obj

let handle_defun obj =
  let new_obj = macro_defun_to_setq obj
  in handle_setq new_obj

let handle_load obj toplevel =
  let file_object = (cadr obj) in
  let file_name =
    (obj_to_string
       (eval file_object !global_env_ref))
  and initial_channel = !current_channel
  in
  begin
    current_channel := (open_in file_name);
    (*
    * Make sure to start with an empty buffer.
    *)
    reset_parser();
    print_string ("Loading file " ^ file_name ^ "...\n");
    begin
      try toplevel ()
      with End_of_file -> ()
    end;
    close_in !current_channel;
    print_string ("File " ^ file_name ^ " loaded!\n");
    current_channel := initial_channel;
    (*
    * It may happen that an expression has already been partially read
    * in the the loaded file.
    * It depends on the specific implementation of the lexer/parser.
    * This potential partial reading must be aborted
    * before reading any new expression in the original file.
    *)
    reset_parser()
  end

exception Lisp_continue

let handle_directive obj toplevel =
  if (listp obj) then
    let directive = (car obj) in
    if directive = lisp_load
    then (handle_load obj toplevel; raise Lisp_continue)
    else if (directive = lisp_setq)
    then (handle_setq obj; raise Lisp_continue)
    else if (directive = lisp_defun)
    then (handle_defun obj; raise Lisp_continue)

let prompt = "MLisp_dynamic"

let rec toplevel() =
  (*
  * Make sure to start with an empty buffer.
  *)
  reset_parser();
  while true do
    init_counter();
    print_newline();
    print_string(prompt ^ "? ");
    flush(stdout);
    let obj = read()
    in
    try
      begin
        (*
        * First check whether the expression is a directive.
        * If so, handle_directive raises Lisp_continue so that
        * the current iteration is escaped and a fresh
        * iteration is started in the updated global environment.
        * Function toplevel is passed as parameter in case
        * the directive is a load.
        *)
        handle_directive obj toplevel;
        (*
        * No directive has been detected.
        * Just evaluate the expression and print the result.
        *)
        print (eval obj !global_env_ref);
        print_newline();
      end
    with Lisp_continue -> ()
  done
