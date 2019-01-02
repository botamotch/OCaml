open Complex

val pi : float
val complex_of_float : float -> Complex.t
val dft : Complex.t list -> Complex.t list
val dtft : (int * Complex.t) list -> float -> Complex.t
