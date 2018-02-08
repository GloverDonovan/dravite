bin/drav: dravite.cr
	@mkdir -p bin
	@crystal build dravite.cr -o bin/drav --stats | lolcat
