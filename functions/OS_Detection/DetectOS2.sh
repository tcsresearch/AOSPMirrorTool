case $(get_distro) in 
    raspbian) echo "This is Raspbian" ;; 
    fedora)   echo "This is Fedora" ;; 
    ubuntu)   echo "This is Ubuntu" ;; 
    Darwin)   echo "This is macOS" ;; 
    *)        echo "Unknown Distribution" ;; 
esac
