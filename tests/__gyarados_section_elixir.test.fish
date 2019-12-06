source $DIRNAME/gyarados_test_setup.fish

function setup
	gyarados_test_setup
	mock elixir -v 0 "echo \"Erlang/OTP 21 [erts-10.3.4] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [hipe] [dtrace]
Elixir 1.8.1 (compiled with Erlang/OTP 21)\""
	set -x ELIXIR_VERSION 1.8.1
	mkdir -p /tmp/tmp-gyarados
	cd /tmp/tmp-gyarados
end

function teardown
	rm -rf /tmp/tmp-gyarados
end

test "Prints section when mix.exs is present"
	(
		touch /tmp/tmp-gyarados/mix.exs

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold magenta
		echo -n "💧 v1.8.1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_elixir)
end

test "Prints section when a *.ex file is present"
	(
		touch /tmp/tmp-gyarados/testfile.ex

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold magenta
		echo -n "💧 v1.8.1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_elixir)
end

test "Doesn't print the section when mix.exs and *.ex aren't present"
	() = (__gyarados_section_elixir)
end

test "Changing GYARADOS_ELIXIR_SYMBOL changes the displayed character"
	(
		touch /tmp/tmp-gyarados/mix.exs
		set GYARADOS_ELIXIR_SYMBOL "· "

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold magenta
		echo -n "· v1.8.1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_elixir)
end

test "Changing GYARADOS_ELIXIR_PREFIX changes the character prefix"
	(
		touch /tmp/tmp-gyarados/mix.exs
		set sf_exit_code 0
		set GYARADOS_ELIXIR_PREFIX ·

		set_color --bold
		echo -n "·"
		set_color normal
		set_color --bold magenta
		echo -n "💧 v1.8.1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_elixir)
end

test "Changing GYARADOS_ELIXIR_SUFFIX changes the character suffix"
	(
		touch /tmp/tmp-gyarados/mix.exs
		set sf_exit_code 0
		set GYARADOS_ELIXIR_SUFFIX ·

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold magenta
		echo -n "💧 v1.8.1"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
	) = (__gyarados_section_elixir)
end

test "doesn't display the section when GYARADOS_ELIXIR_SHOW is set to \"false\""
	(
		touch /tmp/tmp-gyarados/mix.exs
		set GYARADOS_ELIXIR_SHOW false
	) = (__gyarados_section_elixir)
end
