open Helloworld
module S = Tiny_httpd

let () =
  let a = 4 in
  let b = 5 in
  Printf.printf "a : %d , b : %d\n" a b;

  print_endline "Hello, World!";

  let result = Fact.fact 5 in
  Printf.printf "fact : %d\n" result;

  let result = Math.add 2 3 in
  Printf.printf "add : %d\n" result;

  let a = 0 :: [1; 2; 3; 4; 5] in
  let b = Lib.last a in
  Lib.print_list a;
  match b with
  | None -> Printf.printf "list is none\n"
  | Some x -> Printf.printf "last of list is %d\n" x;

  Lwt_main.run (Lwt_io.printf "hello world from Lwt_main\n");

  let server = S.create () in
  (* say hello *)
  S.add_route_handler ~meth:`GET server
    S.Route.(exact "hello" @/ string @/ return)
    (fun name _req -> S.Response.make_string (Ok ("hello " ^name ^"!\n")));
  (* echo request *)
  S.add_route_handler server
    S.Route.(exact "echo" @/ return)
    (fun req -> S.Response.make_string (Ok (Format.asprintf "echo:@ %a@." S.Request.pp req)));
  Printf.printf "listening on http://%s:%d\n%!" (S.addr server) (S.port server);
  match S.run server with
  | Ok () -> ()
  | Error e -> raise e
