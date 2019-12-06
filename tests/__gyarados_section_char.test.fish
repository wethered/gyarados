source $DIRNAME/gyarados_test_setup.fish

function setup
	gyarados_test_setup
end

test "Displays default char with status code 0"
	(
		set gyarados_exit_code 0

		set_color --bold
		echo -n ""
		set_color normal
		set_color --bold green
		echo -n "➜"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_char)
end

test "Displays default char with status code 1"
	(
		set gyarados_exit_code 1

		set_color --bold
		echo -n ""
		set_color normal
		set_color --bold red
		echo -n "➜"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_char)
end

test "Changing GYARADOS_CHAR_SYMBOL changes the displayed character"
	(
		set gyarados_exit_code 0
		set GYARADOS_CHAR_SYMBOL ·

		set_color --bold
		echo -n ""
		set_color normal
		set_color --bold green
		echo -n "·"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_char)
end

test "Changing GYARADOS_CHAR_PREFIX changes the character prefix"
	(
		set gyarados_exit_code 0
		set GYARADOS_CHAR_PREFIX ·

		set_color --bold
		echo -n "·"
		set_color normal
		set_color --bold green
		echo -n "➜"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_char)
end

test "Changing GYARADOS_CHAR_SYMBOL changes the character suffix"
	(
		set gyarados_exit_code 0
		set GYARADOS_CHAR_SUFFIX ·

		set_color --bold
		echo -n ""
		set_color normal
		set_color --bold green
		echo -n "➜"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
	) = (__gyarados_section_char)
end
