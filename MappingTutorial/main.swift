
enum ArrayError: Error {
    case arraysAreNotEqual
    case arraysIsEmpty
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

/////////////////////////////
//Вариант 1
if firstNumber.count == secondNumber.count {
    let multiplication = zip(firstNumber, secondNumber).map { $0 * $1 }
    print(multiplication)
}


////////////////////////////
//Вариант 2
func multiplication<C: Container>(_ someContainer: [C], _ anotherContainer: [C]) throws -> [C] {
    
    // Проверяем одинаковое ли количество элементов находится в контейнерах.
    guard someContainer.count == anotherContainer.count else {
        throw ArrayError.arraysAreNotEqual
    }
    guard !someContainer.isEmpty else {
        throw ArrayError.arraysIsEmpty
    }
    
    var first: [C] = []
    var second: [C] = []
    
    var multiplication: [C] = zip(first, second).map { $0 * $1 }
    
    
    // Объединяем массивы
    for i in 0...someContainer.count {
        first.append(someContainer[i])
        second.append(anotherContainer[i])
        
    }
    return multiplication
}

print("==========")
print()
print("==========")
