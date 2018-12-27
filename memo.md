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

## if
ifはTOSの真偽を評価してクォーテーションを評価する。
TOSは消費される。
また、f以外はtである。
空のクォーテーションや空の配列に至ってもtである。
```factor
IN: scratchpad auto-use 1 [ "T" ] [ "F" ] if print
T
IN: scratchpad auto-use 0 [ "T" ] [ "F" ] if print
T
IN: scratchpad auto-use -1 [ "T" ] [ "F" ] if print
T
IN: scratchpad auto-use "" [ "T" ] [ "F" ] if print
T
IN: scratchpad auto-use [ ] [ "T" ] [ "F" ] if print
T
IN: scratchpad auto-use { } [ "T" ] [ "F" ] if print
T
IN: scratchpad auto-use t [ "T" ] [ "F" ] if print
T
IN: scratchpad auto-use f [ "T" ] [ "F" ] if print
F
```
<br><br>

## times
TOSの数値を回数としてクォーテーションを繰りかえし評価する。
```factor
IN: scratchpad auto-use 3 [ "I might be wrong." print ] times
I might be wrong.
I might be wrong.
I might be wrong.
```
<br><br>

## each
各列の各要素に対して処理を実行したいときは`each`を使う。
eachは配列の各要素をpushする動作を伴う。
```factor
IN: scratchpad auto-use { 1 2 3 } [ ] each

--- Data stack:
1
2
3

IN: scratchpad auto-use clear

IN: scratchpad auto-use 10 { 1 2 3 } [ over swap - . ] each
9
8
7

--- Data stack:
10
```
<br><br>

## map
`map`はクォーテーションを適用した配列をpushする。
```factor
IN: scratchpad auto-use { 1 2 3 } [ sq ] map .
{ 1 4 9 }
```
<br><br>

## filter
`filter`は配列をクォーテーションでフィルターする。
```factor
IN: scratchpad auto-use { 0 1 2 } [ zero? not ] filter .
{ 1 2 }
```

(http://oss.infoscience.co.jp/factor/docs.factorcode.org/content/article-cookbook-combinators.html)
<br><br>

## シンボルのダイナミックスコープ
`SYMBOL:`で宣言したシンボルはダイナミックスコープを持つ。
`with-scope`はスコープを局所化する。
```factor
IN: scratchpad auto-use SYMBOL: foo
IN: scratchpad auto-use "outer" foo set [ "inner" foo set foo get print ] with-scope foo get print
inner
outer
```

(http://oss.infoscience.co.jp/factor/docs.factorcode.org/content/article-cookbook-variables.html)
<br><br>
