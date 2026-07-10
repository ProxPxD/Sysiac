function conda
    # If Conda is already initialized, just run it
    if functions -q __conda_activate
        conda $argv
    else
        # Initialize Conda and then run the command if exist
	/opt/anaconda/bin/conda "shell.fish" "hook" | source
	if test (count $argv) -ne 0
	    conda $argv
	end
    end
end
