#! /bin/bash
FORCE=0
while getopts "f" option; do
    case ${option} in
        f ) # Force option
            FORCE=1
            echo "Skipping Tests"
        ;;
        \? ) #For invalid option
            echo "You have to use: [-f] to force the build"
        ;;
    esac
done

if [ `npm run | grep -q test` ] && [ $FORCE -eq 0 ]; then
    echo "Are you shure npm is installed? Use -f to skip tests"
    exit 1
fi

package='tailwindcss'
if [ `npm list | grep -c $package` -eq 0 ]; then
    npm install $package --no-shrinkwrap
fi

npx tailwindcss -i ./static/src/style.css -o ./static/css/main.css --minify
python ./static.py