USE: io
IN: hello

: hello ( -- )
    "Hello, Factor-Script!\nこんにちは、ファクタースクリプト！" print ;

MAIN: hello
! REPLの場合、
! hello
! が必要

! REPLで読み込む場合
! IN: scratchpad "./hello.factor" run-file
! Loading ./hello.factor
! Hello, Factor-Script!

! なお、コマンドプロンプトでは日本語はutf8でもsjisでも文字化け
