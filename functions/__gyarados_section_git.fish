#
# Git
#

function __gyarados_section_git -d "Display the git branch and status"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_GIT_SHOW true
	__gyarados_util_set_default GYARADOS_GIT_PREFIX "on "
	__gyarados_util_set_default GYARADOS_GIT_SUFFIX $GYARADOS_PROMPT_DEFAULT_SUFFIX
	__gyarados_util_set_default GYARADOS_GIT_SYMBOL " "

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	# Show both git branch and git status:
	#   gyarados_git_branch
	#   gyarados_git_status

	[ $GYARADOS_GIT_SHOW = false ]; and return

	set -l git_branch (__gyarados_section_git_branch)
	set -l git_status (__gyarados_section_git_status)

	[ -z $git_branch ]; and return

	__gyarados_lib_section \
		fff \
		$GYARADOS_GIT_PREFIX \
		"$git_branch$git_status" \
		$GYARADOS_GIT_SUFFIX
end
