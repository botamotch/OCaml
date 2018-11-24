open Gnuplot

let rec range a b step =
  if a > b then []
  else a :: range (a +. step) b step

let rec gen_prbs n len =
  let l = Array.make n true in
  Array.to_list l

let gp_sig = Gp.create ()
let gp_spec = Gp.create ()
let wx_out = Output.create `Qt

let list_sig =
  let curve x = 0.3 *. (sin (x *. 3.7)) +. 0.3 *. (sin (x *. 2.3)) +. 0.4 *. (sin (x *. 20.9)) +. (Random.float 0.5) -. (Random.float 0.5) in
  let x = (range 0. 100. 0.1) in
  List.map curve 

let list_spec =
  let complex_list = List.map (fun x -> Fft.complex_of_float x) list_sig in
  List.map (fun x -> Complex.norm x) (Fft.dft complex_list)

let line_sig =
  Series.lines list_sig ~title:"Waveform" ~color:`Green

let line_spec =
  Series.lines list_spec ~title:"Spectrum" ~color:`Blue

let () =
  Gp.plot gp_sig line_sig ~range:(Range.X (-5., 1005.)) ~output:wx_out;
  Gp.plot gp_spec line_spec ~range:(Range.X (-5., 505.)) ~output:wx_out;
  Gp.close gp_sig;
  Gp.close gp_spec;

