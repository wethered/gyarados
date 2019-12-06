#
# .NET
#
# .NET Framework is a software framework developed by Microsoft.
# It includes a large class library and provides language interoperability
# across several programming languages.
# Link: https://www.microsoft.com/net

function __gyarados_section_dotnet -d "Display the .NET SDK version"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_DOTNET_SHOW true
	__gyarados_util_set_default GYARADOS_DOTNET_PREFIX $GYARADOS_PROMPT_DEFAULT_PREFIX
	__gyarados_util_set_default GYARADOS_DOTNET_SUFFIX $GYARADOS_PROMPT_DEFAULT_SUFFIX
	__gyarados_util_set_default GYARADOS_DOTNET_SYMBOL ".NET "
	__gyarados_util_set_default GYARADOS_DOTNET_COLOR "af00d7" # 128 in the original version, but renders as blue in iTerm2?

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	# Show current version of .NET SDK
	[ $GYARADOS_DOTNET_SHOW = false ]; and return

	# Ensure the dotnet command is available
	type -q dotnet; or return

	if not test -f project.json \
		-o -f global.json \
		-o -f paket.dependencies \
		-o (count *.csproj) -gt 0 \
		-o (count *.fsproj) -gt 0 \
		-o (count *.xproj) -gt 0 \
		-o (count *.sln) -gt 0
		return
	end

	# From the
	# dotnet-cli automatically handles SDK pinning (specified in a global.json file)
	# therefore, this already returns the expected version for the current directory
	set -l dotnet_version (dotnet --version 2>/dev/null)

	__gyarados_lib_section \
		$GYARADOS_DOTNET_COLOR \
		$GYARADOS_DOTNET_PREFIX \
		"$GYARADOS_DOTNET_SYMBOL""$dotnet_version" \
		$GYARADOS_DOTNET_SUFFIX
end
