
opam setup

```
$ opam switch list-available ocaml-base-compiler
ocaml-base-compiler 4.13.0        Official release 4.13.0
ocaml-base-compiler 4.13.1        Official release 4.13.1
ocaml-base-compiler 4.14.1        Official release 4.14.1
ocaml-base-compiler 5.0.0         Official release 5.0.0
...

$ opam switch create ocaml-base-compiler.5.0.0
...

$ opam switch list
#  switch                     compiler                   description
   default                    ocaml.4.14.0               default
→  ocaml-base-compiler.5.0.0  ocaml-base-compiler.5.0.0  ocaml-base-compiler.5.0.0

$ opam switch set default
# Run eval $(opam env) to update the current shell environment

$ eval $(opam env)

$ opam switch list
#  switch                     compiler                   description
→  default                    ocaml.4.14.0               default
   ocaml-base-compiler.5.0.0  ocaml-base-compiler.5.0.0  ocaml-base-compiler.5.0.0
```

dune project setup

```
$ dune init project helloworld
Entering directory '.../helloworld'
Success: initialized project component named helloworld
Leaving directory '.../helloworld'
$ cd helloworld
$ vim bin/main.ml
$ dune exec helloworld
a : 4 , b : 5
Hello, World!
```
