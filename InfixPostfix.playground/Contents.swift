//: Playground - noun: a place where people can play

import UIKit
import Foundation



class Stack<T>{
    private var top: Int
    private var items: [T]
    var size: Int
    
    
    init(size:Int){
        top = -1
        items = [T]()
        self.size = size
    }
    
    func push(item: T) -> Bool {
        if !isFull(){
            items.append(item)
            top++
            return true
        }
        return false
    }
    
    func pop() -> T? {
        if !isEmpty() {
            top--
            return items.removeLast()
        }
        return nil
    }
    
    func peek() -> T? {
        if !isEmpty() {
            return items.last
        }
        return nil
    }
    
    func isEmpty() -> Bool {
        return top ==  -1
    }
    
    func isFull() -> Bool {
        return top == (size-1)
    }
    
    func count() -> Int {
        return (top + 1)
    }
}



class Operate {
    
    class func checkEvaluation(equation: String) -> Bool {
        
        //returns the opposing side symbol ( -> ) { -> } [ -> ]
        func getOtherSymbol(unit: Character) -> Character {
            if unit == ")"{
                return "("
            }
            else if unit == "]"{
                return "["
            }
            else {
                return "{"
            }
        }
        
        //initialization of stack to the size of the incoming infix
        let stack: Stack = Stack<Character>(size: equation.characters.count)
        
        var isNumber: Bool = false
        
        for unit in equation.characters {
            
            //switch based on the current character/unit
            switch unit {
                case "{","[","(":
                    stack.push(unit)
                    isNumber = false
                case "}","]",")":
                    if !stack.isEmpty() && (stack.peek()! == getOtherSymbol(unit)) {
                        stack.pop()!
                        isNumber = false
                    }
                    else {
                        return false
                    }
                case "+","-","*","/":
                    isNumber = false
                    continue
                
                default:
                    if isNumber == true{
                        return false
                    }
                    else {
                        isNumber = true
                    }
            }//end switch
                
        }//end for
        
        
        
     return true
    }//end checkEvaluation
    
    
    
    class func infixToPostfix(equation: String) -> String {
        var result: String = ""
        let stack: Stack = Stack<Character>(size: equation.characters.count)
        
        for char in equation.characters {
            switch char {
            case "+", "-", "*", "/":
                if char == "-" || char == "+" {
                    if stack.isEmpty() {
                        stack.push(char)
                    }
                    else {
                        switch stack.peek()! {
                        
                        case "+", "-", "/", "*":
                            while !stack.isEmpty() && (stack.peek()! == "+" || stack.peek()! == "-" || stack.peek()! == "*" || stack.peek()! == "/")  {
                                result.append(stack.pop()!)
                            }
                            stack.push(char)
                        
                        default:
                            stack.push(char)
                        }
                    }
                }
                else {
                    if stack.isEmpty() {
                        stack.push(char)
                    }
                    else {
                        switch stack.peek()! {
                        
                        case "*", "/":
                            while (stack.peek()! == "*" || stack.peek()! == "/") && !stack.isEmpty() {
                                result.append(stack.pop()!)
                            }
                            stack.push(char)
                        
                        default:
                            stack.push(char)
                        }
                    }
                }
                
            case "(", "{", "[":
                stack.push(char)
                
            case ")", "}", "]":
                while stack.peek() != "(" && stack.peek() != "{" && stack.peek() != "[" && !stack.isEmpty() {
                    result.append(stack.pop()!)
                }
                stack.pop()
                
            default:
                // its a number.
                result.append(char)
            }
        }
        
        while !stack.isEmpty() {
            if stack.peek()! == "(" || stack.peek()! == "{" || stack.peek()! == "[" {
                stack.pop()
            }
            else {
                result.append(stack.pop()!)
            }
        }
        
        return result
    }
    

}//end class Operate
        
        
        
        

    
let eval = "5 + ( ( 1 + 2 ) * 4 ) - 3"

if Operate.checkEvaluation(eval){
    let res = Operate.infixToPostfix(eval)
    print("The solution is: \(res)")
    print(res)
    
}



Operate.infixToPostfix(eval)

    
    
    
    
    
    
    
    

