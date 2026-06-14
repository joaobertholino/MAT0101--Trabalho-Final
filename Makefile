NAME = main.pdf

all: ${NAME}

$(NAME):
	pdflatex -output-directory=build main.tex

clean:
	rm -rf build/
	rm -rf $(shell find . -name "*.log" -o -name "*.aux" -o -name "*.toc" -o -name "*.gz" -o -name "*.fls" -o -name "*.fdb_latexmk" | tr '\n' ' ')

fclean: clean
	rm -rf ${NAME}

.PHONY: all clean fclean