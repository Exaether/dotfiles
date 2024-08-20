#!/bin/sh

BLANK='#00000000'
BACKGROUND='#101010'
CLEAR='#ffffff22'
DEFAULT='#FF7000'
TEXT='#FFCD80'
#WRONG='#a61839'
VERIFYING='#FF7000'
WRONG='#ff0000'

i3lock \
--insidever-color=$BACKGROUND     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$BACKGROUND   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BACKGROUND   \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$TEXT         \
--bshl-color=$WRONG          \
\
--screen 1                   \
--blur 10                     \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%d/%m/%Y"       \
