# Variables
APP_NAME = goKart
CMD_PATH = ./cmd/main.go
MIGRATE_PATH = ./cmd/migrate/main.go
MIGRATIONS_DIR = ./cmd/migrate/migrations
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
	@if [ ! -d "$(BUILD_DIR)" ]; then mkdir -p $(BUILD_DIR); fi
	$(GO_BUILD) -o $(BUILD_DIR)/$(APP_NAME) $(CMD_PATH)

# Run the project
run:
	@echo "Running $(APP_NAME)..."
	$(GO_RUN) $(CMD_PATH)

# Database migrations
migrate-up:
	@echo "Running database migrations: up..."
	$(GO_RUN) $(MIGRATE_PATH) up

migrate-down:
	@echo "Running database migrations: down..."
	$(GO_RUN) $(MIGRATE_PATH) down

migration:
	@migrate create -ext sql -dir $(MIGRATIONS_DIR) $(filter-out $@,$(MAKECMDGOALS))

# Clean build artifacts
clean:
	@echo "Cleaning up..."
	@rm -rf $(BUILD_DIR)

# Run tests
test:
	@echo "Running tests..."
	$(GO_TEST) ./...

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
	@echo "  build          Build the project"
	@echo "  run            Run the project"
	@echo "  migrate-up     Run database migrations: up"
	@echo "  migrate-down   Run database migrations: down"
	@echo "  migration      Create a new database migration"
	@echo "  clean          Remove build artifacts"
	@echo "  test           Run all tests"
	@echo "  lint           Lint the code"
	@echo "  fmt            Format the code"
	@echo "  help           Display this help message"
