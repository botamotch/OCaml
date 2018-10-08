open Printf
open List

let pi = 2.0 *. (acos 0.0)

let rec range a b =
  if a > b then []
  else a :: range (a+1) b

let filename = "input.txt"

let curve x =
  sin (0.06 *. pi *. x) +. sin (0.08 *. pi *. x) +. sin (0.10 *. pi *. x) +. sin (0.12 *. pi *. x)

let () =
  let oc = open_out filename in
  let in_list = map (fun a -> curve (float_of_int a)) (range 0 100) in
  iter (fun a -> fprintf oc "%.3f\n" a) in_list;
  close_out oc


