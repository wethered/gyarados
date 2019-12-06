#
# asciinema
#

function __gyarados_section_asciinema -d "Display whether asciinema is currently recording!"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_ASCIINEMA_SHOW true
	__gyarados_util_set_default GYARADOS_ASCIINEMA_COLOR "red"
	__gyarados_util_set_default GYARADOS_ASCIINEMA_SYMBOL "⊚ "

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	[ $GYARADOS_ASCIINEMA_SHOW = false ]; and return

	if test "$ASCIINEMA_REC" = "true"
		__gyarados_lib_section \
			$GYARADOS_ASCIINEMA_COLOR \
			$GYARADOS_ASCIINEMA_SYMBOL
	end
end
