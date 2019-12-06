source $DIRNAME/gyarados_test_setup.fish

function setup
	gyarados_test_setup
end

function teardown
	if test "$VIRTUAL_ENV"
		set -e VIRTUAL_ENV
	end
end

test "Prints section when \$VIRTUAL_ENV is defined"
	(
		set VIRTUAL_ENV "/Users/JaneDoe/.venv/coolenviron"

		set_color --bold
		echo -n $GYARADOS_PROMPT_DEFAULT_PREFIX
		set_color normal
		set_color --bold blue
		echo -n "·coolenviron"
		set_color normal
		set_color --bold
		echo -n $GYARADOS_PROMPT_DEFAULT_SUFFIX
		set_color normal
	) = (__gyarados_section_venv)
end

test "Prints section when \$VIRTUAL_ENV is defined with venv as the directory name"
	(
		set VIRTUAL_ENV "/Users/JaneDoe/.venv/coolenviron/virtualenv"

		set_color --bold
		echo -n $GYARADOS_PROMPT_DEFAULT_PREFIX
		set_color normal
		set_color --bold blue
		echo -n "·coolenviron"
		set_color normal
		set_color --bold
		echo -n $GYARADOS_PROMPT_DEFAULT_SUFFIX
		set_color normal
	) = (__gyarados_section_venv)
end

test "doesn't display the section when GYARADOS_VENV_SHOW is set to \"false\""
	(
		set VIRTUAL_ENV "/Users/JaneDoe/.venv/coolenviron"
		set GYARADOS_VENV_SHOW false
	) = (__gyarados_section_venv)
end
