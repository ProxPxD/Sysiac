abbr -a --position anywhere -- fdir '$__fish_config_dir/'
abbr -a --position anywhere -- fconf '$__fish_config_dir/config.fish'
abbr -a -- zfdir 'z $__fish_config_dir/'
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
abbr -a --position anywhere -- !!  "(history | head -n1 | string split ' ' | tail -n +2 | string join ' ')"
abbr -a --position anywhere -- !1  "(history | head -n1 | tail -n1 | string split ' ' | tail -n +2 | string join ' ')"
abbr -a --position anywhere -- !2  "(history | head -n2 | tail -n1 | string split ' ' | tail -n +2 | string join ' ')"
abbr -a -- lsf "lsd | grep -vE 'tide|prompt|fisher'"
