#!/bin/sh

PATH_TO_TEMPLATES=/Applications/Android\ Studio.app/Contents/plugins/android/lib/templates/

FRAGMENT_SRC=template/MvvmFeatureFragment
FRAGMENT_DST=$PATH_TO_TEMPLATES/other

ACTIVITY_SRC=template/MvvmFeatureActivity
ACTIVITY_DST=$PATH_TO_TEMPLATES/activities

copyTo() {
    cp -rf "$1" "$2"
    echo "$1" is copied to "$2"
    echo
}

copyTo "$FRAGMENT_SRC" "$FRAGMENT_DST"

sleep 1

copyTo "$ACTIVITY_SRC" "$ACTIVITY_DST"

sleep 1


echo
echo  "Done. \033[33;5mRestart Android Studio\033[0m"


