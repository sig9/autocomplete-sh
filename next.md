# Next Steps for Multi-Model Support via Litellm

The repository currently supports OpenAI, Groq, Anthropic, and Ollama models. To enable additional models through the litellm endpoint at `https://llm.co.sig9.dev`, consider the following changes:

1. **Add a new provider** `litellm` in both `autocomplete.sh` and `autocomplete.zsh`.
2. **Fetch models dynamically** by querying the litellm endpoint (e.g. `GET $ACSH_ENDPOINT/models`) at runtime instead of hard-coding the list.
3. **Introduce a configuration option** for `LITELLM_API_KEY` and allow setting a custom endpoint (`ACSH_ENDPOINT`).
4. **Update the payload builder** so the request format matches what the litellm service expects. The provider should behave similarly to the OpenAI API.
5. **Update the `model` command** to accept litellm models and switch the active provider accordingly.
6. **Add tests** in `tests/test_autocomplete.bats` to exercise the new provider and ensure completions work when the environment variables are set.
7. **Document usage** in README.md and USAGE.md, including example commands for configuring the API key and endpoint.

