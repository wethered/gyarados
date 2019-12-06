#
# Git branch
#

function __gyarados_util_git_branch -d "Display the current branch name"
	echo (command git rev-parse --abbrev-ref HEAD 2>/dev/null)
end
