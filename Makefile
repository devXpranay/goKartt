# Variables
APP_NAME = goKart
CMD_PATH = ./cmd/main.go
BUILD_DIR = ./bin

# Go commands
GO_BUILD = go build
GO_RUN = go run
GO_TEST = go test
GO_LINT = golint
GOFMT = gofmt -l -w

# Default target
default: build

# Build the project
build:
	@echo "Building $(APP_NAME)..."
	@mkdir -p $(BUILD_DIR)
	$(GO_BUILD) -o $(BUILD_DIR)/$(APP_NAME) $(CMD_PATH)

# Run the project
run:
	@echo "Running $(APP_NAME)..."
	$(GO_RUN) $(CMD_PATH)

# Clean build artifacts
clean:
	@echo "Cleaning up..."
	@rm -rf $(BUILD_DIR)

# Run tests
test:
	@echo "Running tests..."
	$(GO_TEST) -v ./...

# Lint the code
lint:
	@echo "Linting the code..."
	$(GO_LINT) ./...

# Format the code
fmt:
	@echo "Formatting the code..."
	$(GOFMT) ./

# Help
help:
	@echo "Makefile targets:"
	@echo "  build      Build the project"
	@echo "  run        Run the project"
	@echo "  clean      Remove build artifacts"
	@echo "  test       Run all tests"
	@echo "  lint       Lint the code"
	@echo "  fmt        Format the code"
	@echo "  help       Display this help message"
