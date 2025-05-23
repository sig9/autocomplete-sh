#!/usr/bin/env bats

setup() {
    # Install autocomplete.sh from the repository in development mode
    ./docs/install.sh dev

    # Source bashrc to make sure autocomplete is available in the current session
    source ~/.bashrc

    # Assert OPENAI_API_KEY is set
    if [ -z "$OPENAI_API_KEY" ]; then
        echo "ERROR: OPENAI_API_KEY is not set. Please set the environment variable before running the tests."
        exit 1
    fi
}

teardown() {
    # Remove autocomplete.sh installation
    autocomplete remove -y
}

@test "which autocomplete returns something" {
    run which autocomplete
    [ "$status" -eq 0 ]
    [ -n "$output" ]
}

@test "autocomplete returns a string containing autocomplete.sh (case insensitive)" {
    run autocomplete
    [ "$status" -eq 0 ]
    [[ "$output" =~ [Aa]utocomplete\.sh ]]
}

@test "autocomplete model gpt4o-mini and then config should have the string gpt4o-mini" {
    run autocomplete model openai gpt-4o-mini
    [ "$status" -eq 0 ]

    run autocomplete config
    [ "$status" -eq 0 ]
    [[ "$output" =~ gpt-4o-mini ]]
}

@test "autocomplete command 'ls # show largest files' should return something" {
    run autocomplete command "ls # show largest files"
    [ "$status" -eq 0 ]
    [ -n "$output" ]
}
