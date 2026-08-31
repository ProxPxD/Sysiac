if status is-interactive
    # Commands to run in interactive sessions can go here
end

##############
# Appearance #
##############
set -gx fish_color_autosuggestion brblack
set -gx fish_color_command normal
set -gx fish_color_comment brgreen
set -gx fish_color_quote bryellow
set -gx fish_color_param brgreen
set -gx fish_color_cwd brblue
set -gx fish_color_end brblue

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
# podman
set -gx CONTAINERS_COLOR 1
set -gx DOCKER_HOST unix://$XDG_RUNTIME_DIR/podman/podman.sock
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
###############
#             #
###############
eval "$(zoxide init fish)"

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
# fish
abbr -a --position anywhere -- ficonf '$__fish_config_dir/config.fish'
abbr -a --position anywhere -- fconf '$__fish_config_dir/config.fish'
abbr -a -- vconf 'nvim $__fish_config_dir/config.fish'
abbr -a -- vcong 'nvim $__fish_config_dir/config.fish'
abbr -a -- vc    'nvim $__fish_config_dir/config.fish'
abbr -a -- vcf   'nvim $__fish_config_dir/functions/'
abbr -a -- vcfc  'nvim $__fish_config_dir/functions/conda.fish'
abbr -a -- bconf 'bat $__fish_config_dir/config.fish'
abbr -a -- bc    'bat $__fish_config_dir/config.fish'
abbr -a -- bcg   'bat $__fish_config_dir/config.fish | grep'
abbr -a -- bcgi  'bat $__fish_config_dir/config.fish | grep -i'
abbr -a -- hc    'head $__fish_config_dir/config.fish'
abbr -a -- bcf   'bat $__fish_config_dir/functions/'
abbr -a -- bcfc  'bat $__fish_config_dir/functions/conda.fish'
abbr -a  --position anywhere -- !!  "(history | head -n1 | string split ' ' | tail -n +2 | string join ' ')"
abbr -a  --position anywhere -- !1  "(history | head -n1 | tail -n1 | string split ' ' | tail -n +2 | string join ' ')"
abbr -a  --position anywhere -- !2  "(history | head -n2 | tail -n1 | string split ' ' | tail -n +2 | string join ' ')"
# environment.d
abbr -a -- le  'lsd ~/.config/environment.d/'
abbr -a -- ve  'nvim ~/.config/environment.d/'
abbr -a -- be  'bat ~/.config/environment.d/'
abbr -a --position anywhere -- envd  '~/.config/environment.d/'
# env
abbr -a -- eg  'env | grep'
abbr -a -- egi 'env | grep -i'
# source
abbr -a -- s 'source $__fish_config_dir/config.fish'
# ls(d)
abbr -a -- ls     'lsd'
abbr -a -- l      'lsd'
abbr -a -- la     'lsd -A'
abbr -a -- ll     'lsd -lh'
abbr -a -- lla    'lsd -lhA'
abbr -a -- lld    'lsd -lhd'
abbr -a -- lwc    'lsd | wc'
abbr -a -- lwcl   'lsd | wc -l'
abbr -a -- lwcc   'lsd | wc -c'
abbr -a -- lg     'lsd | grep'
abbr -a -- lsg    'lsd | grep'
abbr -a -- lgi    'lsd | grep -i'
abbr -a -- lgv    'lsd | grep -v'
abbr -a -- lgve   'lsd | grep -vE'
abbr -a -- lgvi   'lsd | grep -vi'
abbr -a -- lgiv   'lsd | grep -iv'
abbr -a -- llg    'lsd -lh | grep'
abbr -a -- llag   'lsd -lhA | grep'
abbr -a -- lag    'lsd -A | grep'
abbr -a -- lalg   'lsd -Alh | grep'
abbr -a -- llgi   'lsd -lh | grep -i'
abbr -a -- llgv   'lsd -lh | grep -v'
# mv
abbr -a -- sm    'sudo mv'
abbr -a -- smv   'sudo mv'
abbr -a -- smr   'sudo mv -r'
abbr -a -- smvr  'sudo mv -r'
# rm
abbr -a -- rmd  'rm -d'
abbr -a -- rmr  'rm -r'
abbr -a -- rmrf 'rm -rf'
abbr -a -- srm  'sudo rm'
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
# grep
abbr -a -- g   'grep'
abbr -a -- gi  'grep -i'
abbr -a -- ge  'grep -E'
abbr -a -- gv  'grep -v'
abbr -a -- gve 'grep -vE'
abbr -a --position anywhere -- \\g    '| grep'
abbr -a --position anywhere -- \\gi   '| grep -i'
abbr -a --position anywhere -- \\ge   '| grep -E'
abbr -a --position anywhere -- \\gv   '| grep -v'
abbr -a --position anywhere -- \\gve  '| grep -vE'
# zoxide
set -Ux ZO_MAX_ENTRIES 10000
set -Ux ZO_MAXAGE 1460  # 4 yers
abbr -a -- cd   'z'
abbr -a -- zq   'zoxide query -l'
abbr -a -- zqa  'zoxide query -als'
abbr -a -- zqag 'zoxide query -als | grep'
abbr -a -- zr   'zoxide remove'
# tmsu
abbr -a -- tag  'tmsu tag'
abbr -a -- tags 'tmsu tags'
abbr -a -- tagi 'tmsu init'
abbr -a -- tagm 'tmsu mount'
abbr -a -- tagu 'tmsu unmount'
abbr -a -- tagf 'tmsu files'
abbr -a -- tagd 'tmsu delete'
abbr -a -- tagx 'xargs -I @ tmsu tag @'
# vim
set -Ux VISUAL 'nvim'
set -Ux EDITOR $VISUAL

