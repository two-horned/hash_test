#!/usr/bin/gnuplot
set terminal png size 1920,1080

set title "TinyHash"
set output 'tiny_hash.png'
plot "tiny_hash.txt"
set title "dj2b"
set output 'dj2b_hash.png'
plot "dj2b_hash.txt"
set title "sdbm"
set output 'sdbm_hash.png'
plot "sdbm_hash.txt"
set title "lose-lose"
set output 'lose_lose_hash.png'
plot "lose_lose_hash.txt"
