source $DIRNAME/gyarados_test_setup.fish

function setup
	gyarados_test_setup
	mock rustc --version 0 "echo \"rustc 1.28.0-nightly (9634041f0 2018-07-30)\""
	mkdir -p /tmp/tmp-gyarados
	cd /tmp/tmp-gyarados
end

function teardown
	rm -rf /tmp/tmp-gyarados
end

test "Prints section when Cargo.toml is present"
	(
		touch /tmp/tmp-gyarados/Cargo.toml

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold red
		echo -n "𝗥 v1.28.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_rust)
end

test "Prints section when a *.rs file is present"
	(
		touch /tmp/tmp-gyarados/testfile.rs

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold red
		echo -n "𝗥 v1.28.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_rust)
end

test "Doesn't print the section when Cargo.toml and *.rs aren't present"
	() = (__gyarados_section_rust)
end

test "Changing GYARADOS_RUST_SYMBOL changes the displayed character"
	(
		touch /tmp/tmp-gyarados/Cargo.toml
		set GYARADOS_RUST_SYMBOL "· "

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold red
		echo -n "· v1.28.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_rust)
end

test "Changing GYARADOS_RUST_PREFIX changes the character prefix"
	(
		touch /tmp/tmp-gyarados/Cargo.toml
		set gyarados_exit_code 0
		set GYARADOS_RUST_PREFIX ·

		set_color --bold
		echo -n "·"
		set_color normal
		set_color --bold red
		echo -n "𝗥 v1.28.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_rust)
end

test "Changing GYARADOS_RUST_SUFFIX changes the character suffix"
	(
		touch /tmp/tmp-gyarados/Cargo.toml
		set gyarados_exit_code 0
		set GYARADOS_RUST_SUFFIX ·

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold red
		echo -n "𝗥 v1.28.0"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
	) = (__gyarados_section_rust)
end

test "Prints verbose version when configured to do so"
	(
		touch /tmp/tmp-gyarados/Cargo.toml
		set GYARADOS_RUST_VERBOSE_VERSION true

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold red
		echo -n "𝗥 v1.28.0-nightly"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_rust)
end

test "doesn't display the section when GYARADOS_RUST_SHOW is set to \"false\""
	(
		touch /tmp/tmp-gyarados/Cargo.toml
		set GYARADOS_RUST_SHOW false
	) = (__gyarados_section_rust)
end
