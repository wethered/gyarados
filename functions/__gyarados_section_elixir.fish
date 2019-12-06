#
# Elixir
#
# A dynamic, reflective, object-oriented, general-purpose programming language.
# Link: https://www.elixir-lang.org/

function __gyarados_section_elixir -d "Show current version of Elixir"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_ELIXIR_SHOW true
	__gyarados_util_set_default GYARADOS_ELIXIR_PREFIX $GYARADOS_PROMPT_DEFAULT_PREFIX
	__gyarados_util_set_default GYARADOS_ELIXIR_SUFFIX $GYARADOS_PROMPT_DEFAULT_SUFFIX
	__gyarados_util_set_default GYARADOS_ELIXIR_SYMBOL "💧 "
	__gyarados_util_set_default GYARADOS_ELIXIR_DEFAULT_VERSION $GYARADOS_ELIXIR_DEFAULT_VERSION
	__gyarados_util_set_default GYARADOS_ELIXIR_COLOR magenta

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	# Check if that user wants to show elixir version
	[ $GYARADOS_ELIXIR_SHOW = false ]; and return

	# Show versions only for Elixir-specific folders
	if not test -f mix.exs \
		-o (count *.ex) -gt 0 \
		-o (count *.exs) -gt 0
		return
	end

	set -l elixir_version

	if type -q kiex
		set elixir_version $ELIXIR_VERSION
	else if type -q exenv
		set elixir_version (exenv version-name)
	else if type -q elixir
		set elixir_version (elixir -v 2>/dev/null | string match -r "Elixir.*" | string split " ")[2]
	else
		return
	end

	[ -z "$elixir_version" -o "$elixir_version" = "system" ]; and return

	# Add 'v' before elixir version that starts with a number
	if test -n (echo (string match -r "^[0-9].+\$" "$elixir_version"))
		set elixir_version "v$elixir_version"
	end

	__gyarados_lib_section \
		$GYARADOS_ELIXIR_COLOR \
		$GYARADOS_ELIXIR_PREFIX \
		"$GYARADOS_ELIXIR_SYMBOL""$elixir_version" \
		$GYARADOS_ELIXIR_SUFFIX
end
