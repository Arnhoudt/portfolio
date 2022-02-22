value = 0
decodedName = process.argv[2]
encodedName = ""
decodedName.split("").forEach((c, i) =>{
    console.log(c, i)
    value *= 256
    value += (c.charCodeAt(0))
    if(i % 6 == 5){
        console.log(value)
        encodedName += value + "-"
        value = 0
    }
})
if(value === 0){
    encodedName.slice(0, encodedName.length - 1)
}else{
    encodedName += value
}
console.log("http://127.0.0.1:5000/?name="+encodedName)
