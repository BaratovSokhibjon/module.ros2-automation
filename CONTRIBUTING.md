# Contributing to TurtleBot3 Automation Suite

Thank you for your interest in contributing to the TurtleBot3 Automation Suite! This document provides guidelines and information for contributors.

## Development Setup

1. **Clone and setup the project** following the [README](README.md) instructions
2. **Install development dependencies**:
   ```bash
   pip install pre-commit black flake8
   pre-commit install
   ```

## Code Style

This project uses:
- **Black** for code formatting (100 character line length)
- **Flake8** for linting
- **Pre-commit hooks** for automated quality checks

Run formatting and linting:
```bash
make format  # Format code with black
make lint    # Run linting checks
```

## Testing

- Run tests with: `make test`
- Add tests for new features in `src/turtlebot3_automation/tests/`
- Ensure all tests pass before submitting PRs

## Pull Request Process

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature-name`
3. Make your changes following the code style
4. Add tests for new functionality
5. Ensure all tests pass and code is formatted
6. Submit a pull request with a clear description

## Commit Messages

Use clear, descriptive commit messages:
- `feat: add new navigation feature`
- `fix: resolve object detection bug`
- `docs: update installation instructions`

## Reporting Issues

When reporting bugs, please include:
- ROS 2 version and Ubuntu version
- Steps to reproduce the issue
- Expected vs actual behavior
- Any relevant log output

## Feature Requests

Feature requests are welcome! Please:
- Check if the feature already exists or is planned
- Provide a clear description of the proposed feature
- Explain the use case and benefits

## Code of Conduct

This project follows a code of conduct to ensure a welcoming environment for all contributors. Please be respectful and constructive in all interactions.