source $DIRNAME/gyarados_test_setup.fish

function setup
	gyarados_test_setup
end

test "Echoes a line break"
	(
		echo -n -e \n
	) = (__gyarados_section_line_sep)
end

test "Disabling GYARADOS_PROMPT_SEPARATE_LINE doesn't display a line break"
	(
		set GYARADOS_PROMPT_SEPARATE_LINE false
	) = (__gyarados_section_line_sep)
end
