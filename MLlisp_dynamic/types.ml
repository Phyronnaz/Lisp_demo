
(****************** Basic types ***************)

type

  lisp_object =
  | Lisp_symbol of string
  | Lisp_string of string
  | Lisp_num of int
  | Lisp_subr of (lisp_object -> lisp_object)
  | Lisp_list of (lisp_object list)

and

  binding = {name: string; value: lisp_object}

and

  environment = binding list

type
  definitions = {
  eval: lisp_object -> environment -> lisp_object;
  eval_core:   lisp_object -> environment -> lisp_object;
  apply:  lisp_object -> lisp_object -> environment -> lisp_object;
  eval_list: lisp_object -> environment -> lisp_object;
  do_progn:  lisp_object -> environment -> lisp_object;
  do_if:  lisp_object -> environment -> lisp_object;
  do_cond: lisp_object -> environment -> lisp_object;
  do_andthen: lisp_object -> environment -> lisp_object;
  do_eval:  lisp_object -> lisp_object;
  do_apply:  lisp_object -> lisp_object;
}
