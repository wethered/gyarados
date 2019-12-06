function fish_right_prompt

	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_RPROMPT_ORDER ""

	# ------------------------------------------------------------------------------
	# Sections
	# ------------------------------------------------------------------------------

	[ -n "$GYARADOS_RPROMPT_ORDER" ]; or return

	for i in $GYARADOS_RPROMPT_ORDER
		eval __gyarados_section_$i
	end
	set_color normal
end
