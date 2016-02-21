//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground" // compiler will infer that str is a string, don't need
                              // to type out String

var num : Int = 70

let myConstantDoubleNum = 3.1415926     // constant

// ex: defining a variable before assigning anything to it
var str2:String

str2 = str + " how are you true"

//: Arrays

var ratings = ["Zero","One","Two"]
print(ratings)
ratings[1] = "Won"
ratings


//: Boolean
let test : Bool = true

//: Tuple
let t : (Int,String) = (1,"35");
print(t.0)

var tuple : (Int,Int) = (7,99);
tuple.0 = tuple.0 + tuple.1;
tuple


//: Enumerations

enum Barcode{
    case UPCA(Int,Int,Int,Int)
    case QRCode(String)
    
}

var productBarCode = Barcode.UPCA(52,52,67,7888)
productBarCode = .QRCode("QRValue")

switch productBarCode{
    case .UPCA(let numberSystem, let manufacture, let product, let check):
        print("UPC-a) \(numberSystem),\(manufacture),\(product),\(check)")
    case .QRCode(let qrStr):
        print("\(qrStr)")
    
}


//: Recursive Enum

indirect enum ArithmeticExpression {
    case Number(Int)
    case Addition(ArithmeticExpression,ArithmeticExpression)
    case Multiplication(ArithmeticExpression,ArithmeticExpression)
}




//: Structures





//:Protocols

let eAcute : Character = "\u{E9}"

//: String index
var greeting = "Hello there"
greeting[greeting.startIndex]









































//: Allows mark up language like tutorials, then go to editor and show renderd markup
