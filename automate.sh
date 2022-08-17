if [ -z "$1" ]; then
    echo "Failed. please enter command : automate yourName yourNameFB yourNameLinkedIn"
else
    cd ~
    a="$1 at `date`"
    FOLDER="${a// /' '}"
    rm -rf ${FOLDER}
    NAME=`uname -a`
    touch facebook.txt
    touch linkedin.txt
    touch list_of_my_friends.txt
    touch about_this_laptop.txt
    touch internet_connection.txt
    echo "https://www.facebook.com/$2" >> facebook.txt
    echo "https://www.linkedin.com/in/$3" >> linkedin.txt 
    echo "My username: $1" >> about_this_laptop.txt
    echo "With host: ${NAME}" >> about_this_laptop.txt 
    ping -c 3 google.com > internet_connection.txt
    curl https://gist.githubusercontent.com/tegarimansyah/e91f335753ab2c7fb12815779677e914/raw/94864388379fecee450fde26e3e73bfb2bcda194/list%2520of%2520my%2520friends.txt > list_of_my_friends.txt
    mkdir -p "${FOLDER}"/{my_friends,my_system_info,about_me}
    mv list_of_my_friends.txt "${FOLDER}"/my_friends
    mv about_this_laptop.txt internet_connection.txt "${FOLDER}"/my_system_info
    cd "${FOLDER}"/about_me
    mkdir personal
    mkdir profesional
    cd ~
    mv facebook.txt "${FOLDER}"/about_me/personal
    mv linkedin.txt "${FOLDER}"/about_me/profesional    
fi