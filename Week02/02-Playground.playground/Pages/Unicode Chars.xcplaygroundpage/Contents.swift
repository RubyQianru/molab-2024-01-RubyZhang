
// Explore Unicode characters

import Foundation

//"Vehicles", emojis: "🚙🚗🚘🚕🚖🏎🚚🛻🚛🚐🚓🚔🚑🚒🚀✈️🛫🛬🛩🚁🛸🚲🏍🛶⛵️🚤🛥🛳⛴🚢🚂🚝🚅🚆🚊🚉🚇🛺🚜")
//"Sports", emojis: "🏈⚾️🏀⚽️🎾🏐🥏🏓⛳️🥅🥌🏂⛷🎳")
//"Music", emojis: "🎼🎤🎹🪘🥁🎺🪗🪕🎻")
//"Animals", emojis: "🐥🐣🐂🐄🐎🐖🐏🐑🦙🐐🐓🐁🐀🐒🦆🦅🦉🦇🐢🐍🦎🦖🦕🐅🐆🦓🦍🦧🦣🐘🦛🦏🐪🐫🦒🦘🦬🐃🦙🐐🦌🐕🐩🦮🐈🦤🦢🦩🕊🦝🦨🦡🦫🦦🦥🐿🦔")
//"Animal Faces", emojis: "🐵🙈🙊🙉🐶🐱🐭🐹🐰🦊🐻🐼🐻‍❄️🐨🐯🦁🐮🐷🐸🐲")
//"Flora", emojis: "🌲🌴🌿☘️🍀🍁🍄🌾💐🌷🌹🥀🌺🌸🌼🌻")
//"Weather", emojis: "☀️🌤⛅️🌥☁️🌦🌧⛈🌩🌨❄️💨☔️💧💦🌊☂️🌫🌪")
//"COVID", emojis: "💉🦠😷🤧🤒")
//"Faces", emojis: "😀😃😄😁😆😅😂🤣🥲☺️😊😇🙂🙃😉😌😍🥰😘😗😙😚😋😛😝😜🤪🤨🧐🤓😎🥸🤩🥳😏😞😔😟😕🙁☹️😣😖😫😩🥺😢😭😤😠😡🤯😳🥶😥😓🤗🤔🤭🤫🤥😬🙄😯😧🥱😴🤮😷🤧🤒🤠")

let ch1 = "🐥"
print("ch1.unicodeScalars", ch1.unicodeScalars)

print(Array(ch1.unicodeScalars))
let a = Array(ch1.unicodeScalars)
print("a", a)
//print(a[1])



let ch2 = "🦔"
print("ch2", Array(ch2.unicodeScalars))

// https://developer.apple.com/documentation/swift/string
// https://en.wikipedia.org/wiki/Emoji#Unicode_blocks
// https://cs193p.sites.stanford.edu/
// https://web.stanford.edu/class/cs193p/Spring2021/EmojiArtL12.zip

let str = "🐥🐣🐂🐄🐎🐖🐏🐑"
//  for uni in str {
//    print(uni)
//  }
print("str", str)
print("str.count", str.count)
print("str startIndex",str[str.startIndex])
print("str startIndex offsetBy",str[str.index(str.startIndex, offsetBy: 3)])

let nstr:NSString = "🐥🐣🐂🐄🐎🐖🐏🐑"
print("nstr:NSString", nstr)
print("nstr.length", nstr.length)
print("nstr.substring", nstr.substring(with: NSMakeRange(0,2)))
