source $DIRNAME/gyarados_test_setup.fish
set -l LOCAL_CONDA_VERSION 4.5.11

function setup
	gyarados_test_setup
	mock conda -V 0 "echo \"conda 4.5.11\""
	mkdir -p /tmp/tmp-gyarados
	cd /tmp/tmp-gyarados
end

function teardown
	rm -rf /tmp/tmp-gyarados
	if test "$CONDA_DEFAULT_ENV"
		set -e CONDA_DEFAULT_ENV
	end
end

test "Prints section when conda is installed and CONDA_DEFAULT_ENV is set"
	(
		set -g CONDA_DEFAULT_ENV some-env

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold blue
		echo -n "🅒 v$LOCAL_CONDA_VERSION"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_conda)
end

test "Changing GYARADOS_CONDA_SYMBOL changes the displayed character"
	(
		set GYARADOS_CONDA_SYMBOL "· "
		set -g CONDA_DEFAULT_ENV some-env

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold blue
		echo -n "· v$LOCAL_CONDA_VERSION"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_conda)
end

test "Changing GYARADOS_CONDA_PREFIX changes the character prefix"
	(
		set GYARADOS_CONDA_PREFIX ·
		set -g CONDA_DEFAULT_ENV some-env

		set_color --bold
		echo -n "·"
		set_color normal
		set_color --bold blue
		echo -n "🅒 v$LOCAL_CONDA_VERSION"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_conda)
end


# Negative
test "Doesn't display section when GYARADOS_CONDA_SHOW is set to 'false'"
	(
		set -g GYARADOS_CONDA_SHOW false
		set -g CONDA_DEFAULT_ENV some-env
	) = (__gyarados_section_conda)
end

test "Doesn't display section when CONDA_DEFAULT_ENV is not set"
	() = (__gyarados_section_conda)
end
