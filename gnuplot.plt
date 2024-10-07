#!/usr/bin/gnuplot
set terminal png size 1920,1080
set pointsize 0.1

set title "TinyHash"
set output 'tiny_hash.png'
plot "tiny_hash.txt"
set title "djb2"
set output 'djb2_hash.png'
plot "djb2_hash.txt"
set title "sdbm"
set output 'sdbm_hash.png'
plot "sdbm_hash.txt"
set title "lose-lose"
set output 'lose-lose_hash.png'
plot "lose-lose_hash.txt"
set title "java"
set output 'java_hash.png'
plot "java_hash.txt"
