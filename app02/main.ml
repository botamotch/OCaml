open Gnuplot

let gp = Gp.create ()
let wx_out = Output.create `Qt

let line_fun = Series.lines_func  "sin(x)" ~title:"Sine function" ~color:`Blue
let line_val =
  let val_list = [1.; 3.; 2.] in
  Series.lines val_list ~title:"Value list" ~color:`Green

let () =
  (* Gp.plot gp line_fun ~range:(Range.XY (-5., 5., -1.2, 1.2)) ~output:wx_out; *)
  (* Gp.plot gp line_val ~range:(Range.XY (-1., 5., -1.0, 4.0)) ~output:wx_out; *)
  Gp.plot_many gp [line_fun; line_val] ~range:(Range.XY (-1., 5., -1.0, 4.0)) ~output:wx_out;
  Gp.close gp

