if status is-interactive
    # Commands to run in interactive sessions can go here
end

########
# Envs #
########
# Editor
set -gx EDITOR vim
set -gx VISUAL vim
# helping
set -gx CONDA_ENVS /home/proxpxd/.conda/envs
set -gx PROGS /home/proxpxd/Programs
# system
set -gx CRYPTOGRAPHY_OPENSSL_NO_LEGACY 1
# webgpu
set -gx GBM_BACKEND nvidia-drm
set -gx __GLX_VENDOR_LIBRARY_NAME nvidia
set -gx MOZ_ENABLE_WAYLAND 1
set -gx MOZ_WEBRENDER 1
# nchat
set -gx NCHAT_CMAKEARGS "-DHAS_SIGNAL=ON"
# ssh
set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

# PATH
#fish_add_path -a /opt/anaconda/bin/
#fish_add_path -p /usr/bin
#set -gx PATH /usr/local/bin /usr/bin /usr/local/sbin /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl
set -gx PATH /usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl #/opt/anaconda/bin /opt/anaconda/condabin

###########
# Scripts #
###########
function _run_py
        set -l py "$CONDA_ENVS/$argv[1]/bin/python"
        $py $argv[2..-1]
end
#funcsave _run_py

# scripts
function t
        _run_py scraplang311 "$PROGS/ScrapLang/src/translate.py" $argv
end
abbr -a -- tot    't -ot'
abbr -a -- ti     't -i'
abbr -a -- tit    't -it'
abbr -a -- toit   't -oit'
abbr -a -- tiot   't -iot'
abbr -a -- tsc    't pl sv da -g -w'

function langcode
        _run_py langcode311 "$PROGS/Langcode/src/main.py" $argv
end
alias lc langcode
#funcsave t

################
# Unix aliases #
################
# traversal
alias ...  'z ../..'
alias .... 'z ../../..'
alias .1   'z ..'
alias .2   'z ../..'
alias .3   'z ../../..'
alias .4   'z ../../../..'
alias .5   'z ../../../../..'
# sudo
alias kurwa   'sudo'
alias please  'sudo'
# shutdowns & restarts
alias shut    'fish -c "sleep 0.2; qdbus6 org.kde.Shutdown /Shutdown logoutAndShutdown" &; disown; exit'
alias pa      'shut'
alias papa    'pa'
alias siya    'fish -c "sleep 0.2; qdbus6 org.kde.Shutdown /Shutdown logoutAndReboot" &; disown; exit'
alias nara    'siya'
alias gudni   'fish -c "sleep 0.2; qdbus6 org.kde.Shutdown /Shutdown logoutAndHibernate" &; disown; exit'
alias branoc  'gudni'
# utilities
alias less    'bat --paging=always'
alias tg      'nchat -d ~/.config/nchat-telegram'
alias sg      'nchat -d ~/.config/nchat-signal'
alias wa      'nchat -d ~/.config/nchat-whatsapp'

#################
# Abbreviations #
#################

# environment.d
abbr -a -- le  'lsd ~/.config/environment.d/'
abbr -a -- ve  'nvim ~/.config/environment.d/'
abbr -a -- be  'bat ~/.config/environment.d/'
abbr -a --position anywhere -- envd  '~/.config/environment.d/'

# bat/cat/less
abbr -a -- cat  'bat'
abbr -a -- ba   'bat'
abbr -a -- b    'bat'
abbr -a -- batm 'bat --style header,grid,numbers'
abbr -a -- bam  'bat --style header,grid,numbers'
abbr -a -- bm   'bat --style header,grid,numbers'
abbr -a -- bal  'bat -l'
abbr -a -- baly 'bat -l yaml'
abbr -a -- balj 'bat -l json'
abbr -a -- balt 'bat -l toml'
abbr -a -- bali 'bat -l toml'
abbr -a -- bl   'bat -l'
abbr -a -- bly  'bat -l yaml'
abbr -a -- blj  'bat -l json'
abbr -a -- blt  'bat -l toml'
abbr -a -- bli  'bat -l ini'
abbr -a -- bml  'bat --style header,grid,numbers -l'
abbr -a -- bmly 'bat --style header,grid,numbers -l yaml'
abbr -a -- bmlj 'bat --style header,grid,numbers -l json'
abbr -a -- bmlt 'bat --style header,grid,numbers -l toml'
abbr -a -- bmli 'bat --style header,grid,numbers -l ini'
abbr -a --position anywhere -- \\less    '| less'
abbr -a --position anywhere -- \\les     '| less'
abbr -a --position anywhere -- \\le      '| less'
abbr -a --position anywhere -- \\l       '| less'

# vim
set -Ux VISUAL 'nvim'
set -Ux EDITOR $VISUAL
