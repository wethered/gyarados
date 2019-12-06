# Jobs
#

function __gyarados_section_jobs -d "Show icon, if there's a working jobs in the background."
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_JOBS_SHOW true
	__gyarados_util_set_default GYARADOS_JOBS_PREFIX ""
	__gyarados_util_set_default GYARADOS_JOBS_SUFFIX " "
	__gyarados_util_set_default GYARADOS_JOBS_SYMBOL ✦
	__gyarados_util_set_default GYARADOS_JOBS_COLOR blue
	__gyarados_util_set_default GYARADOS_JOBS_AMOUNT_PREFIX ""
	__gyarados_util_set_default GYARADOS_JOBS_AMOUNT_SUFFIX ""
	__gyarados_util_set_default GYARADOS_JOBS_AMOUNT_THRESHOLD 1

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	[ $GYARADOS_JOBS_SHOW = false ]; and return

	set jobs_amount (jobs | wc -l | xargs) # Zsh had a much more complicated command.

	if test $jobs_amount -eq 0
		return
	end

	if test $jobs_amount -le $GYARADOS_JOBS_AMOUNT_THRESHOLD
		set jobs_amount ''
		set GYARADOS_JOBS_AMOUNT_PREFIX ''
		set GYARADOS_JOBS_AMOUNT_SUFFIX ''
	end

	set GYARADOS_JOBS_SECTION "$GYARADOS_JOBS_SYMBOL$GYARADOS_JOBS_AMOUNT_PREFIX$jobs_amount$GYARADOS_JOBS_AMOUNT_SUFFIX"

	__gyarados_lib_section \
		$GYARADOS_JOBS_COLOR \
		$GYARADOS_JOBS_PREFIX \
		$GYARADOS_JOBS_SECTION \
		$GYARADOS_JOBS_SUFFIX
end
