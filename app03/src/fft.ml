open Complex

let pi = 2.0 *. (acos 0.0)
let complex_of_float x = { Complex.re = x ; im = 0. }

let rec dtft s omega =
  let exp_help omega n =
    Complex.exp (Complex.mul Complex.i (complex_of_float (omega *. (float_of_int n))))
  in
  match s with
  | (hd_int , hd_val) :: tl -> Complex.add (Complex.mul hd_val (exp_help omega hd_int)) (dtft tl omega)
  | [] -> Complex.zero
