NAME = main.pdf
TARGET = main
BUILD_DIR = build
DIRS = /bibliography /build /chapters /front /Images /members /References /sumary
BIB_FILE = References/references.bib
OBJ = $(addprefix $(BUILD_DIR), $(DIRS))

all: ${NAME}

$(NAME): $(BUILD_DIR)
	@pdflatex -output-directory=$(BUILD_DIR) -include-directory=.m $(TARGET).tex
	@bibtex $(BUILD_DIR)/$(TARGET)
	@pdflatex -output-directory=$(BUILD_DIR) -include-directory=. $(TARGET).tex
	@echo "Se tudo deu certo o pdf estará na pasta build/ como main.pdf"

$(BUILD_DIR):
	mkdir -p $(OBJ)

#REMOVE OBJ FILES
clean:
	rm -rf $(BUILD_DIR)
	rm -rf $(shell find . -name "*.log" -o -name "*.aux" -o -name "*.toc" -o -name "*.gz" -o -name "*.fls" -o -name "*.fdb_latexmk" -o -name "*.bbl" -o -name "*.blg" | tr '\n' ' ')

#REMOVE OBJ FILES AND PDF
fclean: clean
	rm -rf ${NAME}

re: fclean all

.PHONY: all clean fclean re