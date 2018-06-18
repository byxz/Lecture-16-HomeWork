
enum ArrayError: Error {
    case arraysAreNotEqual
    case arraysIsEmpty
}


let firstNumber = [3, 4, 2, 12, 14, 78, 1]
let secondNumber = [5, 33, 1, 8, 12, 31, 3]

protocol MultiplicationValue {
    static func multiplay(first: Self, second: Self) -> Self
}

extension Int: MultiplicationValue {
    static func multiplay(first: Int, second: Int) -> Int {
        return first * second
    }
}

extension Double: MultiplicationValue {
    static func multiplay(first: Double, second: Double) -> Double {
        return first * second
    }
}


func sumArrays<T: MultiplicationValue>(first: [T], second: [T]) throws -> [T] {
    
    
    guard first.count == second.count else {
        throw ArrayError.arraysAreNotEqual
    }
    guard first.isEmpty else {
        return []
    }
    
    var multiplication = [T]()

    
    for i in 0..<first.count {
        let a = T.multiplay(first: first[i], second: second[i])
        multiplication.append(a)
    }
    
    return multiplication
}


// Создать тип "Последнее значение", которое инициализируется с массиво и сохраняет его последний элемент.
class LastValue<T> {
    
    let typeValue: T?
    
    init (_ arr: [T]) {
        
        guard !arr.isEmpty else {
            print(ArrayError.arraysIsEmpty)
            typeValue = nil
            return
        }
       
        typeValue = arr.last
    }
    
}
