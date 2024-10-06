build:
	gcc -o hash_test hash_test.c
run:
	cat words.txt | ./hash_test|awk -F ',' 'NR>1 {print$$1}'|awk '{print$$2}' > tiny_hash.txt
	cat words.txt | ./hash_test|awk -F ',' 'NR>1 {print$$2}'|awk '{print$$2}' > dj2b_hash.txt
	cat words.txt | ./hash_test|awk -F ',' 'NR>1 {print$$3}'|awk '{print$$2}' > sdbm_hash.txt
	cat words.txt | ./hash_test|awk -F ',' 'NR>1 {print$$4}'|awk '{print$$2}' > lose_lose_hash.txt
	gnuplot gnuplot.plt
bench:
	while true; do; ./hash_test words.txt; sleep 1; done
