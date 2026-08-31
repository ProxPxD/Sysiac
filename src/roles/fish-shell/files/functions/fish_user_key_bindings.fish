function fish_user_key_bindings
    bind \r __execute_command
    bind \n __execute_command
    bind -M insert \r __execute_command
    bind -M insert \n __execute_command
end
