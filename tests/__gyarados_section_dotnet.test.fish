source $DIRNAME/gyarados_test_setup.fish

function setup
	gyarados_test_setup
	mock dotnet --version 0 "echo \"2.1.403\""
	mkdir -p /tmp/tmp-gyarados
	cd /tmp/tmp-gyarados
end

function teardown
	rm -rf /tmp/tmp-gyarados
end

test "Prints nothing when required files are missing"
	(
		rm -f /tmp/tmp-gyarados/project.json
		rm -f /tmp/tmp-gyarados/global.json
		rm -f /tmp/tmp-gyarados/paket.dependencies
		rm -f '/tmp/tmp-gyarados/*.sln'
		rm -f '/tmp/tmp-gyarados/*.csproj'
		rm -f '/tmp/tmp-gyarados/*.fsproj'
		rm -f '/tmp/tmp-gyarados/*.xproj'
	) = (__gyarados_section_dotnet)
end

test "Prints section if project.json is present"
	(
		touch /tmp/tmp-gyarados/project.json

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold af00d7
		echo -n ".NET 2.1.403"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dotnet)
end

test "Prints section if global.json is present"
	(
		touch /tmp/tmp-gyarados/global.json
		set_color --bold

		echo -n "via "
		set_color normal
		set_color --bold af00d7
		echo -n ".NET 2.1.403"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dotnet)
end

test "Prints section if paket.dependencies is present"
	(
		touch /tmp/tmp-gyarados/paket.dependencies
		set_color --bold

		echo -n "via "
		set_color normal
		set_color --bold af00d7
		echo -n ".NET 2.1.403"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dotnet)
end

test "Prints section if a .csproj file is present"
	(
		touch /tmp/tmp-gyarados/tmp.csproj

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold af00d7
		echo -n ".NET 2.1.403"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dotnet)
end

test "Prints section if a .fsproj file is present"
	(
		touch /tmp/tmp-gyarados/tmp.fsproj

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold af00d7
		echo -n ".NET 2.1.403"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dotnet)
end

test "Prints section if a .xproj file is present"
	(
		touch /tmp/tmp-gyarados/tmp.xproj
		set_color --bold

		echo -n "via "
		set_color normal
		set_color --bold af00d7
		echo -n ".NET 2.1.403"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dotnet)
end

test "Prints section if a .sln file is present"
	(
		touch /tmp/tmp-gyarados/tmp.sln

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold af00d7
		echo -n ".NET 2.1.403"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dotnet)
end

test "Changing GYARADOS_DOTNET_SYMBOL changes the displayed character"
	(
		touch /tmp/tmp-gyarados/tmp.sln

		set GYARADOS_DOTNET_SYMBOL "· "
		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold af00d7
		echo -n "· 2.1.403"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dotnet)
end

test "Changing GYARADOS_DOTNET_PREFIX changes the character prefix"
	(
		touch /tmp/tmp-gyarados/tmp.sln
		set gyarados_exit_code 0
		set GYARADOS_DOTNET_PREFIX ·

		set_color --bold
		echo -n "·"
		set_color normal
		set_color --bold af00d7
		echo -n ".NET 2.1.403"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_dotnet)
end

test "Changing GYARADOS_DOTNET_SUFFIX changes the character prefix"
	(
		touch /tmp/tmp-gyarados/tmp.sln
		set gyarados_exit_code 0
		set GYARADOS_DOTNET_SUFFIX ·

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold af00d7
		echo -n ".NET 2.1.403"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
	) = (__gyarados_section_dotnet)
end

test "Doesn't display .NET when GYARADOS_DOTNET_SHOW is set to 'false'"
	(
		set GYARADOS_DOTNET_SHOW false
	) = (__gyarados_section_dotnet)
end