abbr -a -- vi 'nvim'
abbr -a -- v  'nvim'
abbr -a -- sv 'sudo nvim'
# mkdir
abbr -a -- mk  'mkdir'
abbr -a -- mkp 'mkdir -p'
# wc
abbr -a -- wcl 'wc -l'
abbr -a -- wcc 'wc -c'
abbr -a --position anywhere -- \\wc  '| wc'
abbr -a --position anywhere -- \\wcl '| wc -l'
abbr -a --position anywhere -- \\wcc '| wc -c'
# yay
abbr -a -- pacman 'yay'
abbr -a -- ya     'yay'
abbr -a -- y      'yay'
abbr -a -- yq     'yay -Q'
abbr -a -- yqg    'yay -Q | grep'
abbr -a -- yqgi   'yay -Q | grep -i'
abbr -a -- yql    'yay -Ql'
abbr -a -- ys     'yay -Ss'
abbr -a -- yy     'yay -Sy'
abbr -a -- yu     'yay -Syu --noconfirm --sudoloop'
abbr -a -- yr     'yay -Rns'
# yq (think how to solve with yay)
abbr -a -- yamlq 'yq'
abbr -a -- yamq  'yq'
abbr -a -- yaq   'yq'
abbr -a -- ymq   'yq'
# xdg-open
abbr -a -- x 'xdg-open'
# watch
abbr -a -- w1 'watch -n 1 -c'
# viu
abbr -a -- viun  'viu -n'
abbr -a -- viuh  'viu -h'
abbr -a -- viunh 'viu -nh'
# dolphin
abbr -a -- d 'dolphin . &'
# python
abbr -a -- py 'python'
abbr -a -- p  'python'
# conda
abbr -a -- c       'conda'
abbr -a -- co      'conda'
abbr -a -- con     'conda'
abbr -a -- cond    'conda'
abbr -a -- a       'conda activate'
abbr -a -- ca      'conda activate'
abbr -a -- cac     'conda activate ( ls $CONDA_ENVS | grep common )'
abbr -a -- cend    'conda deactivate'
abbr -a -- cdeact  'conda deactivate'
abbr -a -- cdeac   'conda deactivate'
abbr -a -- cdea    'conda deactivate'
abbr -a -- cde     'conda deactivate'
abbr -a -- cda     'conda deactivate'
abbr -a -- deact   'conda deactivate'
abbr -a -- deac    'conda deactivate'
abbr -a -- dea     'conda deactivate'
abbr -a -- de      'conda deactivate'
abbr -a -- da      'conda deactivate'
abbr -a -- cl      'conda list'
abbr -a -- clg     'conda list | grep'
abbr -a -- cel     'conda env list'
abbr -a -- cee     'conda env export'
abbr -a -- ceu     'conda env update'
abbr -a -- ceuf    'conda env update --file'
abbr -a -- ceupf   'conda env update --prune --file'
abbr -a -- ci      'conda install'
abbr -a -- cif     'conda install --file'
abbr -a -- cu      'conda uninstall'
abbr -a -- cc      'conda create'
abbr -a -- ccn     'conda create -n'
abbr -a -- cconf   'conda config'
abbr -a -- cconfs  'conda config --show'
abbr -a -- cconfsc 'conda config --show channels'
abbr -a -- cconfa  'conda config --append'
abbr -a -- cconfac 'conda config --append channels'
abbr -a -- cconfr  'conda config --remove'
abbr -a -- cconfrc 'conda config --remove channels'
abbr -a -- cr      'conda remove'
abbr -a -- crn     'conda remove -n'
abbr -a -- cran    'conda remove --all -n'
abbr -a -- crna    'conda remove -n --all'
abbr -a -- crf     'conda remove --force'
abbr -a -- cup     'conda update'
# git
abbr -a -- gg   'git'
abbr -a -- gf   'git fetch'
abbr -a -- ga   'git add'
abbr -a -- gb   'git branch'
abbr -a -- gbr  'git branch -r'
abbr -a -- gbd  'git branch -d'
abbr -a -- gcl  'git clone'
abbr -a -- gc   'git commit'
abbr -a -- gcm  'git commit -m'
abbr -a -- gch  'git checkout'
abbr -a -- gs   'git switch'
abbr -a -- gst  'git switch -t'
abbr -a -- gu   'git push'
abbr -a -- gd   'git pull'
# podman
#abbr -a -- docker  'podman'
abbr -a -- dc      'docker compose'
abbr -a -- dc0     'docker compose stop'
abbr -a -- dc1     'docker compose start'
abbr -a -- dcu     'docker compose up'
abbr -a -- dcub    'docker compose up --build'
abbr -a -- pc      'docker compose'
abbr -a -- pc0     'docker compose stop'
abbr -a -- pc1     'docker compose start'
abbr -a -- pcu     'docker compose up'
abbr -a -- pcub    'docker compose up --build'
abbr -a -- pod     'podman'
abbr -a -- p       'podman'
abbr -a -- prun    'podman run'
abbr -a -- pru     'podman run'
abbr -a -- p1      'podman start'
abbr -a -- p0      'podman stop'
abbr -a -- p01     'podman restart'
abbr -a -- pps     'podman ps'
abbr -a -- ppsa    'podman ps -a'
abbr -a -- ppsg    'podman ps | grep'
abbr -a -- pk      'podman kill'
abbr -a -- prm     'podman rm'
abbr -a -- prmi    'podman rmi'
abbr -a -- pl      'podman logs'
abbr -a -- pe      'podman exec'
abbr -a -- pg      'podman generate'
abbr -a -- pgs     'podman generate systemd'
abbr -a -- pgsf    'podman generate systemd --files'
abbr -a -- pgsn    'podman generate systemd -n'
abbr -a -- pgsfn   'podman generate systemd --files -n'
abbr -a -- pimgs   'podman images'
abbr -a -- pimgsg  'podman images | grep'
abbr -a -- pimg    'podman image'
abbr -a -- pimgrm  'podman image rm'
abbr -a -- pimgr   'podman image rm'
abbr -a -- pi      'podman inspect'
abbr -a -- ppod    'podman pod'
abbr -a -- ppo     'podman pod'
abbr -a -- ppodc   'podman pod create'
abbr -a -- ppoc    'podman pod create'
abbr -a -- ppodps  'podman pod ps'
abbr -a -- ppops   'podman pod ps'
abbr -a -- ppodrm  'podman pod rm'
abbr -a -- pporm   'podman pod rm'
abbr -a -- pb      'podman build'
abbr -a -- pbt     'podman build -t'
abbr -a -- pn      'podman network'
abbr -a -- pnc     'podman network create'
abbr -a -- pnrm    'podman network rm'
abbr -a -- pnls    'podman network ls'
abbr -a -- pnl     'podman network ls'
abbr -a -- pni     'podman network inspect'
abbr -a -- pnp     'podman network prune'
abbr -a -- pv      'podman volume'
abbr -a -- pvc     'podman volume create'
abbr -a -- pve     'podman volume export'
## containers
abbr -a -- p1g     'podman start graphdb'
## watch
abbr -a -- wpps    'watch -n1 -c podman ps -a'
abbr -a -- wp      'watch -n1 -c podman ps -a'
abbr -a -- wpl     'watch -n1 -c podman logs'

