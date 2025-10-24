DISTRO=$(cat /etc/*-release | grep -w NAME | cut -d= -f2 | tr -d '"')
echo "Determined platform: $DISTRO"

