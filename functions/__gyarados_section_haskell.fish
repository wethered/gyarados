#
# Haskell Stack
#
# An advanced, purely functional programming language.
# Link: https://www.haskell.org/

function __gyarados_section_haskell -d "Show current version of Haskell Tool Stack"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_HASKELL_SHOW true
	__gyarados_util_set_default GYARADOS_HASKELL_PREFIX $GYARADOS_PROMPT_DEFAULT_PREFIX
	__gyarados_util_set_default GYARADOS_HASKELL_SUFFIX $GYARADOS_PROMPT_DEFAULT_SUFFIX
	__gyarados_util_set_default GYARADOS_HASKELL_SYMBOL "λ "
	__gyarados_util_set_default GYARADOS_HASKELL_COLOR red

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	# Show current version of Haskell Tool Stack.
	[ $GYARADOS_HASKELL_SHOW = false ]; and return

	# Ensure the stack command is available
	type -q stack; or return

	# If there are stack files in current directory
	[ -f ./stack.yaml ]; or return

	set -l haskell_version (stack ghc -- --numeric-version --no-install-ghc)

	__gyarados_lib_section \
		$GYARADOS_HASKELL_COLOR \
		$GYARADOS_HASKELL_PREFIX \
		"$GYARADOS_HASKELL_SYMBOL"v"$haskell_version" \
		$GYARADOS_HASKELL_SUFFIX
end
