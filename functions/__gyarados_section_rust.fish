#
# Rust
#
# Rust is a systems programming language sponsored by Mozilla Research.
# Link: https://www.rust-lang.org

function __gyarados_section_rust -d "Display the current Rust version"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_RUST_SHOW true
	__gyarados_util_set_default GYARADOS_RUST_PREFIX $GYARADOS_PROMPT_DEFAULT_PREFIX
	__gyarados_util_set_default GYARADOS_RUST_SUFFIX $GYARADOS_PROMPT_DEFAULT_SUFFIX
	__gyarados_util_set_default GYARADOS_RUST_SYMBOL "𝗥 "
	__gyarados_util_set_default GYARADOS_RUST_COLOR red
	__gyarados_util_set_default GYARADOS_RUST_VERBOSE_VERSION false

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	# Show current version of Rust
	[ $GYARADOS_RUST_SHOW = false ]; and return

	# Ensure the rustc command is available
	type -q rustc; or return

	if not test -f Cargo.toml \
		-o (count *.rs) -gt 0
		return
	end

	set -l rust_version (rustc --version | string split ' ')[2]

	if test $GYARADOS_RUST_VERBOSE_VERSION = false
        set rust_version (string split '-' $rust_version)[1] # Cut off -suffixes from version. "v1.30.0-beta" vs "v1.30.0"
	end

	__gyarados_lib_section \
		$GYARADOS_RUST_COLOR \
		$GYARADOS_RUST_PREFIX \
		"$GYARADOS_RUST_SYMBOL"v"$rust_version" \
		$GYARADOS_RUST_SUFFIX
end
