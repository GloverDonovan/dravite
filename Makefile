bin/drav: src/dravite.cr
	@mkdir -p bin
	@crystal build src/dravite.cr -o bin/drav --stats | lolcat
