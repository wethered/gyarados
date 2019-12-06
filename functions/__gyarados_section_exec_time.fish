#
# Execution time
#

function __gyarados_section_exec_time -d "Display the execution time of the last command"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_EXEC_TIME_SHOW true
	__gyarados_util_set_default GYARADOS_EXEC_TIME_PREFIX "took "
	__gyarados_util_set_default GYARADOS_EXEC_TIME_SUFFIX $GYARADOS_PROMPT_DEFAULT_SUFFIX
	__gyarados_util_set_default GYARADOS_EXEC_TIME_COLOR yellow
	__gyarados_util_set_default GYARADOS_EXEC_TIME_ELAPSED 5

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	[ $GYARADOS_EXEC_TIME_SHOW = false ]; and return

	# Allow for compatibility between fish 2.7 and 3.0
	set -l command_duration "$CMD_DURATION$cmd_duration"

	if test -n "$command_duration" -a "$command_duration" -gt (math "$GYARADOS_EXEC_TIME_ELAPSED * 1000")
		set -l human_command_duration (echo $command_duration | __gyarados_util_human_time)
		__gyarados_lib_section \
			$GYARADOS_EXEC_TIME_COLOR \
			$GYARADOS_EXEC_TIME_PREFIX \
			$human_command_duration \
			$GYARADOS_EXEC_TIME_SUFFIX
	end
end
