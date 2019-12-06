function gyarados_test_setup
	# Delete all lingering gyarados variables
	set --name | grep -E '^(GYARADOS_|gyarados_)' | while read -l var
		set -e $var
	end

	# Delete lingering mocked functions
	for mock in $_mocked
		unmock $mock
	end

	# Initialize gyarados theme
	fish_prompt>/dev/null
end
