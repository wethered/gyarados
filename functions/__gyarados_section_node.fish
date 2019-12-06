#
# Node.js
#
# Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine.
# Link: https://nodejs.org/

function __gyarados_section_node -d "Display the local node version"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_NODE_SHOW true
	__gyarados_util_set_default GYARADOS_NODE_PREFIX $GYARADOS_PROMPT_DEFAULT_PREFIX
	__gyarados_util_set_default GYARADOS_NODE_SUFFIX $GYARADOS_PROMPT_DEFAULT_SUFFIX
	__gyarados_util_set_default GYARADOS_NODE_SYMBOL "⬢ "
	__gyarados_util_set_default GYARADOS_NODE_DEFAULT_VERSION ""
	__gyarados_util_set_default GYARADOS_NODE_COLOR green

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	# Show the current version of Node
	[ $GYARADOS_NODE_SHOW = false ]; and return

	# Show versions only for Node-specific folders
	if not test -f ./package.json \
		-o -d ./node_modules \
		-o (count *.js) -gt 0
		return
	end

	if type -q nvm
		# Only recheck the node version if the nvm bin has changed
		if test "$NVM_BIN" != "$sf_last_nvm_bin" -o -z "$sf_node_version"
			set -g sf_node_version (nvm current 2>/dev/null)
			set -g sf_last_nvm_bin $NVM_BIN
		end
	else if type -q nodenv
		set -g sf_node_version (nodenv version-name 2>/dev/null)
	else if type -q node
		set -g sf_node_version (node -v 2>/dev/null)
	else
		return
	end

	# Don't echo section if the system verison of node is being used
	[ "$sf_node_version" = "system" -o "$sf_node_version" = "node" ]; and return

	# Don't echo section if the node version matches the default version
	[ "$sf_node_version" = "$GYARADOS_NODE_DEFAULT_VERSION" ]; and return

	__gyarados_lib_section \
		$GYARADOS_NODE_COLOR \
		$GYARADOS_NODE_PREFIX \
		"$GYARADOS_NODE_SYMBOL$sf_node_version" \
		$GYARADOS_NODE_SUFFIX
end
