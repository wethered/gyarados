#
# asciinema
#

function __gyarados_section_asciinema -d "Display whether asciinema is currently recording!"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

    __gyarados_util_set_default GYARADOS_ASCIINEMA_RECORDING false
	__gyarados_util_set_default GYARADOS_ASCIINEMA_SHOW true
	__gyarados_util_set_default GYARADOS_ASCIINEMA_COLOR "red"
	__gyarados_util_set_default GYARADOS_ASCIINEMA_SYMBOL "⊚ "

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	[ $GYARADOS_ASCIINEMA_SHOW = false ]; and return
	[ $GYARADOS_ASCIINEMA_RECORDING = false]; and return

	__gyarados_lib_section \
		$GYARADOS_ASCIINEMA_COLOR \
		$GYARADOS_ASCIINEMA_SYMBOL
end
