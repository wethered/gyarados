source $DIRNAME/gyarados_test_setup.fish

function setup
	gyarados_test_setup

	function date -a time_format
		command date --version >/dev/null 2>/dev/null
		switch $status
			case 0 # GNU Coreutil
				command date "-u" "-d @1536116421" "$time_format"
			case '*' # MacOS + BSD Compatibility (Lacks --version)
				command date "-u" "-r 1536116421" "$time_format"
		end
	end
end

function teardown
	functions --erase date
end

test "Time is disabled by default?"
	() = (__gyarados_section_time)
end

test "Enabling time! 24-hour by default"
	(
		set GYARADOS_TIME_SHOW true

		set_color --bold
		echo -n "at "
		set_color normal
		set_color --bold yellow
		echo -n "03:00:21"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_time)
end

test "Enabling time with 12-hour instead"
	(
		set GYARADOS_TIME_SHOW true
		set GYARADOS_TIME_12HR true

		set_color --bold
		echo -n "at "
		set_color normal
		set_color --bold yellow
		echo -n "03:00:21"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_time)
end

test "Show the date too"
	(
		set GYARADOS_TIME_SHOW true
		set GYARADOS_DATE_SHOW true

		set_color --bold
		echo -n "at "
		set_color normal
		set_color --bold yellow
		echo -n "2018-09-05"
		echo -n " "
		echo -n "03:00:21"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_time)
end

test "Custom date/time format"
	(
		set GYARADOS_TIME_SHOW true
		set GYARADOS_TIME_FORMAT (date '+%H') # Unix timestamp
		set GYARADOS_TIME_PREFIX "" # Get rid of "at " prefix.

		set_color --bold
		set_color normal
		set_color --bold yellow
		echo -n "03"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_time)
end

test "What is the time? Purple?!"
	(
		set GYARADOS_TIME_SHOW true
		set GYARADOS_TIME_COLOR purple

		set_color --bold
		echo -n "at "
		set_color normal
		set_color --bold purple
		echo -n "03:00:21"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_time)
end
