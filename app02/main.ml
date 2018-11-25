open Gnuplot

let rec range a b step =
  if a >= b then []
  else a :: range (a +. step) b step

let rec gen_prbs n len =
  let l = Array.make len true in
  let rec range a b =
    if a >= b then []
    else a :: range (a + 1) b
  in
  let get_bool i j = not (Array.get l i = Array.get l j) in
  let () = 
    List.iter (fun i -> Array.set l i (get_bool (i - n) (i - n + 1)) ) (range n len);
    (* List.iter (fun i -> Printf.printf " > %d\n" i) (range n len) *)
  in
  Array.to_list l

let gp_sig = Gp.create ()
let gp_spec = Gp.create ()
let wx_out = Output.create `Qt
let len = 500.
let step = 0.1

let list_sig =
  (* let curve x = 0.1 *. (sin (x *. 3.7)) +. 0.15 *. (sin (x *. 2.3)) +. 0.15 *. (sin (x *. 20.9)) +. (Random.float 0.1) -. (Random.float 0.1) in *)
  let curve x = 0.1 *. (sin (x *. 3.7)) +. 0.15 *. (sin (x *. 2.3)) +. 0.15 *. (sin (x *. 20.9)) in
  let x = (range 0. len step) in
  let prbs = List.map (fun x -> if x then 0.5 else -0.5) (gen_prbs 15 (List.length x)) in
  (* List.map curve x *)
  List.map2 (fun x y -> x +. y) (List.map curve x) prbs

let list_spec =
  let complex_list = List.map (fun x -> Fft.complex_of_float x) list_sig in
  List.map (fun x -> Complex.norm x) (Fft.dft complex_list)

let line_sig =
  Series.lines list_sig ~title:"Waveform" ~color:`Green

let line_spec =
  Series.lines list_spec ~title:"Spectrum" ~color:`Blue

let () =
  Gp.plot gp_sig line_sig ~range:(Range.X (-5., len /. step +. 5.)) ~output:wx_out;
  Gp.plot gp_spec line_spec ~range:(Range.X (-5., len /. step /. 2. +. 5.)) ~output:wx_out;
  Gp.close gp_sig;
  Gp.close gp_spec;

