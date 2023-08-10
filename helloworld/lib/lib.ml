
let rec range a b =
    if a > b then []
    else a :: range (a + 1) b

let print_list l =
    List.iter (Printf.printf "%d ") l;
    print_endline ""

let rec last l =
    match l with
    | [] -> None
    | [a] -> Some a
    | _ :: a -> last a

