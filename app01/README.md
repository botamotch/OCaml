# OCamlで数値計算

## gnuplot
### ウィンドウに表示
```
> set term qt
> plot 'input.txt' with lines lt -1
```

### 画像に保存
```sh
$ gnuplot << EOF
set term espcairo
set output 'input.eps'
plot 'input.txt' with lines lt -1
set output
EOF
```

