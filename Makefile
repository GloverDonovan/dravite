SOURCES := $(wildcard src/*.cr src/dravite/*.cr src/dravite/**/*.cr)

bin/drav: ${SOURCES}
	@mkdir -p bin
	@crystal build src/dravite.cr -o bin/drav --stats | lolcat
