
enum ArrayError: Error {
    case arraysAreNotEqual
}


let firstNumber = [3, 4, 2, 12, 14, 78, 1]
let secondNumber = [5, 33, 1, 8, 12, 31, 3]


protocol Container {
    associatedtype Element
    var count: Int { get }
    mutating func append(_ element: Element)
    subscript(index: Int) -> Element { get set }
}

extension Array: Container {
}


if firstNumber.count == secondNumber.count {
    let multiplication = zip(firstNumber, secondNumber).map { $0 * $1 }
    print(multiplication)
}

func multiplication<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) throws -> [Int]? where C1.Element == C2.Element, C1.Element: Equatable {
    
    // Проверяем одинаковое ли количество элементов находится в контейнерах.
    if someContainer.count != anotherContainer.count {
        throw ArrayError.arraysAreNotEqual
    }
    
    var first = [0]
    var second = [0]
    
    var multiplication = [0]
    
    
    // Объединяем массивы
    for i in 0...someContainer.count {
        first.append(someContainer[i] as! Int)
        second.append(anotherContainer[i] as! Int)
        
        multiplication.append(first[i]*second[i])
    }
    return multiplication
}

print("==========")
print(try multiplication(firstNumber, secondNumber)!)
print("==========")
