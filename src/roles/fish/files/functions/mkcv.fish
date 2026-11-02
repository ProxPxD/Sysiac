function mkcv
    set -l path $argv[0]
    mkdir -p $path
    cd $path
    mv ~/Downloads/Piotr_Maliszewski_Modular_CV.pdf .
end
