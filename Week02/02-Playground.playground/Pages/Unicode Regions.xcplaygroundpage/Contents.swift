
// Unicode regions


print(0x1F1E6)

// REGIONAL INDICATOR SYMBOL LETTER U (U+1F1FA)
// REGIONAL INDICATOR SYMBOL LETTER S (U+1F1F8)
let regionCharUS: Character = "\u{1F1FA}\u{1F1F8}"
// regionCharUS is 🇺🇸
print(regionCharUS.unicodeScalars.count)
print(regionCharUS.unicodeScalars.map { $0.value })
print(Array(regionCharUS.unicodeScalars))
print(regionCharUS.unicodeScalars)

// 🇦🇨  AC  Ascension Island
let regionAC = "\u{1F1E6}\u{1F1E8}"

// 🇯🇲  JM  Jamaica  Emojione 1F1EF-1F1F2
let regionJM = "\u{1F1EF}\u{1F1F2}"

let regionJM2 = "\u{1F1EF}"+"\u{1F1F2}"
let jstr = String(0x1F1EF)
print("regionJM \(regionJM) regionJM2 \(regionJM2) jstr \(jstr)")

let j1 = String(Character(UnicodeScalar(0x1F1EF)!))
let m1 = String(Character(UnicodeScalar(0x1F1F2)!))
let jm1 = String(Character(UnicodeScalar(0x1F1EF)!)) + String(Character(UnicodeScalar(0x1F1F2)!))

func randomRegions(_ n: Int) -> String {
  var str = ""
  for _ in 0..<n {
    let n1 = 0x1F1E6 + Int.random(in: 0..<26)
    let n2 = 0x1F1E6 + Int.random(in: 0..<26)
    let rr = String(Character(UnicodeScalar(n1)!)) + String(Character(UnicodeScalar(n2)!))
    str += rr
  }
  return str
}
let rstr = randomRegions(10)
print("rstr", rstr)

// https://developer.apple.com/documentation/swift/string
// https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html#ID293

// https://en.wikipedia.org/wiki/Regional_indicator_symbol
// Out of the 676 possible pairs of regional indicator symbols (26 × 26), only 270 are considered valid Unicode region codes
