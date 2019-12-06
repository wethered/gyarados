source $DIRNAME/gyarados_test_setup.fish

function setup
	gyarados_test_setup
	mock aws \* 0
	set -g AWS_PROFILE user1
end

test "Prints section when AWS_PROFILE is set"
	(
		set_color --bold
		echo -n "using "
		set_color normal
		set_color --bold ff8700
		echo -n "☁️ user1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_aws)
end

test "Doesn't print the section when AWS_PROFILE isn't set"
	(
		set --erase AWS_PROFILE
	) = (__gyarados_section_aws)
end

test "Doesn't print the section when AWS_PROFILE is set to \"default\""
	(
		set AWS_PROFILE default
	) = (__gyarados_section_aws)
end

test "Changing GYARADOS_AWS_SYMBOL changes the displayed character"
	(
		set GYARADOS_AWS_SYMBOL "· "

		set_color --bold
		echo -n "using "
		set_color normal
		set_color --bold ff8700
		echo -n "· user1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_aws)
end

test "Changing GYARADOS_AWS_PREFIX changes the character prefix"
	(
		set gyarados_exit_code 0
		set GYARADOS_AWS_PREFIX ·

		set_color --bold
		echo -n "·"
		set_color normal
		set_color --bold ff8700
		echo -n "☁️ user1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_aws)
end

test "Changing GYARADOS_AWS_SUFFIX changes the character suffix"
	(
		set gyarados_exit_code 0
		set GYARADOS_AWS_SUFFIX ·

		set_color --bold
		echo -n "using "
		set_color normal
		set_color --bold ff8700
		echo -n "☁️ user1"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
	) = (__gyarados_section_aws)
end

test "doesn't display the section when GYARADOS_AWS_SHOW is set to \"false\""
	(
		set GYARADOS_AWS_SHOW false
	) = (__gyarados_section_aws)
end


test "Prints section when AWS_VAULT is set"
        (
                set AWS_VAULT user2
                set_color --bold
                echo -n "using "
                set_color normal
                set_color --bold ff8700
                echo -n "☁️ user2"
                set_color normal
                set_color --bold
                echo -n " "
                set_color normal
        ) = (__gyarados_section_aws)
end
