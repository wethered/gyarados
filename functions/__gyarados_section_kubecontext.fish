#
#  Kubernetes (kubectl)
#
# Kubernetes is an open-source system for deployment, scaling,
# and management of containerized applications.
# Link: https://kubernetes.io/

function __gyarados_section_kubecontext -d "Display the kubernetes context"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_KUBECONTEXT_SHOW true
	__gyarados_util_set_default GYARADOS_KUBECONTEXT_NAMESPACE_SHOW true
	__gyarados_util_set_default GYARADOS_KUBECONTEXT_PREFIX "at "
	__gyarados_util_set_default GYARADOS_KUBECONTEXT_SUFFIX $GYARADOS_PROMPT_DEFAULT_SUFFIX
	# Additional space is added because ☸️ is wider than other symbols
	# See: https://github.com/denysdovhan/spaceship-prompt/pull/432
	__gyarados_util_set_default GYARADOS_KUBECONTEXT_SYMBOL "☸️  "
	__gyarados_util_set_default GYARADOS_KUBECONTEXT_COLOR cyan


	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	# Show current kubecontext
	[ $GYARADOS_KUBECONTEXT_SHOW = false ]; and return
	# Ensure the kubectl command is available
	type -q kubectl; or return

	set -l kube_context (kubectl config current-context 2>/dev/null)
	[ -z $kube_context ]; and return

	if test "$GYARADOS_KUBECONTEXT_NAMESPACE_SHOW" = "true" -a "$kube_context" != "default"
		set kube_namespace (kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)
		set kube_context "$kube_context ($kube_namespace)"
	end

	__gyarados_lib_section \
		$GYARADOS_KUBECONTEXT_COLOR \
		$GYARADOS_KUBECONTEXT_PREFIX \
		"$GYARADOS_KUBECONTEXT_SYMBOL""$kube_context" \
		$GYARADOS_KUBECONTEXT_SUFFIX
end
