function __global_fix_typos --description 'Fix known typos before execution'
    set cmd (commandline)
    set newcmd $cmd

    # Simple replacements
    set newcmd (string replace -r -- '--hlep'    '--help'       $newcmd)
    set newcmd (string replace -r -- '--hepl'    '--help'       $newcmd)
    set newcmd (string replace -r -- '--hhelp'   '--help'       $newcmd)
    set newcmd (string replace -r -- '--verison' '--version'    $newcmd)
    if test "$cmd" != "$newcmd"
        commandline --replace $newcmd
    end
end
