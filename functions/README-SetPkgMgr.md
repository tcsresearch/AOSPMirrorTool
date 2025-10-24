

I wrote these sugars in my .bashrc:

if_os () { [[ $OSTYPE == *$1* ]]; }
if_nix () { 
    case "$OSTYPE" in
        *linux*|*hurd*|*msys*|*cygwin*|*sua*|*interix*) sys="gnu";;
        *bsd*|*darwin*) sys="bsd";;
        *sunos*|*solaris*|*indiana*|*illumos*|*smartos*) sys="sun";;
    esac
    [[ "${sys}" == "$1" ]];
}

So I can do stuff like:

if_nix gnu && alias ls='ls --color=auto' && export LS_COLORS="..."
if_nix bsd && export CLICOLORS=on && export LSCOLORS="..."
if_os linux && alias psg="ps -FA | grep" #alternative to pgrep
if_nix bsd && alias psg="ps -alwx | grep -i" #alternative to pgrep
if_os darwin && alias finder="open -R"


