import UIKit

let row = 50
let column = 50

var string = """

C C C C C C C C C H C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C H
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C H C C C C C C C D C C C C C C C C C C C C C C C C C C C C C C C C H C C C C C C C C H C C C C C C
A A A A A A A A A A A A A A D D D D H C C C C C C C C C C C C C C C C C C C C C C C C C C C C H C C
A A A A A A A A A A A A A A A D D D D D D D D C C C C H C C C C C C C C C C C C C C C C C C C C C C
A A A A A A A A A A A A A A A D D D D D D D D D D D D D D C C C C C D D C C C C C C C C C C C C C C
A A A A A A A A A A A A A A A D D D D D D D D D D D D D D D D D D D D D D C C C C C C C C C C C C C
A A B B B A B B B A B B B A A D D D D D D H D D D D D D D D D D D D D D D D H C C C C C C C C C C C
A A B B B A B B B A B B B A A D D D D D D D D D D D D D D D D D D D D D D D D D D D D D D D C C C C
H H H B B A B B B A B B B A A D D D D D D D D D D D D D D D D D D A A A A A A A A A A A A A D H D D
H H H H H A B B B A B B B A A E E D D D D D D D D D D H D D D D D A A A A A A A H H H H A A D D D D
H H H H H H H A A A A A A A A E E E E E D D D D D D D D D D D D D A B B B H H H H H H H B A D D D D
H H H H H H H H H H A A A A A E E E E E E E E E E E E E E E D D D A B H H H H H H H H H H A D D D D
H H H H H H H H H H H H H A A E E E E H H H E E E E E E H H H H H H H H H H H H H H H H H H D E E E
H H H H H H H H H H H H H H H H E E H H H H H H E E E E H H H H H H H H H H H H H H H H H H H E E E
A H H H H H H H H H H H H H H F F H H H H H H H H H H E E E H H H H H H H H H H H H H H H H H E E E
A A B B B A B B B A B B B A A H H H H H H H H H H H H H H E E E E A H H H H H H H H H H H H H H E E
A A B B B A B B B A B B B A A H H H H H H H H H H H H H H H E E E A B B B H H H H H H H H H H H H F
A A A A A A A A A A A A A A A H H H F F F F F F H H F F F F E E E A B B B A B B H H H H H H H H H F
A A A A A A A A A A A A A A A F F F F F F F F F F F F F F F F F F A B B B A B B B A B B B A F F F F
A A A A A A A A A A A A A A A F F F F F F F F A F F F F F F F F F A B B B A B B B A B B B A F F F F
A A B B B A B B B A B B B A A F F F F F F F A A A F F F F F F F F A A A A A A A A A A A A A F F F F
A A B B B A B B B A B B B A A F F F F F F A A A A A F F F F F F F A A A A A A A A A A A A A F F F G
A A B B B A B B B A B B B A A F G G G G A A B B B A A F F F F F F A B B B A B B B A B B B A F F F G
A A B B B A B B B A B B B A A G G G G A A A B B B A A A F F F F F A B B B A B B B A B B B A F F G G
A A A A A A A A A A A A A A A G G G A A A A B B B A A A A G G G G A B B B A B B B A B B B A F G G G
A A A A A A A A A A A A A A A G G G A A A A B B B A A A A G G G G A B B B A B B B A B B B A F G G G
A A A A A A A A A A A A A A A G G G A A A A A A A A A A G G G G G A A A A A A A A A A A A A G G G G
A A B B B A B B B A B B B A A G G G A B B B A A A B B B A H H H G A A A A A A A A A A A A A G G G G
A A B B B A B B B A B B B A A G G G A B B B A A A B B B A H H H H A B B B A B B B A B B B A G G G G
A A B B B A B B B A B B B A A G G H A B B B A A A B B B A H H H H A B B B A B B B A B B B A G G G G
A A B B B A B B B A B B B A A G G H A B B B A A A B B B A H H H H A B B B A B B B A B B B A H G G G
A A A A A A A A A A A A A A A G H H A A A A A A A A A A A H H H H A B B B A B B B A B B B A H H G G
A A A A A A A A A A A A A A A G H H A A A A B B B A A A A H H H H A A A A A A A A A A A A A H H H G
A A A A A A A A A A A A A A A H H H A A A A B B B A A A A H H H H A A A A A A A A A A A A A H H H H
A A B B B A B B B A B B B A A H H H A A A A B B B A A A A H H H H A B B B A B B B A B B B A H H H H
A A B B B A B B B A B B B A A H H H A A A A B B B A A A A H H H H A B B B A B B B A B B B A H H H H
A A B B B A B B B A B B B A A H H H A A A A A A A A A A A H H H H A B B B A B B B A B B B A H H H H
A A B B B A B B B A B B B A A H H H A B B B A A A B B B A H H H H A B B B A B B B A B B B A H H H H
A A A A A A A A A A A A A A A H H H A B B B A A A B B B A H H H H A A A A A A A A A A A A A H H H H
A A A A A A A A A A A A A A A H H H A B B B A A A B B B A H H H H A A A A A A A A A A A A A H H H H
A A A A A A A A A A A A A A A H H H A B B B A A A B B B A H H H H A B B B A B B B A B B B A H H H H
A A B B B A B B B A B B B A A H H H A A A A A A A A A A A H H H H A B B B A B B B A B B B A H H H H
A A B B B A B B B A B B B A A H H H A A A A B B B A A A A H H H H A B B B A B B B A B B B A H H H H
A A B B B A B B B A B B B A A H H H A A A A B B B A A A A H H H H A B B B A B B B A B B B A H H H H
A A B B B A B B B A B B B A A H H H A A A A B B B A A A A H H H H A A A A A A A A A A A A A H H H H
A A A A A A A A A A A A A A A H H H A A A A B B B A A A A H H H H A A A A A A A A A A A A A H H H H
A A A A A A A A A A A A A A A H H H A A A A A A A A A A A H H H H A B B B A B B B A B B B A H H H H
A A A A A A A A A A A A A A A H H H A B B B A A A B B B A H H H H A B B B A B B B A B B B A H H H H
A A B B B A B B B A B B B A A H H H A B B B A A A B B B A H H H H A B B B A B B B A B B B A H H H H

"""

let guide: [Character: Character] = [
    "A": "⬛",
    "B": "🟨",
    "C": "🟦",
    "D": "🟪",
    "E": "🩷",
    "F": "🔶",
    "G": "🍋",
    "H": "⬜"
]


func stringToList (_ string: String, _ number: Int) -> [String] {
    var stringList = [String]()
    var curr = ""
    for char in string {
        if curr.count == number {
            stringList.append(curr)
            curr = ""
        }
        if let emoji = guide[char] {
            curr += String(emoji)
        }
        
    }
    return stringList
}

let updatedStringList = stringToList(string, column)
//print(updatedStringList[0].count)
for i in 0..<updatedStringList.count {
    print(updatedStringList[i])
}


