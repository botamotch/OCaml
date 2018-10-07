open Printf

(* 標準入力を標準出力にそのまま吐き出すだけ *)

let () =
  let rec cat_sub () =
    print_endline (input_line stdin);
    cat_sub()
  in
  try
    cat_sub()
  with End_of_file -> ()

