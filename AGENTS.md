# Agent Guidelines for Autocomplete.sh

These instructions apply to the entire repository.

## Testing
- Run `./run_tests.sh` and ensure all tests pass before committing.
- The tests require `bats`. Install with `sudo apt install bats` if not available.
- Ensure the environment variable `OPENAI_API_KEY` is set when running tests.

## Style
- Use POSIX-compatible shell scripting in `.sh` and `.zsh` files.
- Run `pre-commit run --files <changed files>` to lint scripts with `shellcheck`.
- Avoid committing secrets or API keys.

## Documentation
- Update README.md or USAGE.md when adding new commands or configuration options.

