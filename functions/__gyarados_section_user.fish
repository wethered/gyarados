#
# Username
#

function __gyarados_section_user -d "Display the username"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	# --------------------------------------------------------------------------
	# | GYARADOS_USER_SHOW | show username on local | show username on remote |
	# |---------------------+------------------------+-------------------------|
	# | false               | never                  | never                   |
	# | always              | always                 | always                  |
	# | true                | if needed              | always                  |
	# | needed              | if needed              | if needed               |
	# --------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_USER_SHOW "always"
	__gyarados_util_set_default GYARADOS_USER_PREFIX "with "
	__gyarados_util_set_default GYARADOS_USER_SUFFIX $GYARADOS_PROMPT_DEFAULT_SUFFIX
	__gyarados_util_set_default GYARADOS_USER_COLOR yellow
	__gyarados_util_set_default GYARADOS_USER_COLOR_ROOT red

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	[ $GYARADOS_USER_SHOW = false ]; and return

	if test "$GYARADOS_USER_SHOW" = "always" \
	-o "$LOGNAME" != "$USER" \
	-o "$UID" = "0" \
	-o \( "$GYARADOS_USER_SHOW" = "true" -a -n "$SSH_CONNECTION" \)

		set -l user_color
		if test "$USER" = "root"
			set user_color $GYARADOS_USER_COLOR_ROOT
		else
			set user_color $GYARADOS_USER_COLOR
		end

		__gyarados_lib_section \
			$user_color \
			$GYARADOS_USER_PREFIX \
			$USER \
			$GYARADOS_USER_SUFFIX
	end
end
