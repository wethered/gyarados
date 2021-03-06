function __gyarados_lib_section -a color prefix content suffix
	# If there are only 2 args, they are $content and $prefix
	if test (count $argv) -eq 2
		set content $argv[2]
		set prefix
	end

	if test "$gyarados_prompt_opened" = "true" -a "$GYARADOS_PROMPT_PREFIXES_SHOW" = "true"
		# Echo prefixes in bold white
		set_color --bold
		echo -e -n -s $prefix
		set_color normal
	end

	# Set the prompt as having been opened
	set -g gyarados_prompt_opened true

	set_color --bold $color
	echo -e -n $content
	set_color normal

	if test "$GYARADOS_PROMPT_SUFFIXES_SHOW" = "true"
		# Echo suffixes in bold white
		set_color --bold
		echo -e -n -s $suffix
		set_color normal
	end
end
