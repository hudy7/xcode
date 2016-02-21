//: Playground - noun: a place where people can play

import UIKit



func isPerfectNumber(num: Int) -> Bool{
    var sum = 0
    
    for (var i = 1; i <= num; i++){
        if(num%i == 0){
            sum += i
        }
    }
    
    //print(sum)
    
    if(sum/2 == num){
        return true
    }
    else{
        return false
    }
    
}

isPerfectNumber(812)








