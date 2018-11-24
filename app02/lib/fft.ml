open Complex

let pi = 2.0 *. (acos 0.0)
let complex_of_float x = { Complex.re = x ; im = 0. }

let rec dft x =
  let n = List.length x in

  let exp_help i j =
    let nn = float_of_int n in
    let ii = float_of_int i in
    let jj = float_of_int j in
    exp (mul Complex.i (complex_of_float ( -2. *. pi *. ii *. jj /. nn )))
  in

  let rec sum_help i j xn =
    match xn with
    | [] -> (complex_of_float 0.)
    | hd :: tl -> 
      let x = mul hd (exp_help i j) in
      add x (sum_help i (j+1) tl)
  in

  let rec dft_help i =
    match (n - i) with
    | 0 -> []
    | _ -> (sum_help i 0 x) :: (dft_help (i + 1))
  in
  dft_help 0

