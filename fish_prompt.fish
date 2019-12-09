function fish_prompt
	# Store the exit code of the last command
	set -g gyarados_exit_code $status
	set -g GYARADOS_VERSION 2.7.0

	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_PROMPT_ADD_NEWLINE true
	__gyarados_util_set_default GYARADOS_PROMPT_FIRST_PREFIX_SHOW false
	__gyarados_util_set_default GYARADOS_PROMPT_PREFIXES_SHOW true
	__gyarados_util_set_default GYARADOS_PROMPT_SUFFIXES_SHOW true
	__gyarados_util_set_default GYARADOS_PROMPT_DEFAULT_PREFIX " "
	__gyarados_util_set_default GYARADOS_PROMPT_DEFAULT_SUFFIX " "
	__gyarados_util_set_default GYARADOS_PROMPT_ORDER asciinema time user host dir git package node docker ruby golang php rust haskell julia aws conda pyenv kubecontext exec_time line_sep battery jobs exit_code char

	# ------------------------------------------------------------------------------
	# Sections
	# ------------------------------------------------------------------------------

	# Keep track of whether the prompt has already been opened
	set -g gyarados_prompt_opened $GYARADOS_PROMPT_FIRST_PREFIX_SHOW

	if test -e ~/.face.undercover
    	set -g gyarados_undercover_mode "true"
    else
    	set -g gyarados_undercover_mode "false"
	end

	if test "$gyarados_undercover_mode" = "true"
		set GYARADOS_PROMPT_ORDER asciinema dir
		set GYARADOS_RPROMPT_ORDER time
		set GYARADOS_PROMPT_ADD_NEWLINE false
		set GYARADOS_PROMPT_FIRST_PREFIX_SHOW true
	end

	if test "$GYARADOS_PROMPT_ADD_NEWLINE" = "true"
		echo
	end

	for i in $GYARADOS_PROMPT_ORDER
		eval __gyarados_section_$i
	end
	set_color normal
end
