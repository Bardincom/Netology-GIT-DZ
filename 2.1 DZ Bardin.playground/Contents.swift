import UIKit

// MARK: Homework for Lesson 2.1.1

/// Доработка текущего проекта. Создать класс Сотрудник и инициализировать его. Добавить протокол характеризующий условия которые должны быть выполенены для того чтобы мы приняли сотрудинка на работу. Создать произвольный подкласс сотрудника.

class Employee {
    
    var name: String
    var secondName: String?
    var surname: String
    var age: UInt
    var cityOfResidece: String
    
    init(name: String, secondName: String?, surname: String, age: UInt, cityOfResidence: String) {
        self.name = name
        self.secondName = secondName
        self.surname = surname
        self.age = age
        self.cityOfResidece = cityOfResidence
    }
    
    func printEmployeeResume() -> String {
        
        var someSecondName: String
        
        if let secondName = secondName {
                   someSecondName = "Second Name: \(secondName)"
               } else {
                   someSecondName = "Second Name: The field is't filled"
               }
    
        return "Employee Profile \n Name: \(name) \n \(someSecondName) \n Surname: \(surname) \n Age: \(age) \n City of Residence: \(cityOfResidece) \n"
    }
}

let newWorker = Employee(name: "Alex", secondName: nil, surname: "Bardin", age: 31, cityOfResidence: "Kyiv")
newWorker.printEmployeeResume()



/// Краткое резюме:
/// Родился и вырос в маленьком промышленном городе Енакиево, Донецкая область, Украина.
/// Окончил ДонГТУ, г. Алчевск имеет высшее образование Инженер Металлург. Заочно получил второе высшее образование по специальности Менеджер Экономист
/// В настроящее время проживает в г. Киев, женат, есть сын.



