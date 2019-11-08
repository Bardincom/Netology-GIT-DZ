import UIKit

//MARK: Home work 4.1

//MARK: Задача №1
///Для каждого принципа ООП и приведите 2-3 примера из жизни.
///Абстракция
///Инкапсуляция
///Наследование
///Полиморфизм

//Абстракция

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
/// Лифт - нам не важно какими механизмами он приводится в движение, сколько дверей или двигателей у него, не важно какие задачи выполняются когда мы когда мы выполням простые действия вызов лифта и выбор этажа.
protocol Actions{
  func callTheElevator()
  func chooseFloor()
}

// Мероприятие, концерт
class Event: Visitor {
  func toBuyTicket() {} // купить билет
  func presentTicket() {} // предьявить билет
  func takeYourPlace() {} // занять свое место
  func perfomingArtists() {} // выступающие артисты
  func oderOfPerfomance() {} // порядок выступления
  let seatsInTheHall = 300  // кол. мест в зале
}

/// для посетителя важно только купить билет, предьявить его на входе и занять свое место
protocol Visitor {
  func toBuyTicket()
  func presentTicket()
  func takeYourPlace()
}


//Инкапсуляция
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


//Наследование

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


/// Закрытая вечеринка - в этом примере наш подкласс наследуется от супер класса Event из примера Абстракция
class PrivateParty: Event {
  override func toBuyTicket() {
    print("Проход по спискам приглашенных, билет купить нельзя")
  }
  override func presentTicket() {
    print("Сказать фамилию Джобс")
  }
  override func takeYourPlace() {
    print("Раслибиться и налить себе что-нибудь")
  }
}


//Полиморфизм
// создадим объекты классов Письмо, Электронное письмо и Рабочее письмо
let letter = Letter()
let email = Email()
let workEmail = WorkEmail()

//теперь положим все в один общий массив

let someArrayLetters = [letter, email, workEmail] // так как в массив мы можем добавлять только однотипные данные, в этом случае мы не получаем ошибку, так как для массива считает это одним типом данных по родительскому классу Letter. Срабатывает принцип Полиморфизма - когда мы взяли объекты по какому-то общему признаку.


class Wheel { // абстрактный класс
  func pumpUpOnTheWheel () {} // некий абстрактный метовд накачать колесо
}

/// ниже выполняется принцип Полиморфизма при котором мы можем использовать, как в нашем примере, методов для выполнения внешне сходих, но технически разных задачь.
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

