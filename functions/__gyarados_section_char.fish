#
# Prompt character
#

function __gyarados_section_char -d "Display the prompt character"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_CHAR_PREFIX ""
	__gyarados_util_set_default GYARADOS_CHAR_SUFFIX " "
	__gyarados_util_set_default GYARADOS_CHAR_SYMBOL ➜
	__gyarados_util_set_default GYARADOS_CHAR_COLOR_SUCCESS green
	__gyarados_util_set_default GYARADOS_CHAR_COLOR_FAILURE red

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	# Color $GYARADOS_CHAR_SYMBOL red if previous command failed and
	# color it in green if the command succeeded.
	set -l color

	if test $sf_exit_code -eq 0
		set color $GYARADOS_CHAR_COLOR_SUCCESS
	else
		set color $GYARADOS_CHAR_COLOR_FAILURE
	end

	__gyarados_lib_section \
		$color \
		$GYARADOS_CHAR_PREFIX \
		$GYARADOS_CHAR_SYMBOL \
		$GYARADOS_CHAR_SUFFIX
end
