#
# Hostname
#


# If there is an ssh connections, current machine name.
function __gyarados_section_host -d "Display the current hostname if connected over SSH"

	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_HOST_SHOW true
	__gyarados_util_set_default GYARADOS_HOST_PREFIX "at "
	__gyarados_util_set_default GYARADOS_HOST_SUFFIX $GYARADOS_PROMPT_DEFAULT_SUFFIX
	__gyarados_util_set_default GYARADOS_HOST_COLOR blue
	__gyarados_util_set_default GYARADOS_HOST_COLOR_SSH green

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	[ "$GYARADOS_HOST_SHOW" = false ]; and return

	if test "$GYARADOS_HOST_SHOW" = "always"; or set -q SSH_CONNECTION;

		# Determination of what color should be used
		set -l host_color
		if set -q SSH_CONNECTION;
			set host_color $GYARADOS_HOST_COLOR_SSH
		else
			set host_color $GYARADOS_HOST_COLOR
		end

		__gyarados_lib_section \
			$host_color \
			$GYARADOS_HOST_PREFIX \
			(hostname) \
			$GYARADOS_HOST_SUFFIX
		end
end
