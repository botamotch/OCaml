open Complex
(* open Gnuplot *)

val pi : float
val complex_of_float : float -> Complex.t
val dft : Complex.t list -> Complex.t list
val dtft : (int * float) list -> float -> Complex.t

