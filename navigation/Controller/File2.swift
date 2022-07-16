import Foundation


enum expressionError : Error {
    case inValidExpression
}
extension StringProtocol {
    subscript(i: Int) -> Character {
            self[index(startIndex, offsetBy: i)]
    }
}

func isNumber(num: Character)-> Bool {
    if num >= "0" && num <= "9" {
        return true
    }
    return false
}

//Infix evaluation
func precedenceOp (op: Character)-> Int{
    if op == "+" || op == "-"{
        return 1
    }
    if op == "*" || op == "/"{
        return 2
    }
   
    return 0
       
}

func applyOp(a: Int, b: Int, op:Character)-> Int{
    if op == "+" {
        return a+b
    }
           
    if op == "-" {
        return a-b
    }
           
    if op == "*" {
        return a*b
    }
           
    if op == "/" {
        return a/b
    }
    return 0
}
       
       
func evaluateInfix (tokens: String) throws -> Void {
   
    var values = [Int]()
    var ops = [Character]()
    var i: Int = 0
 
    while i < (tokens.count) {
        if tokens[i] >= "A" && tokens[i] <= "Z" || tokens[i] >= "a" && tokens[i] <= "z" || tokens[i] == "{" || tokens[i] == "}" || tokens[i] == "[" || tokens[i] == "]" || tokens[i] == "." {
            throw expressionError.inValidExpression
        }
        else if tokens[i] == " " {
            i += 1
            continue
        }
        else if tokens[i] == "(" {
            ops.append(tokens[i])
        }
        else if isNumber(num: tokens[i]) {
            var num: Int = 0
            while i < tokens.count && isNumber(num: tokens[i]) {
                num = num * 10 + tokens[i].wholeNumberValue!
                i += 1
            }
            i -= 1
            values.append(num)
        }
        else if tokens[i] == ")" {
            while ops.last != "(" {
                let operators: Character = ops.removeLast()
                let val2: Int = values.removeLast()
                let val1: Int = values.removeLast()
                let opv: Int = applyOp(a: val1, b: val2, op: operators)
                values.append(opv)
            }
            ops.removeLast()
        }
        else if  tokens[i] == "+" || tokens[i] == "-" || tokens[i]  == "*" || tokens[i]  == "/" {
                while ops.count > 0 && (ops.last!) != "(" && precedenceOp(op: tokens[i]) <= precedenceOp(op: ops.last!){
                    let operators: Character = ops.removeLast()
                    let val2: Int = values.removeLast()
                    let val1: Int = values.removeLast()
                    let opv: Int = applyOp(a: val1, b: val2, op: operators)
                    values.append(opv)
                }
            ops.append(tokens[i])
        }
       
        i += 1
    }
   
    while ops.count != 0 {
        let operators: Character = ops.removeLast()
        let val2: Int = values.removeLast()
        let val1: Int = values.removeLast()
        let opv: Int = applyOp(a: val1, b: val2, op: operators)
        values.append(opv)
    }
   
    if let printInfix = values.last{
        print("Result of Infix:",printInfix)
    }
    else{
        print("Error occured! Incorrect/No expression")
    }
   

}

   
