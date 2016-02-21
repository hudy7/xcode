//: Assignment 2, Nicholas Hudeck


//: 1

//:  function that take a string defined on {1, 2, 3, 4, 5, 6, 7, 8, 9} as input, return the number of digits that are odd, even and divisible by 3

func mod(digits: [String]) -> (evens: Int, odds: Int, threes: Int) {
    
    var evenCount = 0;
    var oddCount = 0;
    var divBy3Count = 0;
    
    for digit in digits{
        let dig = Int(digit)
        if dig! % 2 == 0{
            print("Digit is even")
            evenCount++
        }
        else if dig! % 2 != 0{
            print("Digit is odd")
            oddCount++
        }
        
        if dig! % 3 == 0{
            print("Digit is divisible by 3")
            divBy3Count++
        }
    }
    print("Evens: \(evenCount)  Odds: \(oddCount)  Divisible by 3: \(divBy3Count)")
    return (evenCount, oddCount, divBy3Count)
    
}

var digits = [String](arrayLiteral: "1","23","3","43","57","61","7","8","9")

mod(digits)












//: 2

//: variadic function

func cat(delimiter : String = " ", integers : [Int]) -> String {
    
    var variableString = String()
    
    for integer in integers{
        let iToS = String(integer)
        variableString += iToS + delimiter
    }
    
    return variableString
}

print(cat(";", integers: [1,3,4]))
print(cat(integers: [1,3,4]))

















//: 3


//Slow recursive method! Eventually gets fib(90)

func fibonacci(i: Int) -> Int {
    if i <= 2 {
        return 1
    } else {
        return fibonacci(i - 1) + fibonacci(i - 2)
    }
}


//Quicker implementation
func fib(i : Int) -> Int {
    if i < 2 {
        return i
    }
    var prev = 1
    var fib = 1
    for _ in 2...i {
        (prev,fib) = (fib,fib+prev)
    }
    
    return fib
    
}

fib(90)


//It eventually gets the number but takes very long, uncomment only if you need to
//fibonacci(90)












import Foundation

//: 4 Attempt with use of NSDate class, no luck
/*
struct dateOfBirth{
    let dob
}


struct Student{
    
    var sid: String
    var name: String
    var dob: dateOfBirth
    
    
    extension NSDate {
        var age:Int {
            return NSCalendar.currentCalendar().components(.Year, fromDate: self, toDate: NSDate(), options: []).year
        }
    }
    
    let myDOB = NSCalendar.currentCalendar().dateWithEra(1,year:1991, month:02,day:27,hour:0,minute:0,second:0,nanosecond: 0)!
    
    let myAge = myDOB.age
    
    func calculateAge(birthday: NSDate) -> Int {
        return NSCalendar.currentCalendar().components(.Year,fromDate: birthday,toDate: NSDate(),options: []).year
    }
   
}

extension NSDate {
    var age:Int {
        return NSCalendar.currentCalendar().components(.Year, fromDate: self, toDate: NSDate(), options: []).year
    }
}

var s = Student(sid: "sid",name: "name",dob: dateOfBirth(day: 03,month: 24,year: 1992))
calculateAge(45)
*/


//:4 Attempt for grade


struct DateOfBirth{
    var day:Int
    var month:Int
    var year:Int
    
    init(day:Int, month:Int, year:Int){
        self.day = day
        self.month = month
        self.year = year
    }
    
}

struct Student{
    var sid:String
    var name:String
    var dob: DateOfBirth
    
    func calcAge() -> Int{
        let currYear = 2016
        let currMonth = 02
        let currDay = 01
        let totalVal = ((currYear*365) + (currMonth*12) + currDay)
        
        let userYear = dob.year
        let userMonth = dob.month
        let userDay = dob.day
        let userTotalVal = ((userYear*365) + (userMonth*12) + userDay)
 
        return (totalVal - userTotalVal)/365
    }
    
}

var s = Student(sid: "4567", name: "Nick", dob: DateOfBirth(day: 02, month: 27, year: 1991))
s.calcAge()

























//: 5




class Vehicle{
    var model: String
    var doors: Int
    var color: String
    var wheels: Int
    
    init(model:String, doors:Int, color:String, wheels:Int){
        self.model = model
        self.doors = doors
        self.color = color
        self.wheels = wheels
    }
}

class MotorVehicle : Vehicle{
    var licensePlate: String
    
    init(licensePlate:String = ""){
        self.licensePlate = licensePlate
        super.init(model:"Ford", doors: 2, color: Color.White.simpleDescription(), wheels: 4)
    }
    
}

class Bicycle : Vehicle{
    
}

class Car : MotorVehicle {
    init(doors:Int = 2){}
    
    init(model: String, doors: Int, color: String, wheels: Int){}
    
    override convenience init(licensePlate:String = "TGH2567"){
        self.init(model: "Ford", doors: 2, color: Color.White.simpleDescription(), wheels: 4)
        self.licensePlate = licensePlate
    }
}


enum Color{
    case Blue, Red, White
    func simpleDescription()->String {
        switch self{
        case .Blue:
            return "Blue"
        case .Red:
            return "Red"
        case .White:
            return "White"
        }
    }
}





















































