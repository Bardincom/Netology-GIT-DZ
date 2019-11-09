import UIKit

//MARK: Home work 4.1

//MARK: Задача №1
///Для каждого принципа ООП и приведите 2-3 примера из жизни.
///Абстракция
///Инкапсуляция
///Наследование
///Полиморфизм


//MARK: Абстракция
/// Лифт - нам не важно какими механизмами он приводится в движение, сколько дверей или двигателей у него, не важно какие задачи выполняются когда мы когда мы выполням простые действия вызов лифта и выбор этажа.
protocol Actions{
  func callTheElevator()
  func chooseFloor()
}

class Elevatot: Actions{
  let door = 2 // кол. дверей
  let engine = 1 // двигатель
  func callTheElevator() {} // вызвать лифт
  func openTheDoor() {} // открыть дверь
  func chooseFloor() {} // выбрать этаж
  func clouseTheDoor() {} // закрыть дверь
  func startMoving() {} // начать движение
  func moveUp() {} // двигатсья вверх
  func moveDown() {} // двигаться вниз
  func stopMotion() {} // прекратить движение
}


// Мероприятие, концерт
//
protocol Visitor {
  func attendEvent() // посетить мероприятие
  func chooseTheRightClothes() // выбрать подходящий наряд/одежу
}

class Event: Visitor {
  func attendEvent() {}
  func chooseTheRightClothes() {}
  func perfomingArtists() {} // выступающие артисты информация
  func oderOfPerfomance() {} // порядок выступления
  let numberOfVisitors = 300  // кол. посетителей
}


//MARK: Инкапсуляция
class Woman {
  func sayName() {} // говорит как зовут
  func flirt() {} // флиртует
  func askWhich(iphone: String) {} // спрашивает какой iPhone
  private func sayHowOld() {} // не говорит сколько лет, доступно только внутри класса
}

let someWomen = Woman()
someWomen.sayName()
someWomen.flirt()
someWomen.askWhich(iphone: "Какой у тебя iPhone?")
//someWomen.sayHowOld -- недоступно так как скрыто для внешнего обращения

/// Моторное масло для автомобилей Тойота продается под тем же брендом, однако сама фирма не производит моторное масло. в данному условии мы предполагам что нам необходимо скрыть информацию о реальном производителе, а именно компании Mobil, чтобы продолжать продавать данный товар под маркой Тойота


class MotorOilToyota {
  let brand = "Toyota"
  let category = "Cars"
  let countryOforigin = "Belgium"
  let typeOil = "Sinthetic"
  private let manufacture = "Mobil" // производитель, данный параметр будет доступен только внутри этого класса
}


//MARK: Наследование
//Класс Письмо
class Letter {
  func writeLetter () {} // написать письмо
  func toSendLetter () {} // отправить письмо
}

// подкласс электронное письмо
class Email: Letter {
  func selectRecipient () {} // выбрать получателя
  func addCaption() {} // добавить подпись
}

//подкласс электронного письма рабочий e-mail
class WorkEmail: Email {
  func enterTopic() {} // выбрать тему
  override func addCaption() { // добавляем к подписи рабочие контакты, например Адрес офиса и телефон
    super.addCaption()
    print("Рабочие контакты")
  }
}


// Закрытая вечеринка - в этом примере наш подкласс наследуется от супер класса Event из примера Абстракция
class PrivateParty: Event {
  func passFaceControl () {}
  override func chooseTheRightClothes() {
    print("Вечеринка без галстуков")
  }
}


// упрощенный пример наследования:
class Parents { // класс Родители
  let surname = "Bardin" // свойство Фамилия
}

// при рождении ребенок наследует Фамилию родителей
class Child: Parents {
  let name = "Danya"
  
  func printFulName() {
    print("My name's \(surname) \(name)")
  }
  
}

let child = Child()
child.surname // мы можем обратиться к свойству Фамилия, которая была создана у родительского класса.
child.name // а так же по собственному свойству
child.printFulName() // метод который просто печает имя и фамилию ребенка, фамилия берется от родительского класса, имя из свойства собстенного класса


//MARK: Полиморфизм
// создадим объекты классов Письмо, Электронное письмо и Рабочее письмо
let letter = Letter()
let email = Email()
let workEmail = WorkEmail()

//теперь положим все в один общий массив

let someArrayLetters = [letter, email, workEmail] // так как в массив мы можем добавлять только однотипные данные, в этом случае мы не получаем ошибку, так как для массива считает это одним типом данных по родительскому классу Letter. Срабатывает принцип Полиморфизма - когда мы взяли объекты по какому-то общему признаку.


class Wheel { // абстрактный класс
  func pumpUpOnTheWheel () {} // некий абстрактный метовд накачать колесо
}

/// ниже выполняется принцип Полиморфизма при котором мы можем использовать методы для выполнения внешне схожих, но для реализации используеющих разное оборудование
class BicycleWheel: Wheel {
  override func pumpUpOnTheWheel() {
    print("Накачиваем ножным насосом")
  }
}

class CarWheel: Wheel {
  override func pumpUpOnTheWheel() {
    print("Накачиваем автомобильным насосом")
  }
}

class TractorWheel: Wheel {
  override func pumpUpOnTheWheel() {
    print("Накачиваем промышленным насосом")
  }
}


//MARK: Задача №2
///Для каждого базового понятия ООП и приведите 2-3 примера из жизни. Опишите их текстом.
///Класс
///Объект
///Свойства объектов
///Методы
///Интерфейс
///Композиция и агрегация

//MARK: Пример №1
//пример Интерфейса, которому должна соответсововать лампа
protocol Grow {
  var kelvinColourEffeciency: Int { get }
  var isWorks: Bool { get }
}

class Lamp: Grow { // класс Лампa
  let kelvinColourEffeciency = 2700 // свойство объекта цветовая температура в кельвинах
  let lampEfficiencyInPersent = 50 // свойство объекта КПД в процентах
  let hoursServiceLife = 1000 // срок службы в часах
  let isWorks = true // в рабочем состоянии
  let shape: String = "Грушевидная"
  
  func toIlluminate () {} // метод Освещать что-либо
}

let firstLamp = Lamp() // объект класса Лампa
firstLamp.toIlluminate() // в данном примере Объекту доступны все свойства и методы класса Лампа
firstLamp.shape

// пример агрегации и композиции
class Chandelier { // Люстра
  let lamp =  Lamp()
  
  func changeBrightness() {} // можем регулировать яркость освещения
}

let secondLamp = Lamp() // Лампа может существовать и без Люстры - это пример Агрегации
let chandelier = Chandelier() // Люстра работать без Лампы не сможет - это пример Композиции


//MARK: Пример №2
//Пример интерфейса - наличие лицензии на медицинскую практику
protocol MedicalLicense {
  var isLicense: Bool { get } // наличие лицензии на ведение медицинской практики
}

class Doctor: MedicalLicense{ // класс Доктор
  var isLicense = true // свойство
  func toExaminePatients () {} // метод -  проводит осмотр пациентов
  func keepMedicalHistory() {} // метод - вести историю болезни
}

// пример агрегации и композиции, для этого создам дополнительный класс Hospital

class Hospital {
  let doctor = Doctor() // в врачи работающие в Больницу
  func diagnosisOfDiseases() {} // диагностика заболевания
}

let doctorHouse = Doctor() // объект класса Doctors - наш объект может существовать вне зависмости от того есть ли у нас Больница - пример агрегации
let doctorHouseHospital = Hospital() // больница работать без докторов не сможет - пример композиции

