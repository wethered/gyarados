#
# Git branch
#

function __gyarados_section_git_branch -d "Format the displayed branch name"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_GIT_BRANCH_SHOW true
	__gyarados_util_set_default GYARADOS_GIT_BRANCH_PREFIX $GYARADOS_GIT_SYMBOL
	__gyarados_util_set_default GYARADOS_GIT_BRANCH_SUFFIX ""
	__gyarados_util_set_default GYARADOS_GIT_BRANCH_COLOR magenta

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	[ $GYARADOS_GIT_BRANCH_SHOW = false ]; and return

	set -l git_branch (__gyarados_util_git_branch)

	[ -z $git_branch ]; and return

	__gyarados_lib_section \
		$GYARADOS_GIT_BRANCH_COLOR \
		$GYARADOS_GIT_BRANCH_PREFIX$git_branch$GYARADOS_GIT_BRANCH_SUFFIX
end
