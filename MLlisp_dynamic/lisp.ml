open Globals

(************* Lisp interpreter, dynamic binding ******)

(* Set up all global variables, defined in file "globals.ml" *)

let init_globals () =
  debug := false;
  global_env_ref := Env.empty_env;
  current_channel := stdin;
  max_print_level := 4;
  max_print_env_level := 2;
  print_env_hidden := false

(* Set up initialization file, "/dev/null" for a raw start *)

let init_file = "init.lsp"

(* And now, ready to go! *)

let go () =
  (* Initialize global parameters *)
  init_globals ();
  (* Initialize predefined subroutines *)
  Subr.init_env_subr ();

  (* Load in the init file, without debug trace, up to end of file *)
  current_channel := (open_in init_file);
  Lexer.reset_parser ();
  begin
    let initial_debug = !debug
    in
    debug := false;
    begin
      try Toplevel.toplevel ()
      with
      | End_of_file ->
        print_string ("File " ^ init_file ^ " loaded!\n")
    end;
    debug := initial_debug
  end;
  close_in !current_channel;

  (* Switch to direct user interaction *)
  current_channel := stdin;
  Lexer.reset_parser ();
  try
    begin
      while true do
        try Toplevel.toplevel ()
        with
        | Utils.Lisp_error -> ()
      done
    end
  with
  | End_of_file
  | Defs.Lisp_end_of_toplevel ->
    print_string "May Lisp be with you!\n"

let () = go () 
