source $DIRNAME/gyarados_test_setup.fish

function setup
	gyarados_test_setup
	mock kubectl config 0 "echo \"testkube\""
end

test "Prints section"
	(
		set_color --bold
		echo -n "at "
		set_color normal
		set_color --bold cyan
		echo -n "☸️  testkube (testkube)"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_kubecontext)
end

test "Kubecontext symbol does not appear outside of a Kubernetes project"
	(
		mock kubectl config 1
	) = (__gyarados_section_kubecontext)
end

test "Changing GYARADOS_KUBECONTEXT_SYMBOL changes the displayed character"
	(
		set GYARADOS_KUBECONTEXT_SYMBOL "· "

		set_color --bold
		echo -n "at "
		set_color normal
		set_color --bold cyan
		echo -n "· testkube (testkube)"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_kubecontext)
end

test "Changing GYARADOS_KUBECONTEXT_PREFIX changes the character prefix"
	(
		set gyarados_exit_code 0
		set GYARADOS_KUBECONTEXT_PREFIX ·

		set_color --bold
		echo -n "·"
		set_color normal
		set_color --bold cyan
		echo -n "☸️  testkube (testkube)"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__gyarados_section_kubecontext)
end

test "Changing GYARADOS_KUBECONTEXT_SUFFIX changes the character suffix"
	(
		set gyarados_exit_code 0
		set GYARADOS_KUBECONTEXT_SUFFIX ·

		set_color --bold
		echo -n "at "
		set_color normal
		set_color --bold cyan
		echo -n "☸️  testkube (testkube)"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
	) = (__gyarados_section_kubecontext)
end

test "Doesn't display the section when GYARADOS_KUBECONTEXT_SHOW is set to \"false\""
	(
		set GYARADOS_KUBECONTEXT_SHOW false
	) = (__gyarados_section_kubecontext)
end

test "Doesn't display the namespace section when GYARADOS_KUBECONTEXT_NAMESPACE_SHOW is set to \"false\""
	(
		set GYARADOS_KUBECONTEXT_NAMESPACE_SHOW false
		set gyarados_exit_code 0
		set GYARADOS_KUBECONTEXT_SUFFIX ·

		set_color --bold
		echo -n "at "
		set_color normal
		set_color --bold cyan
		echo -n "☸️  testkube"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
	) = (__gyarados_section_kubecontext)
end

test "Doesn't display the namespace section when kube_context is set to \"default\""
	(
		mock kubectl config 0 "echo \"default\""

		set gyarados_exit_code 0
		set GYARADOS_KUBECONTEXT_SUFFIX ·

		set_color --bold
		echo -n "at "
		set_color normal
		set_color --bold cyan
		echo -n "☸️  default"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
	) = (__gyarados_section_kubecontext)
end
