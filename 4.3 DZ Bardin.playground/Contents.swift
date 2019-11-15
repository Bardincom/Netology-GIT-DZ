import UIKit

//MARK: Homework 4.3
//MARK: Задача №1
/*
 Представьте себя инженером проектировщиком телевизоров во времена, когда эпоха телевещания только набирала обороты. Вам поступила задача создать устройство для просмотра эфира в домашних условиях "Телевизор в каждую семью".
Вам нужно реализовать перечисление "Телевизионный канал" с 5-7 каналами.
----Алгоритм выполнения----
Реализуйте класс "Телевизор". У него должны быть состояния:
фирма/модель (реализовать одним полем);
включен/выключен;
текущий телеканал.
У него должно быть поведение:
показать, что сейчас по телеку.
Вызовите метод и покажите, что сейчас по телеку.
Сделайте изменение состояний телевизора (на свой выбор).
Повторите вызов метода и покажите, что сейчас по телеку.
*/


class TVSet { //класс телефизор
  
  internal enum TVChannals: String { // создаю перечисление каналов
    case cnn = "CNN"
    case tnt = "TNT"
    case discoveryScience = "Discovery Science"
    case animalPlanet = "Animal Planet"
    case travelChannel = "Travel Channel"
    case disneyChannel = "Disney Channel"
    case xxl = "XXL"
    
    var program: String { //создаю вычисляемое свойство, используя которое мы будем видеть какая программа передач сейчас идет на выбранном канале
      switch self {
        case .cnn: return "New Day"
        case .tnt: return "Тнт. best"
        case .discoveryScience: return "How does it work"
        case .animalPlanet: return "Nature secrets"
        case .travelChannel: return "Adventure on Wheels"
        case .disneyChannel: return "Duck Tales"
        case .xxl: return "no signal"
      }
    }
  }
  
// задаю свойства телевизора
  let (firm, model): (String, String)
  var isOn: Bool
  var selectedChannel: TVChannals? //может ничего не показывать
  
//  инициализирую значения полей класса Телевизор
  init(firm: String, model: String, isOn: Bool, selectedChannal: TVChannals?) {
    self.firm = firm
    self.model = model
    self.isOn = isOn
    self.selectedChannel = selectedChannal
  }
  
//  функция показывае что сейчас на экране телевизора
  func showWhatsOnTv() {
    
    guard isOn else { print("Teлевизор выключен"); return} //проверяю включен ли телевизор, если включен идем дальше впротивном случае выходим из программы и получаем ответ о том что телевизо выклчючен.
    
    guard let _ = selectedChannel else {print("Идет поиск канала"); return } //если канал не выбран получаем сообщение и выходим из программы, использую сдесь проверку на nil
    
    print("Сейчас выбран канал \(selectedChannel!.rawValue), на экране \"\(selectedChannel!.program)\".") // я использую тут явное извлечение, т.к. выше мы прошли проверку на nil
  }
  
}

let fistTV = TVSet(firm: "Sony", model: "KD45", isOn: true, selectedChannal: nil)
print("\t \"Первое поколение телевизоров \(fistTV.firm) \(fistTV.model)\"")
fistTV.selectedChannel?.program
fistTV.showWhatsOnTv()
fistTV.selectedChannel = .travelChannel
fistTV.showWhatsOnTv()
fistTV.selectedChannel = .discoveryScience
fistTV.showWhatsOnTv()


//MARK: Задача №2
/*
 Время идет, рынок и потребители развиваются, и ваша компания набирает ритм. Поступают все новые и новые требования к эволюции устройств. Перед вами снова инженерная задача — обеспечить пользователей практичным устройством.
 ----Алгоритм выполнения----
 Реализуйте структуру настроек:
 громкость (от 0 до 1; подумайте, какой тип использовать);
 показывать цветом или черно-белым (подумайте, какой тип данных лучше всего использовать).
 Интегрируйте Настройки в класс Телевизор (используйте наследование).

 Вызовите метод и покажите, что сейчас по телеку.
 */

// реализую структуру настроек
struct Settings {
  enum VolumeRange: Double { // реализую шкалу громкости
    case zero = 0
    case one = 0.1
    case two = 0.2
    case three = 0.3
    case four = 0.4
    case five = 0.5
    case six = 0.6
    case seven = 0.7
    case eight = 0.8
    case nine = 0.9
    case ten = 1
    
    var soundInfo: String { // при выборе определенного уровня громкости будет отображаться полезная информация
      switch self {
        case .zero: return "Звук выключен"
        case .ten: return "Максимальный уровень громкости \(self.rawValue)"
        default: return "Изменен уровень громкости до \(self.rawValue)"
      }
    }
  }
  
  func changeVolume(volume: VolumeRange){ // метод выводит информацию о текущем уровне звука
    print("\(volume.soundInfo)")
  }
  
  func switchTheScreen(isColor: Bool) { // метод позволяющий переключится на чернобелый ретро режим
    guard isColor else { print("Черно-белый ретро рижим включен"); return}
    print("Вы используете цветной режим")
  }
}

class TVSetNextGen: TVSet { // новое поколение телефизора, наследник класса TVSet c интегрированными настройками
  let settings = Settings()
}

let secondTV = TVSetNextGen(firm: "Sunsung", model: "UE65", isOn: false, selectedChannal: nil)
print("\t \n \"Телевизор второго поколения \(secondTV.firm) \(secondTV.model) \"")
secondTV.isOn = true
secondTV.settings.switchTheScreen(isColor: false)
secondTV.selectedChannel = .disneyChannel
secondTV.showWhatsOnTv()
secondTV.settings.changeVolume(volume: .seven)



