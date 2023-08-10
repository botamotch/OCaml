open Helloworld

let () =
    let a = 4 in
    let b = 5 in
    Printf.printf "a : %d , b : %d\n" a b;

    print_endline "Hello, World!";

    let result = Fact.fact 5 in
    Printf.printf "fact : %d\n" result;

    let result = Math.add 2 3 in
    Printf.printf "add : %d\n" result;