# systemctl
abbr -a -- sy     'systemctl'
abbr -a -- sen    'systemctl enable'
abbr -a -- senn   'systemctl enable --now'
abbr -a -- sd     'systemctl disable'
abbr -a -- s1     'systemctl start'
abbr -a -- s0     'systemctl stop'
abbr -a -- s01    'systemctl restart'
abbr -a -- ss     'systemctl status'
abbr -a -- sedi   'systemctl edit'
abbr -a -- sdr    'sudo systemctl daemon-reload'
abbr -a -- sc     'systemctl cat'
## user
abbr -a -- suen   'systemctl --user enable'
abbr -a -- suenn  'systemctl --user enable --now'
abbr -a -- sud    'systemctl --user disable'
abbr -a -- su1    'systemctl --user start'
abbr -a -- su0    'systemctl --user stop'
abbr -a -- su01   'systemctl --user restart'
abbr -a -- sus    'systemctl --user status'
abbr -a -- sued   'systemctl --user edit'
abbr -a -- suedi  'systemctl --user edit'
abbr -a -- suc    'systemctl --user cat'
# networking
abbr -a -- mac    'ip link show wlan0 | grep ether | awk \'{print $2}\''
# taskwarrior
abbr -a -- tsk     'task'
abbr -a -- tk      'task'
abbr -a -- tl      'task peek'
abbr -a -- tp      'task peek'
abbr -a -- tla     'task view'
abbr -a -- tv      'task view'
abbr -a -- ta      'task add'
abbr -a -- ts      'task show'
abbr -a -- tsg     'task show | grep'
abbr -a -- tc      'task config'
abbr -a -- tcr     'task config report'
abbr -a -- tu      'task undo'
abbr -a -- te      'task export'
abbr -a -- tej     'task export | jq'
abbr -a -- tejq    'task export | jq'
abbr -a -- ti      'task import'
abbr -a -- tcal    'task calendar'
abbr -a -- tclean  'task status:deleted purge'
abbr -a -- tkr     'task remove'

abbr -a -- tcol    'task show report | grep columns | choose 1 | string split , | sort | uniq'
abbr -a -- tcols   'task show report | grep columns | choose 1 | string split , | sort | uniq'
abbr -a -- tcolors 'task rc.color=on rc._forcecolor=1 color legend'

# timew
abbr -a -- tsum    'timew summary'
abbr -a -- t1      'timew start'
abbr -a -- t0      'timew stop'
abbr -a -- tcon    'timew continue'
abbr -a -- tcan    'timew cancel'
abbr -a -- tdel    'timew delete'

# nchat
abbr -a -- chat    'nchat'
abbr -a -- nc      'nchat'
abbr -a -- nch     'nchat -h'
abbr -a -- nchg    'nchat -h | grep'
abbr -a -- nchgi   'nchat -h | grep -i'
abbr -a -- nck     'nchat -k'


