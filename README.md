# Tiny Hash
I have written my own small hash function. My aim was easy computation
while making it difficult to trace back the key word from a given hash.
I achieved this by dynamically changing the offset based on the current hash
and input character - for each step the hash value is being updated.

## Code
My code was written in the programming language C.
```c
unsigned long
tiny_hash(char *str)
{
  unsigned long hash = 0;
  int c;

  while ((c = *str++))
    hash ^= (hash - c) << ((hash + c) & 63);

  return hash;
}
```

## Features
+ Simple: Basically a one-liner.
+ Fast: Can be used to index a hash map.
+ Secure: It's difficult to find the key from a given hash value.
+ Expandable: Implementation can be rewritten for various sizes.

## Convince yourself?
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