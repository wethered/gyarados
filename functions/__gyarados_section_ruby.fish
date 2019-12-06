#
# Ruby
#
# A dynamic, reflective, object-oriented, general-purpose programming language.
# Link: https://www.ruby-lang.org/

function __gyarados_section_ruby -d "Show current version of Ruby"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_RUBY_SHOW true
	__gyarados_util_set_default GYARADOS_RUBY_PREFIX $GYARADOS_PROMPT_DEFAULT_PREFIX
	__gyarados_util_set_default GYARADOS_RUBY_SUFFIX $GYARADOS_PROMPT_DEFAULT_SUFFIX
	__gyarados_util_set_default GYARADOS_RUBY_SYMBOL "💎 "
	__gyarados_util_set_default GYARADOS_RUBY_COLOR red

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	# Check if that user wants to show ruby version
	[ $GYARADOS_RUBY_SHOW = false ]; and return

	# Show versions only for Ruby-specific folders
	if not test -f Gemfile \
		-o -f Rakefile \
		-o (count *.rb) -gt 0
		return
	end

	set -l ruby_version

	if type -q rvm-prompt
		set ruby_version (rvm-prompt i v g)
	else if type -q rbenv
		set ruby_version (rbenv version-name)
	else if type -q chruby
		set ruby_version $RUBY_AUTO_VERSION
	else if type -q asdf
		set ruby_version (asdf current ruby | awk '{print $1}')
	else
		return
	end

	[ -z "$ruby_version" -o "$ruby_version" = "system" ]; and return

	# Add 'v' before ruby version that starts with a number
	if test -n (echo (string match -r "^[0-9].+\$" "$ruby_version"))
		set ruby_version "v$ruby_version"
	end

	__gyarados_lib_section \
		$GYARADOS_RUBY_COLOR \
		$GYARADOS_RUBY_PREFIX \
		"$GYARADOS_RUBY_SYMBOL""$ruby_version" \
		$GYARADOS_RUBY_SUFFIX
end
