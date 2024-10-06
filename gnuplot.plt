#!/usr/bin/gnuplot -persist
set term qt 0
plot "tiny_hash.txt"
set term qt 1
plot "dj2b_hash.txt"
set term qt 2
plot "sdbm_hash.txt"
set term qt 3
plot "lose_lose_hash.txt"
