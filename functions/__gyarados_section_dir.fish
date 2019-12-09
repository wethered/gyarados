#
# Working directory
#

function __gyarados_section_dir -d "Display the current truncated directory"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_DIR_SHOW true
	__gyarados_util_set_default GYARADOS_DIR_PREFIX "in "
	__gyarados_util_set_default GYARADOS_DIR_SUFFIX $GYARADOS_PROMPT_DEFAULT_SUFFIX
	__gyarados_util_set_default GYARADOS_DIR_TRUNC 3
	__gyarados_util_set_default GYARADOS_DIR_TRUNC_REPO true
	__gyarados_util_set_default GYARADOS_DIR_COLOR cyan

	# Write Permissions lock symbol
	__gyarados_util_set_default GYARADOS_DIR_LOCK_SHOW true
	__gyarados_util_set_default GYARADOS_DIR_LOCK_SYMBOL ""
	__gyarados_util_set_default GYARADOS_DIR_LOCK_COLOR red

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	[ $GYARADOS_DIR_SHOW = false ]; and return

	set -l dir
	set -l tmp
	set -l git_root (command git rev-parse --show-toplevel 2>/dev/null)

	if test "$GYARADOS_DIR_TRUNC_REPO" = "true" -a -n "$git_root"
		# Resolve to physical PWD instead of logical
		set -l resolvedPWD (pwd -P 2>/dev/null; or pwd)
		# Treat repo root as top level directory
		set tmp (string replace $git_root (basename $git_root) $resolvedPWD)
	else
		set -l realhome ~
		set tmp (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)
	end

	# Truncate the path to have a limited number of dirs
	set dir (__gyarados_util_truncate_dir $tmp $GYARADOS_DIR_TRUNC)

	if [ $GYARADOS_DIR_LOCK_SHOW = true -a ! -w . ]
		set DIR_LOCK_SYMBOL (set_color $GYARADOS_DIR_LOCK_COLOR)" $GYARADOS_DIR_LOCK_SYMBOL"(set_color --bold)
	end

	if test "$gyarados_undercover_mode" = "true"
		set  "PS C:\\"
		set GYARADOS_DIR_SUFFIX "> "
		set GYARADOS_DIR_TRUNC_REPO false
		set GYARADOS_DIR_COLOR "white"
		set dir (string replace -a "/" "\\" "$PWD")
	end

	__gyarados_lib_section \
		$GYARADOS_DIR_COLOR \
		$GYARADOS_DIR_PREFIX \
		$dir \
		"$DIR_LOCK_SYMBOL""$GYARADOS_DIR_SUFFIX"
end
