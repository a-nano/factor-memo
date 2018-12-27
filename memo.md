## auto-use
自動的に必要なライブラリを読み込む。
```factor
IN: scratchpad auto-use
IN: scratchpad auto-use 10 '[ 10 sq _ / ] call .
1: Note:
Added "fry" vocabulary to search path
10
```

(http://docs.factorcode.org/content/word-auto-use,parser.html)
<br><br>

## Wordの定義を参照する
\とseeを組み合わせる。
```factor
IN: scratchpad auto-use \ sq see
USING: kernel;
IN: math
:sq ( x -- y ) dup * ; inline
```

(http://docs.factorcode.org/content/word-see,see.html)
<br><br>

## Stackの中を見るだけ
Stackの中をいじらずに見るだけなら`.s`を使う。
```factor
IN: scratchpad auto-use 1 2 3

---Data stack:
1
2
3
IN: scratchpad auto-use .s
1
2
3
```
<br><br>
