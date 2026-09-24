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
abbr -a -- gdu    'git pull; git push'
abbr -a -- gud    'git pull; git push'
## specific
abbr -a -- gabbr  "z Sysiac; git commit -am 'abbr'; git push; ansible-playbook -K --vault-password-file ~/.config/ansible/vault_password src/playbooks/workstation.yml -t confd; exec fish"
