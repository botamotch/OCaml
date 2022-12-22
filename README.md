# OCaml練習用リポジトリ

# opam

```
$ opam init
$ opam switch list-available ocaml-system
# Listing available compilers from repositories: default
# Name       # Version # Synopsis
ocaml-system 4.14.0    The OCaml compiler (system version, from outside of opam)

$ opam switch create 4.14.0
$ opam switch 4.14.0
# Run eval $(opam env) to update the current shell environment

$ eval $(opam env)
$ opam switch list
#  switch   compiler             description
→  4.14.0   ocaml-system.4.14.0  4.14.0
   default  ocaml.4.14.0         default

$ opam install utop
$ opam list -i
# Name            # Installed # Synopsis
base-bigarray     base
base-bytes        base        Bytes library distributed with the OCaml compiler
base-threads      base
base-unix         base
...
utop              2.10.0      Universal toplevel for OCaml
```

# Build
main.ml
```OCaml
open Fact
let () = print_int (fact 10); print_newline()
```

fact.ml
```OCaml
let rec fact n =
  if n = 0 then
    1
  else
    n * fact (n - 1)
```

## `ocamlc`
バイトコードでコンパイル

```
$ ocamlc -o main_byte fact.ml main.ml
$ ll
Permissions Size Date Modified Name
.rw-r--r--   268 22 12月 13:29 fact.cmi
.rw-r--r--   274 22 12月 13:29 fact.cmo
.rw-r--r--    67 22 12月 13:25 fact.ml
.rw-r--r--   206 22 12月 13:29 main.cmi
.rw-r--r--   301 22 12月 13:29 main.cmo
.rw-r--r--    56 22 12月 13:25 main.ml
.rwxr-xr-x   22k 22 12月 13:29 main_byte
$ ./main_byte
3628800
```

## `ocamlopt`
ネイティブコードでコンパイル

```
$ ocamlopt -o main_natv fact.ml main.ml
$ ll
Permissions Size Date Modified Name
.rw-r--r--   268 22 12月 13:34 fact.cmi
.rw-r--r--   194 22 12月 13:34 fact.cmx
.rw-r--r--    67 22 12月 13:25 fact.ml
.rw-r--r--  3.7k 22 12月 13:34 fact.o
.rw-r--r--   206 22 12月 13:34 main.cmi
.rw-r--r--   244 22 12月 13:34 main.cmx
.rw-r--r--    56 22 12月 13:25 main.ml
.rw-r--r--  3.8k 22 12月 13:34 main.o
.rwxr-xr-x   22k 22 12月 13:29 main_byte
.rwxr-xr-x  402k 22 12月 13:34 main_natv
$ ./main_byte
3628800
```

```
$ ocamlopt -o prog core.cmxa prog.ml
$ ocamlfind ocamlopt -o main -linkpkg -thread -package core main.ml
```

## Dune
公式でおすすめされてるビルドシステム

- [ocaml/dune: A composable build system for OCaml - github.com](https://github.com/ocaml/dune)
- [Dune documentation](https://dune.readthedocs.io/en/stable/)

```
$ dune init proj dune_sample
Success: initialized project component named dune_sample
$ cd dune_sample/
$ dune build
$ lt -L 2
 .
 ├── _build
 │  ├── default
 │  ├── install
 │  └── log
 ├── bin
 │  ├── dune
 │  └── main.ml
 ├── dune-project
 ├── dune_sample.opam
 ├── lib
 │  └── dune
 └── test
    ├── dune
    └── dune_sample.ml

$ dune exec dune_sample
Hello, World!
```

# utop
```
$ utop
# # require "core" ;;
# open Core ;;
# let (ints,strings) = List.unzip [(1,"one"); (2,"two"); (3,"three")];;
```

# 参考

- [Real World OCaml](http://dev.realworldocaml.org/)
- [OCamlチュートリアル](https://ocaml.org/learn/tutorials/index.ja.html)
  - [99 problems - OCaml](http://ocaml.org/learn/tutorials/99problems.html)

# OMake

- [The OMake build system](http://omake.metaprl.org/index.html)
  - [Chapter 2 OMake quickstart guide](http://omake.metaprl.org/manual/omake-quickstart.html)
  - [Chapter 3 Additional build examples](http://omake.metaprl.org/manual/omake-build-examples.html)
  - [OMakeマニュアル 日本語訳](http://omake-japanese.osdn.jp/index.html)

### OASIS
- [oasis.forge.ocamlcore.org](http://oasis.forge.ocamlcore.org/index.html)

---

OcamlでAPIサーバー作るやつらしい。面白そう
- https://github.com/rgrinberg/opium
- https://doitu.info/blog/6771ff3676cbc747baeb76fbbb2ae212423c8a6e
