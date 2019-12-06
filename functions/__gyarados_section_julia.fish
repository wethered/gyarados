#
# Julia
#
# Current Julia version.

function __gyarados_section_julia -d "Display julia version"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_JULIA_SHOW true
	__gyarados_util_set_default GYARADOS_JULIA_PREFIX "is "
	__gyarados_util_set_default GYARADOS_JULIA_SUFFIX $GYARADOS_PROMPT_DEFAULT_SUFFIX
	__gyarados_util_set_default GYARADOS_JULIA_SYMBOL "ஃ "
	__gyarados_util_set_default GYARADOS_JULIA_COLOR green

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	[ $GYARADOS_JULIA_SHOW = false ]; and return

	# Show Julia version only if julia is installed
	type -q julia; or return

	# Show julia version only when pwd has *.jl file(s)
	[ (count *.jl) -gt 0 ]; or return

	set -l julia_version (julia --version | grep --color=never -oE '[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]')

	__gyarados_lib_section \
	$GYARADOS_JULIA_COLOR \
	$GYARADOS_JULIA_PREFIX \
	"$GYARADOS_JULIA_SYMBOL"v"$julia_version" \
	$GYARADOS_JULIA_SUFFIX
end
