# Define the name of the executable
EXEC = .bin/coffee_maker_hs

# Define the Haskell source files
SRC = CoffeeMaker.hs

# Create the .bin directory if it does not exist
BIN_DIR = .bin

# Rule to build the Haskell program
build:
	mkdir -p $(BIN_DIR)
	ghc -o $(EXEC) $(SRC)

# Rule to run the Haskell program
run: build
	./$(EXEC)

# Rule to clean up build artifacts
clean:
	rm -f $(EXEC)

# Default rule to build and run
all: run
