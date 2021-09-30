target="$1"

echo -e "\n\e[36m[\e[32m+\e[36m]\e[92m Decompiling ... \e[0m\n" 

apktool d $target -f -o "$target"_decompile

echo -e "\n\e[36m[\e[32m+\e[36m]\e[92m Decompiled & Saved in /"$target"_decompile ! \e[0m\n" 

echo -e "\n\e[36m[\e[32m+\e[36m]\e[92m Running Nuclei Templates ... \e[0m\n" 

pwd | (read foo; echo "$foo"/"$target"_decompile | nuclei -silent -json -t /wd/mobile-nuclei-templates/ -o output.txt )
