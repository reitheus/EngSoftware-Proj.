CXX = g++

CXXFLAGS = -Wall

SRC_DIR = src
BIN_DIR = bin
TEST_DIR = tests/functional
TEST_TARGET = $(BIN_DIR)/testeRegressivo.exe

SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)%.cpp,$(BIN_DIR)/%.o,$(SRCS))

TEST_SRCS = $(wildcard $(TEST_DIR)/*.cpp)
TEST_OBJS = $(patsubst $(TEST_DIR)/%.cpp,$(BIN_DIR)/%.test.o,$(TEST_SRCS))

all: $(TARGET) $(STATIC_LIB) $(SHARED_LIB) $(TEST_TARGET)
# Compilar objetos de teste
$(BIN_DIR)/%.test.o: $(TEST_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Gerar executável de teste
$(TEST_TARGET): $(OBJS) $(TEST_OBJS)
	$(CXX) $^ -o $@

# Incluir no build
TARGET = $(BIN_DIR)/prog

clean:
	rm -rf $(BIN_DIR)/*