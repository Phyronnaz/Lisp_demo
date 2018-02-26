open Types
open Objects

(************************ Environment *************************)

let empty_env= ([]:environment)

exception Lisp_no_such_binding

let rec find_binding_env obj (env:environment) =
  let s = (obj_to_string obj)
  in
  match env with
  | [] -> raise Lisp_no_such_binding
  | b::env' ->
    (if (b.name = s) then b else find_binding_env obj env')

let rec get_value_env obj (env:environment) =
  try
    (find_binding_env obj env).value
  with
    Lisp_no_such_binding -> Utils.error2 obj "Undefined variable"

let extend_env obj v (env:environment) =
  let s = (obj_to_string obj)
  in (({name= s; value= v}::env):environment)

let rec extend_largs_env lpars lvals env =
  if (nullp lpars)
  then
    if (nullp lvals)
    then env
    else Utils.error2 lvals "Too many args"
  else
  if (nullp lvals)
  then Utils.error2 lpars "Too many pars"
  else extend_env
      (car lpars)
      (car lvals)
      (extend_largs_env (cdr lpars) (cdr lvals) env)

let update_env_extend obj v (env:environment) =
  extend_env obj v env
