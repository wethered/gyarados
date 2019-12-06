source $DIRNAME/gyarados_test_setup.fish

function setup
	gyarados_test_setup
	mock node -v 0 "echo \"v9.8.0\""
	mkdir -p /tmp/tmp-gyarados/
	cd /tmp/tmp-gyarados
end

function teardown
	rm -rf /tmp/tmp-gyarados
end

test "Prints section when node_modules is present"
	(
		mkdir /tmp/tmp-gyarados/node_modules

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold green
		echo -n "⬢ v9.8.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_node)
end

test "Prints section when package.json is present"
	(
		touch /tmp/tmp-gyarados/package.json

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold green
		echo -n "⬢ v9.8.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_node)
end

test "Doesn't print section when not in a directory with node_modules or package.json"
	() = (__gyarados_section_node)
end

test "Prints nvm version when nvm is installed"
	(
		mkdir /tmp/tmp-gyarados/node_modules
		set -e gyarados_node_version
		mock nvm current 0 "echo \"v9.8.0\""

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold green
		echo -n "⬢ v9.8.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_node)
end

test "Prints cached nvm version if previously used"
	(
		mkdir /tmp/tmp-gyarados/node_modules
		set gyarados_node_version "v1.2.3"
		set gyarados_last_nvm_bin "path_to_bin"
		set NVM_BIN "path_to_bin"
		mock nvm current 0

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold green
		echo -n "⬢ v1.2.3"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_node)
end

test "Prints nodenv version when nodenv is installed"
	(
		mkdir /tmp/tmp-gyarados/node_modules
		mock nodenv version-name 0 "echo \"v9.8.0\""

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold green
		echo -n "⬢ v9.8.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_node)

test "Prints nothing when using the \"system\" version of node with nvm"
	(
		mkdir -p /tmp/tmp-gyarados/node_modules
		mock nvm current 0 "echo \"system\""
	) = (__gyarados_section_node)
end

test "Prints nothing when using the \"system\" version of node with nodenv"
	(
		mkdir /tmp/tmp-gyarados/node_modules
		mock nodenv version-name 0 "echo \"system\""
	) = (__gyarados_section_node)
end

test "Prints nodenv version when nodenv is installed"
	(
		mkdir /tmp/tmp-gyarados/node_modules
		mock nodenv version-name 0 "echo \"node\""
	) = (__gyarados_section_node)
end

test "Changing GYARADOS_NODE_SYMBOL changes the displayed character"
	(
		mkdir /tmp/tmp-gyarados/node_modules
		mock nvm current 0 "echo \"v9.8.0\""
		set GYARADOS_NODE_SYMBOL "· "

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold green
		echo -n "· v9.8.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_node)
end

test "Changing GYARADOS_NODE_PREFIX changes the character prefix"
	(
		mkdir /tmp/tmp-gyarados/node_modules
		set gyarados_exit_code 0
		set GYARADOS_NODE_PREFIX ·

		set_color --bold
		echo -n "·"
		set_color normal
		set_color --bold green
		echo -n "⬢ v9.8.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_node)
end

test "Changing GYARADOS_NODE_PREFIX changes the character prefix"
	(
		mkdir /tmp/tmp-gyarados/node_modules
		set gyarados_exit_code 0
		set GYARADOS_NODE_SUFFIX ·

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold green
		echo -n "⬢ v9.8.0"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
	) = (__gyarados_section_node)
end

test "Setting GYARADOS_NODE_DEFAULT_VERSION to the current version disables the section"
	(
		mkdir /tmp/tmp-gyarados/node_modules
		set gyarados_exit_code 0
		set GYARADOS_NODE_DEFAULT_VERSION v9.8.0
	) = (__gyarados_section_node)
end

test "doesn't display the section when GYARADOS_NODE_SHOW is set to \"false\""
	(
		mkdir /tmp/tmp-gyarados/node_modules
		set GYARADOS_NODE_SHOW false
	) = (__gyarados_section_node)
end
