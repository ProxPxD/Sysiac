alias shut    'fish -c "sleep 0.2; qdbus6 org.kde.Shutdown /Shutdown logoutAndShutdown" &; disown; exit'
alias pa      'shut'
alias papa    'pa'
alias siya    'fish -c "sleep 0.2; qdbus6 org.kde.Shutdown /Shutdown logoutAndReboot" &; disown; exit'
alias nara    'siya'
alias gudni   'fish -c "sleep 0.2; qdbus6 org.kde.Shutdown /Shutdown logoutAndHibernate" &; disown; exit'
alias branoc  'gudni
