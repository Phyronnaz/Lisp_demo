open Types

(************ Basic functions *************)

let string_to_symbol s = Lisp_symbol(s)

let nil = Lisp_list([])

let lisp_t = string_to_symbol "t"

let lisp_f = nil

let bool_to_obj v =
  if v then  lisp_t else lisp_f

let obj_to_num obj =
  match obj with
  | Lisp_num(n) -> n
  | _ -> Utils.error2 obj "Not an int"

let num_to_obj n = Lisp_num(n)

let obj_to_string obj =
  match obj with
  | Lisp_symbol(s) -> s
  | Lisp_string(s) -> s
  | Lisp_num(s) -> string_of_int s
  | _ -> Utils.error2 obj "Not a symbol nor a string nor a number"

let string_to_obj s = Lisp_string(s)

let car obj =
  match obj with
  | Lisp_list(x::_) -> x
  | _ -> Utils.error2 obj "Cannot take car of such an object"

let cdr obj =
  match obj with
  | Lisp_list(_::m) -> Lisp_list(m)
  | _ -> Utils.error2 obj "Cannot take cdr of such an object"

let cons obj lobjs=
  match lobjs with
  | Lisp_list(l) -> Lisp_list(obj::l)
  | _ -> Utils.error2 lobjs "Cannot cons to such an object"

let nullp obj =
  match obj with
  | Lisp_list([]) -> true
  | _ -> false

let numberp obj =
  match obj with
  | Lisp_num(_) -> true
  | _ -> false

let symbolp obj =
  match obj with
  | Lisp_symbol(_) -> true
  | _ -> false

let stringp obj =
  match obj with
  | Lisp_string(_) -> true
  | _ -> false

let listp obj =
  match obj with
  | Lisp_list(_::_) -> true
  | _ -> false

let eqp obj1 obj2 =
  match (obj1,obj2) with
  | (Lisp_list([]), Lisp_list([])) -> true
  | (Lisp_num(n), Lisp_num(m)) -> m=n
  | (Lisp_symbol(s), Lisp_symbol(t)) -> s=t
  | (Lisp_string(s), Lisp_string(t)) -> s=t
  | (Lisp_list(m), Lisp_list(l)) -> m==l
  (* Physical equality!*)
  | _ -> false

let subrp obj =
  match obj with
  | Lisp_subr(_) -> true
  | _ -> false

let subr_to_fun obj =
  match obj with
  | Lisp_subr(f) -> f
  | _ -> Utils.error2 obj "Cannot use such an object as a subr"

let fun_to_subr f = Lisp_subr(f)

let caar obj = car (car obj)
let cddr obj = cdr (cdr obj)
let cadr obj = car (cdr obj)
let cadar obj = car (cdr (car obj))
let caddr obj = car (cdr (cdr obj))
let cdddr obj = cdr (cdr (cdr obj))
let cadddr obj = car (cdr (cdr (cdr obj)))
