#
# asciinema
#


# If there is an ssh connections, current machine name.
function __gyarados_section_host -d "Display whether asciinema is currently recording"

	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_ASCIINEMA_SHOW true
	__gyarados_util_set_default GYARADOS_ASCIINEMA_PREFIX $GYARADOS_PROMPT_DEFAULT_PREFIX
	__gyarados_util_set_default GYARADOS_ASCIINEMA_SUFFIX $GYARADOS_PROMPT_DEFAULT_SUFFIX
	__gyarados_util_set_default GYARADOS_ASCIINEMA_SYMBOL "⊚"
	__gyarados_util_set_default GYARADOS_ASCIINEMA_COLOR blue
	__gyarados_util_set_default GYARADOS_ASCIINEMA_COLOR_SSH green

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	[ "$GYARADOS_ASCIINEMA_SHOW" = false ]; and return

	if set -q ASCIINEMA_REC;
		__gyarados_lib_section \
			$GYARADOS_ASCIINEMA_COLOR \
			$GYARADOS_HOST_PREFIX \
			"$GYARADOS_ASCIINEMA_SYMBOL" \
			$GYARADOS_HOST_SUFFIX
		end
end
