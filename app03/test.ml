open Gnuplot
open Complex

(* Value *)
let pi = 2.0 *. (acos 0.0)
let complex_of_float x = { Complex.re = x ; im = 0. }
let gp_out = Output.create `Qt
let x = [(-6, 0.) ; (-5, 0.) ; (-4, 0.) ; (-3, 0.) ; (-2, 0.) ; (-1, 1.) ; (0, 1.) ; (1, 1.) ; (2, 0.) ; (3, 0.) ; (4, 0.) ; (5, 0.) ; (6, 0.)]

(* Function *)
let ( %+% ) = Complex.add
let ( %*% ) = Complex.mul

let rec range_int a b step =
  if a >= b then []
  else a :: range_int (a + step) b step

let rec range_float a b step =
  if a >= b then []
  else a :: range_float (a +. step) b step

let rec dtft s omega =
  let exp_help omega n =
    exp (Complex.i %*% (complex_of_float (omega *. (float_of_int n))))
  in
  match s with
  | (hd_n , hd_x) :: tl -> (hd_x %*% (exp_help omega hd_n)) %+% (dtft tl omega)
  | [] -> zero

let rec dft x =
  let n = List.length x in
  let n_list = range_int 0 n 1 in

  let exp_help i j =
    let nn = float_of_int n in
    let ii = float_of_int i in
    let jj = float_of_int j in
    exp (Complex.i %*% (complex_of_float ( -2. *. pi *. ii *. jj /. nn )))
  in

  List.map (fun j -> List.fold_left (%+%) zero (List.map2 (%*%) (List.map (exp_help j) n_list) x)) n_list

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
  let line = Series.lines_xy (List.map2 (fun x y -> (x, norm y)) omega_list spec) ~title:"Spectrum" ~color:`Blue  in

  Gp.plot gp line ~output:gp_out
