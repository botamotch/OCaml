# OCamlで数値計算

## 離散フーリエ変換

- ` val pi : float`
- ` val complex_of_float : float -> t = <fun> `
- ` val dft : t list -> t list = <fun> `

## gnuplot
### ウィンドウに表示
```
> set term qt
> plot 'input.txt' with lines lt -1
```

### 画像に保存
```sh
$ gnuplot << EOF
set term epscairo
set output 'input.eps'
# set term pdfcairo
# set output 'input.pdf'
plot 'input.txt' with lines lt -1
set output
EOF
```

