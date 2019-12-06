#
# Conda
#
# Current Conda version.

function __gyarados_section_conda -d "Display current Conda version"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_CONDA_SHOW true
	__gyarados_util_set_default GYARADOS_CONDA_PREFIX $GYARADOS_PROMPT_DEFAULT_PREFIX
	__gyarados_util_set_default GYARADOS_CONDA_SUFFIX $GYARADOS_PROMPT_DEFAULT_SUFFIX
	__gyarados_util_set_default GYARADOS_CONDA_SYMBOL "🅒 "
	__gyarados_util_set_default GYARADOS_CONDA_COLOR blue

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	[ $GYARADOS_CONDA_SHOW = false ]; and return

	# Show Conda version only if conda is installed and CONDA_DEFAULT_ENV is set
	if not type -q conda; \
		or test -z "$CONDA_DEFAULT_ENV";
		return
	end

	set -l conda_version (conda -V | string split ' ')[2]

	__gyarados_lib_section \
		$GYARADOS_CONDA_COLOR \
		$GYARADOS_CONDA_PREFIX \
		"$GYARADOS_CONDA_SYMBOL"v"$conda_version" \
		$GYARADOS_CONDA_SUFFIX
end
