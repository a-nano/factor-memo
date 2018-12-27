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
<br>

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
<br>

## times
TOSの数値を回数としてクォーテーションを繰りかえし評価する。
```factor
IN: scratchpad auto-use 3 [ "I might be wrong." print ] times
I might be wrong.
I might be wrong.
I might be wrong.
```
<br>

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
<br>

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

## with-file-writer
```factor
IN: scratchpad auto-use USE: io.encodings.utf8
IN: scratchpad auto-use "sample.txt" utf8 [ { 1 2 3 } [ "Number " write number>string print ] each ] with-file-writer

% less sample.txt
Number 1
Number 2
Number 3
```
`print`にはstrを渡す必要があるので、`number>string`を使う。

(http://docs.factorcode.org/content/word-with-file-writer%2Cio.files.html)
<br><br>

## with-file-reader
```factor
IN: scratchpad auto-use USING: io kernel ;
IN: scratchpad auto-use "sample.txt" utf8 [ [ print ] each-line ] with-file-reader
Number 1
Number 2
Number 3
```
(http://docs.factorcode.org/content/word-with-file-reader,io.files.html)
<br><br>

## factor regexp
(http://docs.factorcode.org/content/article-regexp-intro.html)
<br><br>

## R/の後にスペースを！
```factor
IN: scratchpad auto-use "foo bar" R/ foo// "bar" re-replace .
1: Note:
Added "regexp" vocabulary to search path
"bar bar"
```
<br>

## regexp words
sample.txt
```
% less sample.txt
Number 1 stack
Number 2 words
Number 3 regex
```
<br>

### re-contains? / matches?
ファイルの内容をフィルターしてみる。
```factor
IN: scratchpad auto-use "./sample.txt" ascii file-lines [ R/ regex/ re-contains? ] filter
1: Note:
Added "io.encodings.ascii" vocabulary to search path

--- Data stack:
{ "Number 3 regex" }
```
`re-contains?`はその行に正規表現がマッチする文字列が含まれているか？をチェックするから"Number 3 regex"を取得できる。
行にマッチさせるというコンンテキストでは`matches?`のこの使い方はうまくいかない。
```factor
IN: scratchpad auto-use "./sample.txt" ascii file-lines [ R/ regex/ matches? ] filter .
{ }
```
`matches?`を使うのであれば、行全体にマッチしなければいけないから、正しくはこう。
```factor
IN: scratchpad auto-use "./sample.txt" ascii file-lines [ R/ ^.+?regex.*?$/ matches? ] filter .
{ "Number 3 regex" }
```
つまりsed的な使い方をするなら`re-contains?が適切ということ。
<br><br>

## re-replace

(http://docs.factorcode.org/content/article-regexp-options.html)
上のページを見ると、gがない・・・。
案の定、これは動かない。
```factor
IN: scratchpad auto-use "foo foo bar baz" R/ foo/g "hoge" re-replace .
1: "foo foo bar baz" R/ foo/g "hoge" re-replace.
                     ^
nonexistent-option
name 103

Type :help for debuging help.
```
なるほど`re-replace`はデフォルトでグローバルマッチのようだ。

```factor
IN: scratchpad auto-use "foo foo bar baz" R/ foo/ "hoge" re-replace

--- Data stack:
"hoge hoge bar baz"
```
(http://docs.factorcode.org/content/word-re-replace,regexp.html)
<br>
じゃあ、最初のマッチだけ置換するには？