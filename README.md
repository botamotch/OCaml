# OCaml練習用リポジトリ

## How to `opam switch`

```sh
$ opam switch list-available ocaml-system
$ opam switch create 4.07.0 ocaml-system.4.07.0
$ eval `opam env`
$ opam install ...
```

## Usefull packege

- merlin
- ocp-indent
- utop
- core
- omake

## Import package

### Build
```sh
$ ocamlopt -o prog core.cmxa prog.ml
$ ocamlfind ocamlopt -o main -linkpkg -thread -package core main.ml
```

### utop REPL
```
$ utop
# # require "core" ;;
# open Core ;;
# let (ints,strings) = List.unzip [(1,"one"); (2,"two"); (3,"three")];;
```

## 参考

- [Real World OCaml](http://dev.realworldocaml.org/)
- [OCamlチュートリアル](https://ocaml.org/learn/tutorials/index.ja.html)
  - [99 problems - OCaml](http://ocaml.org/learn/tutorials/99problems.html)

### OMake

- [The OMake build system](http://omake.metaprl.org/index.html)
  - [Chapter 2 OMake quickstart guide](http://omake.metaprl.org/manual/omake-quickstart.html)
  - [Chapter 3 Additional build examples](http://omake.metaprl.org/manual/omake-build-examples.html)
  - [OMakeマニュアル 日本語訳](http://omake-japanese.osdn.jp/index.html)

### Merlin
- [vim from scratch - ocaml/merlin Wiki](https://github.com/ocaml/merlin/wiki/vim-from-scratch)
  - `<C-x><C-o>` : オムニ補完
  - `:MerlinErrorCheck` : エラーチェック
  - `:MerlinTypeOf` : 型チェック

### PLplot
- [PLplot Home Page - Main](http://plplot.sourceforge.net/index.php)

### gnuplot
- [ogu / gnuplot-ocaml - Bitbucket](https://bitbucket.org/ogu/gnuplot-ocaml)

### OASIS
- [oasis.forge.ocamlcore.org](http://oasis.forge.ocamlcore.org/index.html)

---

OcamlでAPIサーバー作るやつらしい。面白そう
- https://github.com/rgrinberg/opium
- https://doitu.info/blog/6771ff3676cbc747baeb76fbbb2ae212423c8a6e
