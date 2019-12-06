# Exit-code
#

function __gyarados_section_exit_code -d "Shows the exit code from the previous command."
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_EXIT_CODE_SHOW false
	__gyarados_util_set_default GYARADOS_EXIT_CODE_PREFIX ""
	__gyarados_util_set_default GYARADOS_EXIT_CODE_SUFFIX " "
	__gyarados_util_set_default GYARADOS_EXIT_CODE_SYMBOL ✘
	__gyarados_util_set_default GYARADOS_EXIT_CODE_COLOR red

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	[ $GYARADOS_EXIT_CODE_SHOW = false ]; or test $sf_exit_code -eq 0; and return

	__gyarados_lib_section \
		$GYARADOS_EXIT_CODE_COLOR \
		$GYARADOS_EXIT_CODE_PREFIX \
		"$GYARADOS_EXIT_CODE_SYMBOL$sf_exit_code" \
		$GYARADOS_EXIT_CODE_SUFFIX
end
