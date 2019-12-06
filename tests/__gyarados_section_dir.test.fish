source $DIRNAME/gyarados_test_setup.fish

function setup
	gyarados_test_setup
	mkdir -p ~/.tmp-gyarados/dir1/dir2
	mkdir -p /tmp/tmp-gyarados/dir1/dir2/dir3
	mkdir -p /tmp/tmp-gyarados/writeProtected
	chmod 500 /tmp/tmp-gyarados/writeProtected
	# disabling GYARADOS_DIR_LOCK_SYMBOL to avoid breaking old tests
	set GYARADOS_DIR_LOCK_SHOW false
end

function teardown
	rm -rf ~/.tmp-gyarados
	rm -rf /tmp/tmp-gyarados
end

#
# Home directory
#

test "Correctly truncates home directory"
	(
		cd ~

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "~"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dir)
end

test "Correctly truncates a home subdirectory"
	(
		cd ~/.tmp-gyarados/dir1/

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "~/.tmp-gyarados/dir1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dir)
end

test "Correctly truncates a deeply nested home subdirectory"
	(
		cd ~/.tmp-gyarados/dir1/dir2

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n ".tmp-gyarados/dir1/dir2"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dir)
end

#
# Root directory
#

test "Correctly truncates root directory"
	(
		cd /

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "/"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dir)
end

test "Correctly truncates a root subdirectory"
	(
		cd /usr

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "/usr"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dir)
end

test "Correctly truncates a deeply nested root subdirectory"
	(
		cd /tmp/tmp-gyarados/dir1/dir2

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "tmp-gyarados/dir1/dir2"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dir)
end

#
# Git directory
#

test "Correctly truncates the root of a git directory"
	(
		cd /tmp/tmp-gyarados
		command git init >/dev/null

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "tmp-gyarados"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dir)
end

test "Correctly truncates a git subdirectory"
	(
		cd /tmp/tmp-gyarados
		command git init >/dev/null
		cd /tmp/tmp-gyarados/dir1

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "tmp-gyarados/dir1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dir)
end

test "Correctly truncates a deeply nested git subdirectory"
	(
		cd /tmp/tmp-gyarados
		command git init >/dev/null
		cd /tmp/tmp-gyarados/dir1/dir2/dir3

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "dir1/dir2/dir3"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dir)
end

test "Correctly truncates the root of a git directory within another"
	(
		cd /tmp/tmp-gyarados
		command git init >/dev/null

		cd /tmp/tmp-gyarados/dir1
		command git init >/dev/null

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "dir1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dir)
end

test "Doesn't throw an error when in a .git directory"
	(
		cd /tmp/tmp-gyarados
		command git init >/dev/null

		cd /tmp/tmp-gyarados/.git

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "tmp/tmp-gyarados/.git"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dir)

#
# Configuration
#

test "Doesn't show if GYARADOS_DIR_SHOW is false"
	(
		set GYARADOS_DIR_SHOW false
	) = (__gyarados_section_dir)
end

test "Changing GYARADOS_DIR_PREFIX changes the dir prefix"
	(
		set GYARADOS_DIR_PREFIX ·
		cd ~

		set_color --bold
		echo -n "·"
		set_color normal
		set_color --bold cyan
		echo -n "~"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dir)
end

test "Changing GYARADOS_DIR_SUFFIX changes the dir prefix"
	(
		set GYARADOS_DIR_SUFFIX ·
		cd ~

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "~"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
	) = (__gyarados_section_dir)
end

# GYARADOS_DIR_TRUNC functionality is further tested in:
# __gyarados_util_truncate_dir.test.fish
test "Changing GYARADOS_DIR_TRUNC changes the dir length"
	(
		set GYARADOS_DIR_TRUNC 1
		cd /tmp/tmp-gyarados/dir1/dir2/dir3

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "dir3"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dir)
end

test "Disabling GYARADOS_DIR_TRUNC_REPO stops repo dir truncation"
	(
		set GYARADOS_DIR_TRUNC_REPO false
		cd ~/.tmp-gyarados
		command git init >/dev/null

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "~/.tmp-gyarados"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dir)
end

test "Changing GYARADOS_DIR_COLOR changes the dir color"
	(
		set GYARADOS_DIR_COLOR red
		cd ~

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold red
		echo -n "~"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dir)
end


#
# GYARADOS_DIR_LOCK_SYMBOL
#

test "Shows DIR_LOCK_SYMBOL if in a dir with no write permissions and GYARADOS_DIR_LOCK_SHOW is true"
	(
		cd /tmp/tmp-gyarados/writeProtected

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "tmp/tmp-gyarados/writeProtected"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dir)
end

test "Doesn't show DIR_LOCK_SYMBOL if GYARADOS_DIR_LOCK_SHOW is false"
	(
		cd /tmp/tmp-gyarados/writeProtected

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "tmp/tmp-gyarados/writeProtected"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dir)
end

test "Doesn't show DIR_LOCK_SYMBOL if current directory is not write protected for this user"
	(
		cd ~

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "~"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dir)
end

test "Changing GYARADOS_DIR_LOCK_SYMBOL changes the symbol"
	(
		set GYARADOS_DIR_LOCK_SYMBOL "😀"
		cd /tmp/tmp-gyarados/writeProtected

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "tmp/tmp-gyarados/writeProtected"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dir)
end
