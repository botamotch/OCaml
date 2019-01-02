open Fft
open Complex
open Gnuplot

let filename = "input.txt"

let rec input_file filename =
  let f = open_in filename in
  let rec input_file_help f =
    try
      let line = input_line f in
      line :: (input_file_help f)
    with End_of_file ->
      let _ = close_in f in
      []
  in
  input_file_help f

let () =
  let l = input_file filename in
  let l = List.map (fun x -> complex_of_float (float_of_string x)) l in
  List.iter (fun {re = x ; im = _} -> Printf.printf "%f\n" x) l

