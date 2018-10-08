open Printf

(* 標準入力を標準出力にそのまま吐き出すだけ *)

(*
 * x[k] : 離散時間信号
 * X[k] : 周波数スペクトル
 *
 * X[k] = \sum_0^{N-1}( x[n]*exp(-j*2*pi*kn/N ) )
 * k, n = 0 ~ N-1
 *
 *)

let rec cat_sub () =
  print_endline (input_line stdin);
  cat_sub();
  ()

let rec cat_increment () =
  (* print_endline (string_of_float ((float_of_string (input_line stdin)) +. 1.)); *)
  printf "%.2f\n" ((float_of_string (input_line stdin)) +. 4.);
  cat_increment();
  ()

let () =
  try
    cat_increment()
  with End_of_file -> ()

