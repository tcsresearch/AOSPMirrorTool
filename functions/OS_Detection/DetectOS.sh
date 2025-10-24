source ./DetectOS.bfunc

case $(get_distro) in
    case raspbian)
        echo This is Raspbian
        ;;
    case fedora)
        echo This is Fedora
        ;;
    case ubuntu)
        echo This is Ubuntu
        ;;
    case Darwin)
        echo This is macOS
        ;;
esac
