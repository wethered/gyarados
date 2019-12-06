# virtualenv
#

function __gyarados_section_venv -d "Show current virtual Python environment"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_VENV_SHOW true
	__gyarados_util_set_default GYARADOS_VENV_PREFIX $GYARADOS_PROMPT_DEFAULT_PREFIX
	__gyarados_util_set_default GYARADOS_VENV_SUFFIX $GYARADOS_PROMPT_DEFAULT_SUFFIX
	__gyarados_util_set_default GYARADOS_VENV_SYMBOL "·"
	__gyarados_util_set_default GYARADOS_VENV_GENERIC_NAMES virtualenv venv .venv
	__gyarados_util_set_default GYARADOS_VENV_COLOR blue

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	# Show venv python version
	 test $GYARADOS_VENV_SHOW = false; and return

	# Check if the current directory running via Virtualenv
	test -n "$VIRTUAL_ENV"; or return

	set -l venv (basename $VIRTUAL_ENV)
	if contains $venv $GYARADOS_VENV_GENERIC_NAMES
		set venv (basename (dirname $VIRTUAL_ENV))
	end

	__gyarados_lib_section \
		$GYARADOS_VENV_COLOR \
		$GYARADOS_VENV_PREFIX \
		"$GYARADOS_VENV_SYMBOL""$venv" \
		$GYARADOS_VENV_SUFFIX
end
