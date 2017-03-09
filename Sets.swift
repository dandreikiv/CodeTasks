let a = [1, 2, 3, 4, 5, 6, 7, 0]

var maxSetCount = 0
var maxSetIndex = 0

let lenght = a.count

for setIdx in 0..<lenght {
    print("set for index \(setIdx)")

    var idx = setIdx
    var count = 0
    repeat {
        idx = a[idx]
        print("idx \(idx)")
        count = count + 1
    } while (idx != setIdx)

    print("==== count \(count) ====")

    if (count > maxSetCount) {
        maxSetCount = count
        maxSetIndex = idx
    }
    count = 0
}

print(" maxSetCount is \(maxSetCount) ")
print(" maxSetIndex is \(maxSetIndex) ")
