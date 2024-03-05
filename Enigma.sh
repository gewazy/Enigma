#! /bin/bash
################################################################################
#    #####  #   #  #  #####  #     #   ####     author: Gewazy                 #
#    #      ##  #  #  #      ##   ##  #    #    project: Enigma                #
#    ###    # # #  #  #  ##  # # # #  ######    desc: Program for encrypting   #
#    #      #  ##  #  #   #  #  #  #  #    #          messages and files.      #
#    #####  #   #  #  #####  #     #  #    #    source:hyperskill.org          #
################################################################################


ord() {
    #change letter to ASCII value
    value=$(printf "%d\n" "'$1")
    echo $value
}


chr() {
    # change ASCII value to letter
    char=$(printf "%b\n" "$(printf "\\%03o" "$1")")
    echo $char
}


reducer() {
    # dealing with the situation when the key>9 and when the sum(letter_value, key) > 106,
    # to keep the value of encrypted letter in range 65-90.
    if [ $1 -gt 90 ]; then
        num=$(($1 % 90 + 64)) 
        reducer $num
    else
        echo $1
    fi    
}


main() {
    echo "Enter an uppercase letter:"    
    read letter
    echo "Enter a key:"
    read key

    letter_re='^[A-Z]$'
    key_re='^[0-9]$'
    # key_re='^[0-9]+$' #uncomment for key > 9
    if [[ $letter =~ $letter_re ]] && [[ $key =~ $key_re ]]; then
        letter_val=$(ord $letter)
        encrypted_val=$(($letter_val + $key))
        encrypted_val_reduce=$(reducer $encrypted_val)
        encrypted_letter=$(chr $encrypted_val_reduce)
        
        echo "Encrypted letter: $encrypted_letter"
        
    else
        echo "Invalid key or letter!"
    fi
}



################################################################################ 

main
