import UIKit

//MARK: Homework 4.3
//MARK: Задача №1
/*
 Представьте себя инженером проектировщиком телевизоров во времена, когда эпоха телевещания только набирала обороты. Вам поступила задача создать устройство для просмотра эфира в домашних условиях "Телевизор в каждую семью".
Вам нужно реализовать перечисление "Телевизионный канал" с 5-7 каналами. +
----Алгоритм выполнения----
Реализуйте класс "Телевизор". У него должны быть состояния:
фирма/модель (реализовать одним полем); +
включен/выключен; +
текущий телеканал. +
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
  let isOn: Bool
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

let fistTV = TVSet(firm: "Sony", model: "KD55", isOn: true, selectedChannal: nil)
fistTV.selectedChannel?.program
fistTV.showWhatsOnTv()
fistTV.selectedChannel = .travelChannel
fistTV.showWhatsOnTv()
fistTV.selectedChannel = .disneyChannel
fistTV.showWhatsOnTv()



