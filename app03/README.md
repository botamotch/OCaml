OASIS Example
================================================================================

### 1. Setup `_oasis` file
--------------------------------------------------------------------------------

    Executable "foo"
      Path: src
      MainIs: foo.ml
      CompiledObject: best
      BuildDepends: bar

    Library "bar"
      Path: src
      Modules: Bar

### 2. Setup `.merlin` file
--------------------------------------------------------------------------------

    S src
    B _build
    B _build/src

### 3. Write code ...
--------------------------------------------------------------------------------

### 4. Setup OASIS & Build
--------------------------------------------------------------------------------

    :::bash
    $ oasis setup -setup-update dynamic
    $ make
    $ ./foo.native

### Reference
--------------------------------------------------------------------------------

- [Setting up with OASIS - OCaml](https://ocaml.org/learn/tutorials/setting_up_with_oasis.html)
- [OASIS User Manual](http://oasis.forge.ocamlcore.org/MANUAL.html)
- [OASISで楽にOCamlプロジェクトを作る - Qiita](https://qiita.com/keigoi/items/24016ba9f84e4943e2c0)
- [OCamlのパッケージシステムを使ってみた - Oh, you're no (fun _ -> more)](http://d.hatena.ne.jp/camlspotter/20110603/1307080062)

