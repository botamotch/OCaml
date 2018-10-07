open Printf

let pi = 2.0 *. (acos 0.0)

let rec range a b =
  if a > b then []
  else a :: range (a+1) b

let filename = "input.txt"

let () =
  let oc = open_out filename in
  let in_list = List.map (fun a -> sin (0.01 *. pi *. (float_of_int a))) (range 1 60) in
  List.iter (fun a -> Printf.fprintf oc "%.2f\n" a) in_list;
  close_out oc


