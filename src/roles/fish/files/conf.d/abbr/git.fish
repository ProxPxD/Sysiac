## general
abbr -a -- gf     'git fetch'
abbr -a -- gfd    'git fetch; git pull'
abbr -a -- ga     'git add'
abbr -a -- gb     'git branch'
abbr -a -- gbr    'git branch -r'
abbr -a -- gbd    'git branch -d'
abbr -a -- gcl    'git clone'
abbr -a -- gc     'git commit'
abbr -a -- gcm    'git commit -m'
abbr -a -- gch    'git checkout'
abbr -a -- gs     'git switch'
abbr -a -- gst    'git switch -t'
abbr -a -- gu     'git push'
abbr -a -- gd     'git pull'
## specific
abbr -a -- gabbr  "z Sysiac; git commit -am 'abbr'; git push; ansible-playbook -K src/playbooks/workstation.yml -t confd"
