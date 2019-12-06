#
# Line separator
#

function __gyarados_section_line_sep -d "Separate the prompt into two lines"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_PROMPT_SEPARATE_LINE true

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	if test "$GYARADOS_PROMPT_SEPARATE_LINE" = "true"
		echo -e -n \n
	end
end
