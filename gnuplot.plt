#!/usr/bin/gnuplot
set terminal png size 1920,1080
set pointsize 0.1
set xlabel "key"
set ylabel "hash"

set title "TinyHash"
set output 'tiny_hash.png'
plot "tiny_hash.txt"
set title "TinyHashv2"
set output 'tiny2_hash.png'
plot "tiny2_hash.txt"
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
set title "FNV-1a (example)"
set output 'fnv_1a_example_hash.png'
plot "fnv-1a_example_hash.txt"
