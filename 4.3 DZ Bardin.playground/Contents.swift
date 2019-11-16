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

// Проверка первого телевизора
let fistTV = TVSet(firm: "Sony", model: "KD45", isOn: false, selectedChannal: nil)
print("\t \"Первое поколение телевизоров \(fistTV.firm) \(fistTV.model)\"")
fistTV.isOn = true
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
  
  func switchTheScreen(isColor: Bool) { // метод позволяющий переключится на чернобелый или цветной режим
    guard isColor else { print("Черно-белый ретро рижим включен"); return}
    print("Цветной режим включен")
  }
}

// новое поколение телевизора, наследник класса TVSet c интегрированными настройками
class TVSetNextGen: TVSet {
  private let settings = Settings() // интегрирую настройки, и закрываю для вызова извне - будет доступно только в текущем классе
  
  func useSoundSettings(range: Settings.VolumeRange) { // метод для изменнения громкости
    guard isOn else { print("Teлевизор выключен"); return}
    settings.changeVolume(volume: range)
  }
  
  func useColorSettings(isColor: Bool) { // метод для изменнения цвета
    guard isOn else { print("Teлевизор выключен"); return}
    settings.switchTheScreen(isColor: isColor)
  }
}

// Проверка второго телевизора
let secondTV = TVSetNextGen(firm: "Sunsung", model: "UE65", isOn: false, selectedChannal: nil)
print("\t \"Телевизор второго поколения \(secondTV.firm) \(secondTV.model) \"")
secondTV.isOn = true
secondTV.useColorSettings(isColor: true)
secondTV.showWhatsOnTv()
secondTV.useSoundSettings(range: .nine)
secondTV.selectedChannel = .disneyChannel
secondTV.showWhatsOnTv()


//MARK: Задача №3
/*
 Порог новой эры пройден. Теперь не только есть радио волна, но и видео магнитофоны. Эту технику подключают проводами к телевизору и смотрят в записи свои любимые фильмы. Вам, как ведущему инженеру, срочно нужно адаптировать продукт вашей компании, потому как спрос на устаревший вариант резко пошел вниз.
 Алгоритм выполнения
 Создайте перечисление со связанными значениями с двумя кейсами:
 телеканал;
 подключение по входящему видео порту.
 Интегрируйте эту опцию в Телевизор (используйте наследование).
 Вызовите метод и покажите, что сейчас по телеку.
 */

enum Videotapes: String { //видео касеты (дополнение к заданию)
  case carton
  case anime
  case action
  case comedy
  case horror
  
  var inside: String {
    switch self {
      case .carton: return "Cold Heart 2"
      case .anime: return "Weathering with You"
      case .action: return "The Terminator"
      case .comedy: return "Alone at home"
      case .horror: return "The Shining"
    }
  }
}

// Новый класс телевизора с возможностью подключения видеомагнитофона или выбора каналов передач
class TVNeo: TVSetNextGen {
  enum TypeOfConnection {
    case tvChannals (TVChannals?)
    case tvBox (Videotapes?)
    
    var tv: String {
      switch self {
        case .tvChannals(let .some(value)): return "Сейчас включен канал \(value.rawValue) \"\(value.program)\""
        case .tvBox(let .some(value)): return "Сейчас включен видеомагнитофон с фильмом категории \(value.rawValue) \"\(value.inside)\""
        case .tvChannals(.none): return "Канал не выбран"
        case .tvBox(.none): return "Вставьте касету"
      }
    }
    
  }
  
  var isOnTVBox: TypeOfConnection? // может быть еще не подкючено
  
  init(firm: String, model: String, isOn: Bool, isOnTVBox: TypeOfConnection?) { // убрал из инициализации отдельный выбор канала
    self.isOnTVBox = isOnTVBox
    super.init(firm: firm, model: model, isOn: isOn, selectedChannal: nil)
  }
  
  override func showWhatsOnTv() {
    guard isOn else { print("Teлевизор выключен"); return}
    guard let _ = isOnTVBox else {print("Необходимо выбрать канал или подключить видеомагнитофон"); return}
    print("\(isOnTVBox!.tv)")
  }
}

// Проверка третьего телевизора
let thirdTV = TVNeo(firm: "LG", model: "NG75", isOn: false, isOnTVBox: nil)
print("\t \"Телевизор третьего поколения \(thirdTV.firm) \(thirdTV.model)\"")
thirdTV.isOn = true
thirdTV.showWhatsOnTv()
thirdTV.isOnTVBox = .tvChannals(.animalPlanet)
thirdTV.showWhatsOnTv()
thirdTV.isOnTVBox = nil
thirdTV.showWhatsOnTv()
thirdTV.isOnTVBox = .tvBox(nil)
thirdTV.showWhatsOnTv()
thirdTV.isOnTVBox = .tvBox(.action)
thirdTV.showWhatsOnTv()





