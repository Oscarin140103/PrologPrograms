# Makefile para programas Prolog

# Compilador de Prolog
PROLOG = swipl

# Lista de archivos .pl
FILES = $(wildcard *.pl)

# Objetivo por defecto
all: run

# Ejecutar todos los archivos
run: $(FILES)
	@for file in $(FILES); do \
		echo "Ejecutando $$file..."; \
		$(PROLOG) -s $$file -g main -t halt; \
	done

# Limpiar archivos generados (si es necesario)
clean:
	rm -f *.o

.PHONY: all run clean

