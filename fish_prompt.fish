function fish_prompt
	# Store the exit code of the last command
	set -g sf_exit_code $status
	set -g GYARADOS_VERSION 2.7.0

	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_PROMPT_ADD_NEWLINE true
	__gyarados_util_set_default GYARADOS_PROMPT_FIRST_PREFIX_SHOW false
	__gyarados_util_set_default GYARADOS_PROMPT_PREFIXES_SHOW true
	__gyarados_util_set_default GYARADOS_PROMPT_SUFFIXES_SHOW true
	__gyarados_util_set_default GYARADOS_PROMPT_DEFAULT_PREFIX "via "
	__gyarados_util_set_default GYARADOS_PROMPT_DEFAULT_SUFFIX " "
	__gyarados_util_set_default GYARADOS_PROMPT_ORDER time user dir host git package node ruby golang php rust haskell julia elixir docker aws venv conda pyenv dotnet kubecontext exec_time line_sep battery vi_mode jobs exit_code char

	# ------------------------------------------------------------------------------
	# Sections
	# ------------------------------------------------------------------------------

	# Keep track of whether the prompt has already been opened
	set -g sf_prompt_opened $GYARADOS_PROMPT_FIRST_PREFIX_SHOW

	if test "$GYARADOS_PROMPT_ADD_NEWLINE" = "true"
		echo
	end

	for i in $GYARADOS_PROMPT_ORDER
		eval __gyarados_section_$i
	end
	set_color normal
end
