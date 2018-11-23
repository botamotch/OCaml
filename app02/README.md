Signal Proccessing with OCaml
===========================================================================

---------------------------------------------------------------------------

- convolution
- descrete fourier transform
- plot eye-pattern, freq. response etc
- design FIR filter

gnuplot-ocaml
---------------------------------------------------------------------------
### Reqiure
- [gnuplot-ocaml](https://bitbucket.org/ogu/gnuplot-ocaml)

### Example

    :::ocaml
    open Gnuplot

    let () =
      let gp = Gp.create () in
      let wx_out = Output.create `Qt in
      let line_val = Series.lines [1.; 3.; 2.] ~title:"Value list" ~color:`Green in
      let line_fun = Series.lines_func "sin(x)" ~title:"Sine function" ~color:`Blue in

      Gp.plot_many gp [line_val; line_fun] ~range:(Range.XY (-10., 10., -1.5, 1.5)) ~output:wx_out;
      Gp.close gp


Discrete Fourier Transform
---------------------------------------------------------------------------

(in creating ...)

Build & Run
---------------------------------------------------------------------------
### ocamlfind

    $ ocamlfind ocamlopt -o main -linkpkg -thread -package gnuplot,core main.ml
    $ ./main

### OMake

(in creating ...)



