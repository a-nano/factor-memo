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
