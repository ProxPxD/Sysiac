if status is-interactive
    # Commands to run in interactive sessions can go here
end

# PATH
fish_add_path /usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

# helping
set -gx CONDA_ENVS /home/proxpxd/.conda/envs
set -gx PROGS /home/proxpxd/Programs

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

