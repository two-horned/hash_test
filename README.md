# Tiny Hash

I have written my own small hash function. My aim was to
make it easy to compute but still very difficult to trace
the hashed value back to the the original key word. I achieved
this by dynamically changing the offset based on the current hash
and input character for each step the new hash value is being computed.

# Features
+ Simple. Basically a one-liner.
+ Really fast. Can be used to index a hash map.
+ Really secure. It's difficult to find the key from a given hash value.
+ Expandable. Implementation can be rewritten for various sizes.

# Convince yourself?
Run following (requires gnuplot)
```bash
make build run
```
to generate plot-pictures and see the various hash values
of words inside `word.txt`. As one can see,
the values for TinyHash are spread out evenly,
and almost patternless. One can compare the map with
the map of other hash functions.

Run following
```bash
make build bench
```

to compare the time spend to hash all values in `word.txt` for various
hash functions. TinyHash is comparably fast to all
the other simple implementations of a hashing function for 64-bit integers.
