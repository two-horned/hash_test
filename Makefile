build:
	cc -o hash_test hash_test.c
	strip ./hash_test

run:
	./hash_test words.txt
	gnuplot gnuplot.plt

bench:
	while true; do; ./hash_test words.txt; sleep 1; done

clean:
	rm ./*hash.txt ./*hash.png
