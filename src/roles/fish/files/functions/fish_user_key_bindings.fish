function fish_user_key_bindings
    bind \r __execute_commands
    bind \n __execute_commands
    bind -M insert \r __execute_commands
    bind -M insert \n __execute_commands
end
