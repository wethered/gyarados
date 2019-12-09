#
# Time
#

function __gyarados_section_time -d "Display the current time!"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_TIME_SHOW true
	__gyarados_util_set_default GYARADOS_DATE_SHOW true
	__gyarados_util_set_default GYARADOS_TIME_PREFIX ""
	__gyarados_util_set_default GYARADOS_TIME_SUFFIX $GYARADOS_PROMPT_DEFAULT_SUFFIX
	__gyarados_util_set_default GYARADOS_TIME_FORMAT false
	__gyarados_util_set_default GYARADOS_TIME_12HR false
	__gyarados_util_set_default GYARADOS_TIME_COLOR "yellow"

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	[ $GYARADOS_TIME_SHOW = false ]; and return

	set -l time_str

	if test $GYARADOS_DATE_SHOW = true
		set time_str (date '+%Y-%m-%d')" "
	end

	if not test $GYARADOS_TIME_FORMAT = false
		set time_str "$time_str"(date '+'$GYARADOS_TIME_FORMAT)
	else if test $GYARADOS_TIME_12HR = true
		set time_str "$time_str"(date '+%I:%M:%S') # Fish doesn't seem to have date/time formatting.
	else
		set time_str "$time_str"(date '+%H:%M:%S')
	end

	if test "$gyarados_undercover_mode" = "true"
		set GYARADOS_TIME_COLOR "brblack"
	end

	__gyarados_lib_section \
		$GYARADOS_TIME_COLOR \
		$GYARADOS_TIME_PREFIX \
		$time_str \
		$GYARADOS_TIME_SUFFIX
end
