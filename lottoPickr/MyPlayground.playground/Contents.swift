import UIKit

var str = "Hello, playground"


// five different numbers from 1 to 70 (the white balls) and one number from 1 to 25

var whiteBalls = [Int]()
var goldBalls = [Int]()
for i in 1...70{
    whiteBalls.append(i)
}
for i in 1...25{
    goldBalls.append(i)
}

func selectRandomWhiteBall(){
    for i in (0..<5).reversed(){
        let randNumb = Int.random(in: 0..<whiteBalls.count)
        let numb = whiteBalls[randNumb]
        print(numb)
        whiteBalls.remove(at: randNumb)
    }
}

func selectRandomGoldBall(){
    let randNumb = Int.random(in: 0..<goldBalls.count)
    let numb = goldBalls[randNumb]
    goldBalls.remove(at: randNumb)
}
selectRandomWhiteBall()
selectRandomGoldBall()
let width:CGFloat = 375

let padding: CGFloat = 30
let totalPadding = padding * 7
let totalLabelSpace = width - totalPadding
let labelWidth = totalLabelSpace / 6
