#
# PHP
#
# PHP is a server-side scripting language designed primarily for web development.
# Link: http://www.php.net/

function __gyarados_section_php -d "Display the current php version"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_PHP_SHOW true
	__gyarados_util_set_default GYARADOS_PHP_PREFIX $GYARADOS_PROMPT_DEFAULT_PREFIX
	__gyarados_util_set_default GYARADOS_PHP_SUFFIX $GYARADOS_PROMPT_DEFAULT_SUFFIX
	__gyarados_util_set_default GYARADOS_PHP_SYMBOL "🐘 "
	__gyarados_util_set_default GYARADOS_PHP_COLOR blue

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	# Show current version of PHP
	[ $GYARADOS_PHP_SHOW = false ]; and return

	# Ensure the php command is available
	type -q php; or return

	if not test -f composer.json \
		-o (count *.php) -gt 0
		return
	end

	set -l php_version (php -v | string match -r 'PHP\s*[0-9.]+' | string split ' ')[2]

	__gyarados_lib_section \
		$GYARADOS_PHP_COLOR \
		$GYARADOS_PHP_PREFIX \
		"$GYARADOS_PHP_SYMBOL"v"$php_version" \
		$GYARADOS_PHP_SUFFIX
end
