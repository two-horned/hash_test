#include <inttypes.h>
#include <stdio.h>
#include <time.h>

#define SEED 65599
#define ELEMENTS(a) sizeof a / sizeof a[0]

unsigned long
tiny_hash(char *str)
{
  unsigned long hash = 0;
  int c;

  while ((c = *str++))
    hash ^= (hash - c) << ((hash + c) & 63);

  return hash;
}

unsigned long
dj2b_hash(char *str)
{
    unsigned long hash = 5381;
    int c;

    while ((c = *str++))
        hash = ((hash << 5) + hash) + c; /* hash * 33 + c */

    return hash;
}

unsigned long
sdbm_hash(char *str)
{
    unsigned long hash = 0;
    int c;

    while ((c = *str++))
        hash = c + (hash << 6) + (hash << 16) - hash;

    return hash;
}

unsigned long
lose_lose_hash(char *str)
{
  unsigned int hash = 0;
  int c;

  while ((c = *str++))
    hash += c;

  return hash;
}


int
main(int argc, char* argv[])
{
  char str[47];
  unsigned long (*hash_functions[]) (char *)
    = {tiny_hash, dj2b_hash, sdbm_hash, lose_lose_hash};
  char *hash_function_names[]
    = {"Tiny", "dj2b", "sdbm", "lose-lose"};

  if (argc != 2) {
    puts("No arguments detected. Reading from STDIN and printing hashed values...");
    while (fgets(str, sizeof str, stdin)) {
      for (int i = 0; i < ELEMENTS(hash_functions); ++i)
        printf("%s: %lu, ", hash_function_names[i], hash_functions[i](str));
      printf("%s", str);
    }
    return 1;
  }

  puts("Warming up...");
  for (int i = 0; i < ELEMENTS(hash_functions); ++i) {
    FILE *f = fopen(argv[1], "r");
    while (fgets(str, sizeof str, f))
      hash_functions[i](str);
  }

  puts("Testing...");
  for (int i = 0; i < ELEMENTS(hash_functions); ++i) {
    FILE *f = fopen(argv[1], "r");
    clock_t start = clock();
    while (fgets(str, sizeof str, f))
      hash_functions[i](str);
    printf("%s: %ld\n", hash_function_names[i], clock() - start);
  }
  puts("");
}
