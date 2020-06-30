#!/bin/bash 

MY_SHELL="bash"
SERVER_NAME=$(hostname) 
MY_SHELL1="csh"

#!/bin/bash

function hello() {
    echo "Hello!"
}
function now() {
    echo "It's $(date +%r)"
}
hello
now

# echo "Bash is Awsome!"
# echo "I like the $MY_SHELL shell"
# echo "I am ${MY_SHELL}ing on my keyboard"
# echo "You are running this script on ${SERVER_NAME}."

#if statement
#if [ condition-is-true ]
#then
#   command 1
#   command 2
#   command N
#fi

# if [ "$MY_SHELL" = "bash" ]
# then
#     echo "You seem to like the Bash Shell"
# fi

#if/else statement
#if [ condition-is-true]
#then
#   command N
#else 
#   command N
#fi

# if [ "$MY_SHELL1" = "bash" ]
# then 
#     echo "You seeem to like the bash shell."
# else
#     echo "You don't seem to like the bash shell"
# fi

#if/elif/else statement
#if [ condition-is-true ]
#then
#   command N
#elif [ condition-is-true ]
#then
#   command N
#else
#   command N
#fi

if [ "$MY_SHELL1" = "bash" ]
then 
    echo "You seem to like the bash shell"
elif [ "$MY_SHELL1" = "csh" ]
then
    echo "You seem to like the csh shell"
else 
echo "You don't seem to like the bash or csh shells"
fi

#for loop statement
#for VARIABLE_NAME in ITEM_1 ITEM_N
#do
#   command 1
#   command 2
#   command N
#done

for COLOR in red green blue
do 
    echo "COLOR: $COLOR"
done