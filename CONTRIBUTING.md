# Contributing

First of all, thank you for contributing. Any contribution is highly appreciated and welcome.

## Testing

Unit tests are stored in the `./tests` directory, with the `(filename).test.fish` naming scheme.
To run the unit tests, simply run:

```sh
./tests/run.fish
```

The unit tests will create their own temporary fish environment, so your local fish and spacefish configuration will not affect the unit test run.

### Will it slow down the prompt?

Every additional section will slow down the prompt a little bit. If your section performs any expensive checks, find a way to make it faster.

* **Good:** check if a command exists, check the value of an environment variable
* **Bad:** network requests, reading large files, etc

## Documentation

When updating documentation for your section, make sure the markdown document is being properly rendered by Github. Specifically, the following common pitfalls have already been discovered:

* Empty inline code blocks ` ` will only be rendered if you put at least one non-breaking whitespace "&nbsp;" inside, like so: `` ` ` `` → ` `
* Leading and trailing whitespaces in inline code blocks will be stripped, to indicate that a whitespace is present, use the middot symbol `·`, like so: `` `🐟·` `` → `🐟·`
