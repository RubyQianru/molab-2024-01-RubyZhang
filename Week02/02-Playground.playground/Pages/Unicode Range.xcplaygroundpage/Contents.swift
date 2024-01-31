
// Explore jstr character range

import Foundation

var str = ""
let n = 79 // 79 100
for uni in 0...n {
  let codepoint = 0x1f600 + uni
  let codepointString = String(format: "0x%02X", codepoint)
  let emoji = String(Character(UnicodeScalar(codepoint)!))
  print("\(uni) \(codepointString) \(emoji)")
  str += emoji
}
print(str)

// What's first emoji?
// TRY: write a func to display a range of emoji

// evolve from 6-bit (TTY), 8-bit (ascii), 32-bit UNICODE

// https://en.wikipedia.org/wiki/Emoji#Unicode_blocks

// What happed to 0x1F650?

// 😀😁😂😃😄😅😆😇😈😉😊

