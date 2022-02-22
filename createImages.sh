#! /bin/bash

#if directory empty

if [ -d "./static/build/img" ]; then
    rm -r "./static/build/img"
    mkdir -p "./static/build/img"
fi


# for each png in static/src/img
for f in $(find ./static/src/img -type f -regex ".*\.png"); do
    # do some stuff here with "$f"
    # remember to quote it or spaces may misbehave
    name=$(echo $f | sed -e 's/.*\/img\///g')
    basename=$(basename $f)
    directory=$(echo $name | sed -e 's/\/*[^\/]*$//g')
    for size in 128 256 384 512 768 1024 1536 2048; do
        mkdir -p "./static/build/img/$directory"
        convert -colorspace RGB -resize ${size} -crop ${size}x$(expr $size / 16 \* 9)+0+0 $f "./static/build/img/$directory/${size}_$basename"
    done
done

# for each file in static/src/img
for f in $(find ./static/src/img -type f -regex ".*\.svg"); do
    # do some stuff here with "$f"
    # remember to quote it or spaces may misbehave
    name=$(echo $f | sed -e 's/.*\/img\///g')
    basename=$(basename $f)
    directory=$(echo $name | sed -e 's/\/*[^\/]*$//g')
    mkdir -p "./static/build/img/$directory"
    convert -colorspace RGB $f "./static/build/img/$directory/$basename"
done