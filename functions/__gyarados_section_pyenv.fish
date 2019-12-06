# pyenv
#

function __gyarados_section_pyenv -d "Show current version of pyenv Python, including system."
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_PYENV_SHOW true
	__gyarados_util_set_default GYARADOS_PYENV_PREFIX $GYARADOS_PROMPT_DEFAULT_PREFIX
	__gyarados_util_set_default GYARADOS_PYENV_SUFFIX $GYARADOS_PROMPT_DEFAULT_SUFFIX
	__gyarados_util_set_default GYARADOS_PYENV_SYMBOL "🐍 "
	__gyarados_util_set_default GYARADOS_PYENV_COLOR yellow

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	# Show pyenv python version
	[ $GYARADOS_PYENV_SHOW = false ]; and return

	# Ensure the pyenv command is available
	type -q pyenv; or return

	# Show pyenv python version only for Python-specific folders
	if not test -n "$PYENV_VERSION" \
		-o -f .python-version \
		-o -f requirements.txt \
		-o -f pyproject.toml \
		-o (count *.py) -gt 0
		return
	end

	set -l pyenv_status (pyenv version-name 2>/dev/null) # This line needs explicit testing in an enviroment that has pyenv.

	__gyarados_lib_section \
		$GYARADOS_PYENV_COLOR \
		$GYARADOS_PYENV_PREFIX \
		"$GYARADOS_PYENV_SYMBOL""$pyenv_status" \
		$GYARADOS_PYENV_SUFFIX
end
