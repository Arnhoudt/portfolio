#! /bin/bash

#if directory empty

# if [ -d "./static/build/img" ]; then
#     rm -r "./static/build/img"
#     mkdir -p "./static/build/img"
# fi


for f in $(find ./static/src/img -type f -regex ".*\.png"); do
    # do some stuff here with "$f"
    # remember to quote it or spaces may misbehave
    name=$(echo $f | sed -e 's/.*\/img\///g')
    basename=$(basename $f)
    directory=$(echo $name | sed -e 's/\/*[^\/]*$//g')
    mkdir -p "./static/build/img/$directory"
    for size in 128 256 384 512 768 1024 1536 2048; do
        if test -f "$FILE"; then
            convert -colorspace RGB -resize ${size} -crop ${size}x$(expr $size / 16 \* 9)+0+0 $f "./static/build/img/$directory/${size}_$basename"
        fi
    done
done

# for each file in static/src/img
for f in $(find -E ./static/src/img -regex '.*\.(ico|svg)'); do
    # do some stuff here with "$f"
    # remember to quote it or spaces may misbehave
    name=$(echo $f | sed -e 's/.*\/img\///g')
    basename=$(basename $f)
    directory=$(echo $name | sed -e 's/\/*[^\/]*$//g')
    mkdir -p "./static/build/img/$directory"
    cp $f "./static/build/img/$directory/$basename"
done
