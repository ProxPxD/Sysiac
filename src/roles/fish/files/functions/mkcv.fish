function mkcv
    set -l name $argv[1]
    mkdir -p $name
    cd $name
    mv ~/Downloads/Piotr_Maliszewski_Modular_CV.pdf .
end
