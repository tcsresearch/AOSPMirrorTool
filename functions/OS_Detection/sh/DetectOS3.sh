#!/usr/bin/env bash
# From DetectOS1.sh / Fixed by Google AI

# Define the get_distro function so the command works
get_distro() {
    if [[ -f /etc/os-release ]]; then
        source /etc/os-release
        echo "$ID"
    else
        uname
    fi
}

case $(get_distro | tr '[:upper:]' '[:lower:]') in
    raspbian)
        echo "This is Raspbian"
        ;;
    fedora)
        echo "This is Fedora"
        ;;
    ubuntu)
        echo "This is Ubuntu"
        ;;
    darwin)
        echo "This is macOS"
        ;;
    *)
        echo "Unknown or unsupported operating system"
        ;;
esac
