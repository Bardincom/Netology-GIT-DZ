import UIKit

// MARK: Homework for Lesson 2.1.1

/// Доработка текущего проекта. Создать класс Сотрудник и инициализировать его. Добавить протокол характеризующий условия которые должны быть выполенены для того чтобы мы приняли сотрудинка на работу. Создать произвольный подкласс сотрудника.

class Employee {
    
    let name: String
    let secondName: String?
    let surname: String
    let age: UInt
    let cityOfResidece: String
    
    init(name: String, secondName: String?, surname: String, age: UInt, cityOfResidence: String) {
        self.name = name
        self.secondName = secondName
        self.surname = surname
        self.age = age
        self.cityOfResidece = cityOfResidence
    }
    
    func printEmployeeResume() -> String {
        
        let checkSecondName = (secondName != nil) ? "Second Name: \(secondName!)" : "Second Name: The field is't filled"

        return "Employee Profile \n Name: \(name) \n \(checkSecondName) \n Surname: \(surname) \n Age: \(age) \n City of Residence: \(cityOfResidece) \n"
    }
}



class Developer: Employee {
    
    let workExperience: Int
    
    init(name: String, secondName: String?, surname: String, age: UInt, cityOfResidence: String, workExperience: Int) {
        self.workExperience = workExperience
        super.init(name: name, secondName: secondName, surname: surname, age: age, cityOfResidence: cityOfResidence)
    }
}



/// Краткое резюме:
/// Родился и вырос в маленьком промышленном городе Енакиево, Донецкая область, Украина.
/// Окончил ДонГТУ, г. Алчевск имеет высшее образование Инженер Металлург. Заочно получил второе высшее образование по специальности Менеджер Экономист
/// В настроящее время проживает в г. Киев, женат, есть сын.



