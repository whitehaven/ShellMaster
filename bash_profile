# Setting PATH for Python 3.3
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.3/bin:${PATH}"
export PATH
export PATH=$PATH/usr/bin:/etc:/usr/local/sbin:/usr/texbin:/Users/WhiteHaven/Dropbox/CS-Projects/Scripts:
export CLICOLOR=1

export EDITOR="/usr/local/bin/mate -w"

export LSCOLORs=ExFxCxDxBxegedabagacad

# Classic one from before
# PS1="\[\033[0;34m\]\\u@\[\033[1;34m\]\\h\[\033[1;37m\]:\\W-> "

# Custom bash prompt via kirsle.net/wizards/ps1.html
export PS1="\n________________________________________________________________________________\n\[|$(tput setaf 6)\]\w \[$(tput bold)\]\[$(tput setaf 2)\]@ \h \[$(tput setaf 4)\](\u)\[$(tput setaf 7)\]\n|-> \[$(tput sgr0)\]"
export PS2="|-> "

#   ---------------------------------------
#   IP
#   ---------------------------------------
alias getExternalIP='wget -qO- http://ipecho.net/plain'
alias getLocalIP='ipconfig getifaddr en0'
alias getGatewayIP='route -n get default | grep gateway:'
alias fastping='ping -c 100 -s.2'

# Auto-restart download
alias wget='wget -c'

#   ---------------------------------------
#   Terminal Directories
#   ---------------------------------------

alias CS235='cd /Users/WhiteHaven/Dropbox/BYU\ Summer\ 2014/CS\ 235'
alias WHIscripts='cd ~/Dropbox/CS-Projects/Scripts'
alias getTemps='/Applications/TemperatureMonitor.app/Contents/MacOS/tempmonitor -c -l -a'

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}
#   ---------------------------------------
#   File Management
#   ---------------------------------------
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"

# See http://www.shellperson.net/using-sudo-with-an-alias/
alias sudo='sudo '

# Shortcuts
#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------
# Add colors for filetype and  human-readable sizes by default on 'ls':

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ls -AlhF'
alias ll='ls -lh'
alias ld="ls -ld"
alias l='ls'
alias c='clear'
alias x='exit'
alias q='exit'
alias rf='rm -rf'
alias mkdir='mkdir -pv'
alias h='history'

#Jobs
alias j='jobs -l'

# CD Assist
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# Make tar verbose
alias tar='tar -v'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Emergency Shutdown
alias pmset-shutdownnow='sudo /sbin/shutdown -h now'

# Upgraded utilities
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias numFiles='echo $(ls -1 | wc -l)' 
alias rm='rm -v'

alias h='history'
alias hgrep="history | grep"
alias j='jobs -l'

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

#Start calculator with math support
alias bc='bc -l'

# Use colored diff
alias diff='colordiff'

# Quicklook file
ql () { qlmanage -p "$*" >& /dev/null; }

# top
alias cpu='top -o cpu'
alias mem='top -o rsize' # memory

# copy the working directory path
alias cpwd='pwd|tr -d "\n"|pbcopy'

#copy output of last command to clipboard
alias cl="fc -e -|pbcopy"

# share history between terminal sessions
alias he="history -a" # export history
alias hi="history -n" # import history

#   ---------------------------
#   4.  SEARCHING
#   ---------------------------

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }


#	memHogs: Find memory hogs
    alias memHogs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
    alias cpuHogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'
	
# ipInfo: Get info on connections for en0
	alias ipInfo='ipconfig getpacket en0'              

	#   ---------------------------------------
	#   7.  SYSTEMS OPERATIONS & INFORMATION
	#   ---------------------------------------

	alias mountReadWrite='/sbin/mount -uw /'    # mountReadWrite:   For use when booted into single-user

	#   cleanupDS:  Recursively delete .DS_Store files
	#   -------------------------------------------------------------------
    alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

	#   finderShowHidden:   Show hidden files in Finder
	#   finderHideHidden:   Hide hidden files in Finder
	#   -------------------------------------------------------------------
    alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
    alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

	#   cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu
	#   ---------------------------------------------------------------------------------
    alias cleanupOpenWith="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

	#    screensaverDesktop: Run a screensaver on the Desktop
	#   -----------------------------------------------------------------------------------
    alias screensaverDesktop='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'

	#   ---------------------------------------
	#   9.  REMINDERS & NOTES
	#   ---------------------------------------

	#   remove_disk: spin down unneeded disk
	#   ---------------------------------------
	#   diskutil eject /dev/disk1s3

	#   to change the password on an encrypted disk image:
	#   ---------------------------------------
	#   hdiutil chpass /path/to/the/diskimage

	#   to mount a read-only disk image as read-write:
	#   ---------------------------------------
	#   hdiutil attach example.dmg -shadow /tmp/example.shadow -noverify

	#   mounting a removable drive (of type msdos or hfs)
	#   ---------------------------------------
	#   mkdir /Volumes/Foo
	#   ls /dev/disk*   to find out the device to use in the mount command)
	#   mount -t msdos /dev/disk1s1 /Volumes/Foo
	#   mount -t hfs /dev/disk1s1 /Volumes/Foo