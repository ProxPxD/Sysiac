function mkfile
    for path in $argv
        mkdir -p (dirname $path); and touch $path
    end
end
