all=exit

#gcc -static -g  $< -o $@
exit:exit.c
	gcc $< -o $@

exit.s:exit.c
	gcc -S $< 

clean:
	rm ${all}
