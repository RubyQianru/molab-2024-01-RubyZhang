import UIKit

struct Knit {
    let row = 50
    let column = 50
    let pattern: String
    let guide: [Character: Character]
    
    init(_ pattern: String, _ guide: [Character: Character]) {
        self.pattern = pattern
        self.guide = guide
    }
    
}

//first piece: starsky

//following character chart from craftdesignonline.com:
//https://craftdesignonline.com/cdo/wp-content/uploads/patterns/pg_115947_chart.html

print("Starsky")
let string1 = """

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

let guide1: [Character: Character] = [
    "A": "⬛",
    "B": "🟨",
    "C": "🟦",
    "D": "🟪",
    "E": "🩷",
    "F": "🔶",
    "G": "🍋",
    "H": "⬜"
]

let starsky = Knit(string1, guide1)

func stringToList (_ string: String, _ number: Int, _ pattern: [Character: Character]) -> [String] {
    var stringList = [String]()
    var curr = ""
    for char in string {
        if curr.count == number {
            stringList.append(curr)
            curr = ""
        }
        if let emoji = pattern[char] {
            curr += String(emoji)
        }
        
    }
    return stringList
}

let updatedStringList1 = stringToList(starsky.pattern, starsky.column, starsky.guide)

for i in 0..<updatedStringList1.count {
    print(updatedStringList1[i])
}


//second piece: penguin and heart
print("Penguin and Heart")

//following character chart from craftdesignonline.com:
//https://craftdesignonline.com/cdo/wp-content/uploads/patterns/pg_115721_chart.html

let string2 = """
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C B B B B B B C C C C C C C C C C C C C C C C C C C C C C C C B B B C C C C C C C C C C C
C C C C B B E E E E E E B B C C C C C C C C C C C C C C B B B B C C C B B A B B C C C C C C C C C C
C C C B E E E E E E E E E E B C C C C C C C C C C C C C B A A B B B B B A A A B C C C C C C C C C C
C C B E E E E E E E E E E E E B C C C C C C C C C C C C B A A A A B B A A A A B C C C C C C C C C C
C B E E F F F E E E E F F F E E B C C C C C C C C C C C B A A A A A A A A A A B C C C C C C C C C C
C B E F F F F F E E F F F F F E B C C C C C C C C C C C B A A A A A A A A A B B C C C C C C C C C C
C B E F F F F F E E F F F F F E B C C C C C C C C C C C B B A A A A A A A B B C C C C C C C C C C C
C B F F B B F F E E F F B B F F B C C C C C C C C C C C C B B B A A A A B B C C C C C C C C C C C C
C B F F B B F B B B B F B B F F B C C C C C C C C C C C C C C B B B B B B C C C C C C C C C C C C C
C B F F F F B D D D D B F F F F B C C C C C C C C C C C C C C C C C B B C C C C C C C C C C C C C C
C C B F F F F B B B B F F F F B C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C B F F F F F F F F F F B C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C B B B B B B B B B B C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C C
"""

let guide2: [Character: Character] = [
    "A": "🟥",
    "B": "⬛",
    "C": "🩵",
    "D": "🟨",
    "E": "🟦",
    "F": "⬜",
]

let heartPenguin = Knit(string2, guide2)

let updatedStringList2 = stringToList(heartPenguin.pattern, heartPenguin.column, heartPenguin.guide)
//print(updatedStringList[0].count)
for i in 0..<updatedStringList2.count {
    print(updatedStringList2[i])
}
