# Define the names of the executables
HASKELL_EXEC = .bin/coffee_maker_hs
OCAML_EXEC = .bin/coffee_maker_ocaml

# Define the source files
HASKELL_SRC = CoffeeMaker.hs
OCAML_SRC = CoffeeMaker.ml

# Create the .bin directory if it does not exist
BIN_DIR = .bin

# Rule to build the Haskell program
build_haskell:
	@mkdir -p $(BIN_DIR)
	@ghc -o $(HASKELL_EXEC) $(HASKELL_SRC)

# Rule to build the OCaml program
build_ocaml:
	@mkdir -p $(BIN_DIR)
	@ocamlc -o $(OCAML_EXEC) $(OCAML_SRC)

# Rule to build both Haskell and OCaml programs
build: build_haskell build_ocaml

# Rule to run both Haskell and OCaml programs
run: build
	@echo "---- Haskell ----"
	@./$(HASKELL_EXEC)
	@echo "---- OCaml ----"
	@./$(OCAML_EXEC)

# Rule to clean up build artifacts
clean:
	rm -f $(HASKELL_EXEC) $(OCAML_EXEC)

# Default rule to build and run
all: run
