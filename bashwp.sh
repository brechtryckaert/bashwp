#!/bin/bash
# BashWP 0.1

# Setting the global variables
site_path=$(pwd)
command=$1
subcommand=$2

################## Database connectivity ##################
function setdbvar {
# Sets the variables for the functions that utilize the database
if [ ! -f "wp-config.php" ]; then
        echo "Run BashWP in the folder where wp-config.php is located."
        echo ""
        read -n 1 -s -r -p "Press any key to continue"
        exit
    else
        DB_NAME=$(cat wp-config.php | grep DB_NAME | cut -d \' -f 4)
        DB_USER=$(cat wp-config.php | grep DB_USER | cut -d \' -f 4)
        DB_PASS=$(cat wp-config.php | grep DB_PASSWORD | cut -d \' -f 4)
        DB_HOST=$(cat wp-config.php | grep DB_HOST | cut -d \' -f 4)
        DB_PREFIX=$(cat wp-config.php | grep "\$table_prefix" | cut -d \' -f 2)
fi
}

################## Core Commands ##################

function cmd_core_is-installed {

}

function cmd_core_download {
    cd /tmp
    wget https://wordpress.org/latest.zip
    unzip latest.zip
    cd wordpress
    cp -r * $site_path
    cd /tmp
    rm -rf latest.zip
    rm -rf wordpress
    cd $site_path
}

function cmd_core_version {
    core_version=$(grep wp_version wp-includes/version.php | egrep -o "([0-9]{1,}\.)+[0-9]{1,}")
    echo "WordPress $core_version"
}

################## Plugin Commands ##################

function cmd_plugin_list {
    echo "active plugins:"
}

################## Theme Commands ##################

function cmd_theme_list {
    echo "to be added"
}

################## User Commands ##################

################## Core Commands ##################

################## Runner Class ##################

cmd_${command}_${subcommand}