
echo 'Hello! This is the content of script in GitHub Actions for using Secrets + Public Vars ... '
echo 'Welcome to the CI/CD world ...'
echo ''
echo 'Try to print out the public values from GitHub Actions ...'
echo '-------------------------------------------------------------------'
echo "CONFIG_ROOT_URL = $CONFIG_ROOT_URL"
echo "CONFIG_RABBIT_MQ_URL = $CONFIG_RABBIT_MQ_URL"
echo ''
echo 'Try to print out the secret value from GitHub Actions ...'
echo '-------------------------------------------------------------------'
echo "LOGIN_DOCKER_USR = $LOGIN_DOCKER_USR"
echo "LOGIN_DOCKER_PWD = $LOGIN_DOCKER_PWD"
