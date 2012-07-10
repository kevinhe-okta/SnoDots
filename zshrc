# .zshrc
# This version is modified and maintained by Josh "SnoFox" Johnson
# Past author: David Majnemer
# Original author: Saleem Abdulrasool <compnerd@compnerd.org>
# vim:set nowrap:
synchub='void.snofox.net'

export TZ='America/Los_Angeles'
vim=`which vim`
export EDITOR=$vim
export VISUAL=$vim
if [[ $TERM != *screen* ]]; then
    if [[ `hostname` != $synchub ]]; then
        if [[ ! -f ~/.config/snosync/lastsync ]]; then
            ~/.bin/snosync/sanitycheck.sh
        fi
       
        LASTSYNC=`cat ~/.config/snosync/lastsync`
        NOW=`date +%s`
        LASTSYNCDIFF=`expr $NOW - $LASTSYNC`


        if [ $LASTSYNCDIFF -gt 3600 ]; then
            echo "Syncing profile with ${synchub}..."
            echo $NOW > ~/.config/snosync/lastsync
            if [ -f "`which screen`" ]; then
                screen -ln -d -m -S rsync ~/.bin/rsync.sh
            else
                echo '(You should install screen, by the way)'
                ~/.bin/rsync.sh&
            fi
        else
            echo "Synchronized with ${synchub} less than an hour ago; refusing to do it again."
        fi
    fi
fi



case `uname -s` in
    Darwin)
        export LHOSTNAME=`scutil --get LocalHostName`
        ;;
    *)
        export LHOSTNAME=${HOST}
        ;;
esac

autoload compinit; compinit -d "${HOME}/.zsh/.zcompdump-${LHOSTNAME}"

autoload age
autoload zmv

if [ ${ZSH_VERSION//.} -gt 420 ] ; then
    autoload -U url-quote-magic
    zle -N self-insert url-quote-magic
fi

autoload -U edit-command-line
zle -N edit-command-line

# Keep track of other people accessing the box
watch=( all )
export LOGCHECK=30
export WATCHFMT=$'\e[00;00m\e[01;36m'" -- %n@%m has %(a.logged in.logged out) --"$'\e[00;00m'

# directory hashes
if [ -d "${HOME}/sandbox" ] ; then
    hash -d sandbox="${HOME}/sandbox"
fi

if [ -d "${HOME}/work" ] ; then
    hash -d work="${HOME}/work"

    for dir in "${HOME}"/work/*(N-/) ; do
        hash -d $(basename "${dir}")="${dir}"
    done
fi

# common shell utils
if [ -d "${HOME}/.commonsh" ] ; then
    for file in "${HOME}"/.commonsh/*(N.x:t) ; do
        . "${HOME}/.commonsh/${file}"
    done
fi

# extras
if [ -d "${HOME}/.zsh" ] ; then
    for file in "${HOME}"/.zsh/*(N.x:t) ; do
        . "${HOME}/.zsh/${file}"
    done
fi
