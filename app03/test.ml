open Gnuplot
open Complex

(* Value *)
let pi = 2.0 *. (acos 0.0)
let complex_of_float x = { Complex.re = x ; im = 0. }
let gp_out = Output.create `Qt
let x = [(-6, 0.) ; (-5, 0.) ; (-4, 0.) ; (-3, 0.) ; (-2, 0.) ; (-1, 1.) ; (0, 1.) ; (1, 1.) ; (2, 0.) ; (3, 0.) ; (4, 0.) ; (5, 0.) ; (6, 0.)]

(* Function *)
let rec range_float a b step =
  if a >= b then []
  else a :: range_float (a +. step) b step

let rec dtft s omega =
  let exp_help omega n =
    Complex.exp (Complex.mul Complex.i (complex_of_float (omega *. (float_of_int n))))
  in
  match s with
  | (hd_int , hd_val) :: tl -> Complex.add (Complex.mul hd_val (exp_help omega hd_int)) (dtft tl omega)
  | [] -> Complex.zero

(* Main *)
let () =
  let x = List.map (fun (x, y) -> (float_of_int x, y)) x in

  let gp = Gp.create() in
  let line = Series.lines_xy x ~title:"Waveform" ~color:`Green  in

  Gp.plot gp line ~output:gp_out

let () =
  let x = List.map (fun (x, y) -> (x, complex_of_float y)) x in
  let omega_list = range_float (-.pi) pi 0.01 in
  let spec = List.map (dtft x) omega_list in

  let gp = Gp.create() in
  let line = Series.lines_xy (List.map2 (fun x y -> (x, Complex.norm y)) omega_list spec) ~title:"Spectrum" ~color:`Blue  in

  Gp.plot gp line ~output:gp_out
