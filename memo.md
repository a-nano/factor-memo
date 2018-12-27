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
<br><br>

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
<br><br>

## times
TOS�̐��l���񐔂Ƃ��ăN�H�[�e�[�V�������J�肩�����]������B
```factor
IN: scratchpad auto-use 3 [ "I might be wrong." print ] times
I might be wrong.
I might be wrong.
I might be wrong.
```
<br><br>

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
<br><br>

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
