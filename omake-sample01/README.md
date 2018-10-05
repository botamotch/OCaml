# OMake sample 01

## tree

```
project/
  |--> OMakefile
  |--> OMakeroot
  |--> main_code.ml
  |--> lib/
       |---> OMakefile
       |---> amodule.ml
```

## Generated files

- main : Link to executable file
- main.run : Executable file
- main.cmo : Compiled bytecode object file
- main.cmi : Compiled module interface
- lib/mymodule.cma : Library of bytecode object file packed into a single file
- lib/amodule.cmo : Compiled bytecode object file
- lib/amodule.cmi : Compiled module interface

## OMakefile (root)
```
.SUBDIRS: lib
OCAMLINCLUDES += lib
OCAML_LIBS += lib/mymodule
OCamlProgram(main, main_code)
.DEFAULT: main
```

## OMakefile (lib)
```
FILES[] = amodule
LIB = mymodule
.DEFAULT: $(OCamlLibrary $(LIB), $(FILES))
```

