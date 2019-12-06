#
# Docker
#
# Current Docker version and Machine name.

function __gyarados_section_docker -d "Display docker version and machine name"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__gyarados_util_set_default GYARADOS_DOCKER_SHOW true
	__gyarados_util_set_default GYARADOS_DOCKER_PREFIX "is "
	__gyarados_util_set_default GYARADOS_DOCKER_SUFFIX $GYARADOS_PROMPT_DEFAULT_SUFFIX
	__gyarados_util_set_default GYARADOS_DOCKER_SYMBOL "🐳 "
	__gyarados_util_set_default GYARADOS_DOCKER_COLOR cyan
	__gyarados_util_set_default GYARADOS_DOCKER_VERBOSE_VERSION false

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	[ $GYARADOS_DOCKER_SHOW = false ]; and return

	# Show Docker version only if docker is installed
	type -q docker; or return

	# Show docker version only when pwd has Dockerfile, docker-compose.yml, .dockerenv in root or COMPOSE_FILE
	if not test -f Dockerfile \
		-o -f docker-compose.yml \
		-o -f /.dockerenv \
		-o -f "$COMPOSE_FILE"
		return
	end

	set -l docker_version (docker version -f "{{.Server.Version}}" 2>/dev/null)
	# if docker daemon isn't running you'll get an error like 'Bad response from Docker engine'
	[ -z $docker_version ]; and return

	if test "$GYARADOS_DOCKER_VERBOSE_VERSION" = "false"
			set docker_version (string split - $docker_version)[1]
	end

	if test -n "$DOCKER_MACHINE_NAME"
			set docker_version $docker_version via $DOCKER_MACHINE_NAME
	end

	__gyarados_lib_section \
	$GYARADOS_DOCKER_COLOR \
	$GYARADOS_DOCKER_PREFIX \
	"$GYARADOS_DOCKER_SYMBOL"v"$docker_version" \
	$GYARADOS_DOCKER_SUFFIX
end
