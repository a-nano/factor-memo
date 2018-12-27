## auto-use
�����I�ɕK�v�ȃ��C�u������ǂݍ��ށB
```factor
IN: scratchpad auto-use
IN: scratchpad auto-use 10 '[ 10 sq _ / ] call .
1: Note:
Added "fry" vocabulary to search path
10
```
(http://docs.factorcode.org/content/word-auto-use,parser.html)
<br><br>

## Word�̒�`���Q�Ƃ���
\��see��g�ݍ��킹��B
```factor
IN: scratchpad auto-use \ sq see
USING: kernel;
IN: math
:sq ( x -- y ) dup * ; inline
```
(http://docs.factorcode.org/content/word-see,see.html)
<br><br>

## Stack�̒������邾��
Stack�̒��������炸�Ɍ��邾���Ȃ�`.s`���g���B
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
if��TOS�̐^�U��]�����ăN�H�[�e�[�V������]������B
TOS�͏�����B
�܂��Af�ȊO��t�ł���B
��̃N�H�[�e�[�V�������̔z��Ɏ����Ă�t�ł���B
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
TOS�̐��l���񐔂Ƃ��ăN�H�[�e�[�V�������J�肩�����]������B
```factor
IN: scratchpad auto-use 3 [ "I might be wrong." print ] times
I might be wrong.
I might be wrong.
I might be wrong.
```
<br>

## each
�e��̊e�v�f�ɑ΂��ď��������s�������Ƃ���`each`���g���B
each�͔z��̊e�v�f��push���铮��𔺂��B
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
`map`�̓N�H�[�e�[�V������K�p�����z���push����B
```factor
IN: scratchpad auto-use { 1 2 3 } [ sq ] map .
{ 1 4 9 }
```
<br>

## filter
`filter`�͔z����N�H�[�e�[�V�����Ńt�B���^�[����B
```factor
IN: scratchpad auto-use { 0 1 2 } [ zero? not ] filter .
{ 1 2 }
```
(http://oss.infoscience.co.jp/factor/docs.factorcode.org/content/article-cookbook-combinators.html)
<br><br>

## �V���{���̃_�C�i�~�b�N�X�R�[�v
`SYMBOL:`�Ő錾�����V���{���̓_�C�i�~�b�N�X�R�[�v�����B
`with-scope`�̓X�R�[�v���Ǐ�������B
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
`print`�ɂ�str��n���K�v������̂ŁA`number>string`���g���B

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

## R/�̌�ɃX�y�[�X���I
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
�t�@�C���̓��e���t�B���^�[���Ă݂�B
```factor
IN: scratchpad auto-use "./sample.txt" ascii file-lines [ R/ regex/ re-contains? ] filter
1: Note:
Added "io.encodings.ascii" vocabulary to search path

--- Data stack:
{ "Number 3 regex" }
```
`re-contains?`�͂��̍s�ɐ��K�\�����}�b�`���镶���񂪊܂܂�Ă��邩�H���`�F�b�N���邩��"Number 3 regex"���擾�ł���B
�s�Ƀ}�b�`������Ƃ����R�����e�L�X�g�ł�`matches?`�̂��̎g�����͂��܂������Ȃ��B
```factor
IN: scratchpad auto-use "./sample.txt" ascii file-lines [ R/ regex/ matches? ] filter .
{ }
```
`matches?`���g���̂ł���΁A�s�S�̂Ƀ}�b�`���Ȃ���΂����Ȃ�����A�������͂����B
```factor
IN: scratchpad auto-use "./sample.txt" ascii file-lines [ R/ ^.+?regex.*?$/ matches? ] filter .
{ "Number 3 regex" }
```
�܂�sed�I�Ȏg����������Ȃ�`re-contains?���K�؂Ƃ������ƁB
<br><br>

## re-replace

(http://docs.factorcode.org/content/article-regexp-options.html)
��̃y�[�W������ƁAg���Ȃ��E�E�E�B
�Ă̒�A����͓����Ȃ��B
```factor
IN: scratchpad auto-use "foo foo bar baz" R/ foo/g "hoge" re-replace .
1: "foo foo bar baz" R/ foo/g "hoge" re-replace.
                     ^
nonexistent-option
name 103

Type :help for debuging help.
```
�Ȃ�ق�`re-replace`�̓f�t�H���g�ŃO���[�o���}�b�`�̂悤���B

```factor
IN: scratchpad auto-use "foo foo bar baz" R/ foo/ "hoge" re-replace

--- Data stack:
"hoge hoge bar baz"
```
(http://docs.factorcode.org/content/word-re-replace,regexp.html)
<br>
���Ⴀ�A�ŏ��̃}�b�`�����u������ɂ́H