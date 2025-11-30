.PHONY: help setup build test clean docker-build docker-run lint format

# Default target
help: ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'

# Environment setup
setup: ## Set up development environment
	@echo "Setting up development environment..."
	conda create -n ros-foxy python=3.8 -y
	conda activate ros-foxy && pip install -r requirements.txt

# Build the ROS package
build: ## Build the ROS package
	@echo "Building ROS package..."
	export PATH="/home/sokhib/workspaces/runtimes/miniconda3/envs/ros-foxy/bin:$$PATH" && \
	export CONDA_PREFIX="/home/sokhib/workspaces/runtimes/miniconda3/envs/ros-foxy" && \
	source /opt/ros/foxy/setup.bash && \
	colcon build --symlink-install

# Run tests
test: ## Run the test suite
	@echo "Running tests..."
	export PATH="/home/sokhib/workspaces/runtimes/miniconda3/envs/ros-foxy/bin:$$PATH" && \
	export CONDA_PREFIX="/home/sokhib/workspaces/runtimes/miniconda3/envs/ros-foxy" && \
	source /opt/ros/foxy/setup.bash && \
	source install/setup.bash && \
	colcon test --packages-select turtlebot3_automation

# Run maintenance monitor
run-maintenance: ## Run the maintenance monitor
	@echo "Running maintenance monitor..."
	export PATH="/home/sokhib/workspaces/runtimes/miniconda3/envs/ros-foxy/bin:$$PATH" && \
	export CONDA_PREFIX="/home/sokhib/workspaces/runtimes/miniconda3/envs/ros-foxy" && \
	source /opt/ros/foxy/setup.bash && \
	source install/setup.bash && \
	ros2 run turtlebot3_automation maintenance_monitor

# Run navigation stack
run-navigation: ## Run the navigation stack
	@echo "Running navigation stack..."
	export PATH="/home/sokhib/workspaces/runtimes/miniconda3/envs/ros-foxy/bin:$$PATH" && \
	export CONDA_PREFIX="/home/sokhib/workspaces/runtimes/miniconda3/envs/ros-foxy" && \
	source /opt/ros/foxy/setup.bash && \
	source install/setup.bash && \
	ros2 launch turtlebot3_automation navigation_only.launch.py

# Run object detection
run-detection: ## Run object detection
	@echo "Running object detection..."
	export PATH="/home/sokhib/workspaces/runtimes/miniconda3/envs/ros-foxy/bin:$$PATH" && \
	export CONDA_PREFIX="/home/sokhib/workspaces/runtimes/miniconda3/envs/ros-foxy" && \
	source /opt/ros/foxy/setup.bash && \
	source install/setup.bash && \
	ros2 run turtlebot3_automation yolo_detector

# Docker commands
docker-build: ## Build Docker image
	@echo "Building Docker image..."
	docker build -t turtlebot3-automation .

docker-run: ## Run Docker container
	@echo "Running Docker container..."
	docker run -it --rm turtlebot3-automation

# Code quality
lint: ## Run linting
	@echo "Running linting..."
	flake8 src/turtlebot3_automation/turtlebot3_automation --max-line-length=100

format: ## Format code with black
	@echo "Formatting code..."
	black src/turtlebot3_automation/turtlebot3_automation --line-length=100

# Clean build artifacts
clean: ## Clean build artifacts
	@echo "Cleaning build artifacts..."
	rm -rf build/ install/ log/