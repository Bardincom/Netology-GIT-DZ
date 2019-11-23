import UIKit

//MARK: 4.5 Home work
//MARK: Задание №1
///Вы продолжаете разрабатывать библиотеку аудио треков. Сейчас будем работать над исполнителями треков.
///Алгоритм выполнения
///Создайте суперкласс артист;
///Определите в нем общие для артиста свойства (имя, страна, жанр);
///Определите общие методы (написать трек и исполнить трек);
///В реализацию метода "написать трек" добавьте вывод в консоль "Я (имя артиста) написал трек (название трека)";
///В реализацию метода "исполнить трек" добавьте вывод в консоль "Я (имя артиста) исполнил трек (название трека)";
///Создайте 3 сабкласса любых артистов и переопределите в них свойства суперкласса класса.

struct Track {
  var nameTrack: String
  var artist: String
  var duration: Float
  var country: String
}

class Artist {
  enum GenderOfMusic: String {
    case Pop
    case Rock
    case Shanson
  }
  
  final var nameArtist: String { // добавляю наблюдателя свойст для отслеживания изменения имени артиста на псевдоним
    willSet {
      print("CNN: Исполнитель под именем \(nameArtist) принял решение взять себе новый псевдоним \(newValue)")
    }
    didSet {
      print("CNN: Все старые лейблы с его прежним именем \(oldValue) вскоpе будут перевыпущены под новым именем \(nameArtist)")
    }
  }
  
  var coutnry: String
  var genreOfMusic: GenderOfMusic
  
  final var alias: String { // у артиста может взять себе псевдоним, это свойство не может быть изменнено подклассном
    get {
      return nameArtist
    }
    set {
      nameArtist = newValue
    }
  }
  
  init(nameArtist: String, country: String, genreOfMusic: GenderOfMusic) { // провожу инициализацию свойст класса
    self.nameArtist = nameArtist
    self.coutnry = country
    self.genreOfMusic = genreOfMusic
  }
  
  func writeSong(nameSong track: Track) {
    print("Я \(nameArtist) написал песню \"\(track.nameTrack)\"")
  }
  
  func performSong(nameSong track: Track) {
    print("Я \(nameArtist) исполнил песню \"\(track.nameTrack)\"")
  }
}

// Создаю подклассы супер класса Артист
//MARK: RockSinger class
final class RockSinger: Artist { // подкласс Рок исполнитель, "final" защищено от изменений в подклассах
  var instagramStar = false // уникально свойство Инстаграмм звезда (Задание №2)
   
  var numberOfSubscribers: Int { // уникальное свойсвто Количество подписчиков (Задание №2) со встроенным наблюдателем свойств
    willSet {
      print("\(nameArtist) Супер Рок-Star у него \(newValue) подписчиков")
    }
    didSet {
      numberOfSubscribers >= 1_000_000 ? (instagramStar = true) : (instagramStar = false)
    }
  }
  
  init(nameArtist: String, country: String, genreOfMusic: GenderOfMusic, numberOfSubscribers: Int) {
    self.numberOfSubscribers = numberOfSubscribers
    super.init(nameArtist: nameArtist, country: country, genreOfMusic: genreOfMusic)
  }
  
  func breakTheGuitarInConcert() { // уникальный метод Разбить гитару на концерте, который добавляем подписчиков в инстаграм.
    print("\(nameArtist) разбил очередную гитару, армия его подписчиков растет")
    numberOfSubscribers += 100000
  }
  
  override func writeSong(nameSong track: Track) { // переопределяю метод Написать песню
    print("Я \(nameArtist), кумир молодежи написал хитяру \"\(track.nameTrack)\"")
  }
  
  override func performSong(nameSong track: Track) { // переопределяю метод Исполнить песню
    print("Я \(nameArtist), кумир молодежи исполнил этот хит \"\(track.nameTrack)\"")
  }
}

//MARK: PopSinger class
final class PopSinger: Artist { // Подкласс Поп исполнитель
  var numberOfFlovers: Int = 0 // уникальнное свойство общее количество полученных цветов (Задание №2)

  func singAnEncore(repeat treck: Track) { // уникальнное свойство исполнить песню на бис (Задание №2)
    print("Песня на бис: \"\(treck.nameTrack)\"")
    numberOfFlovers += 120
  }
  
  override func writeSong(nameSong track: Track) {
     print("Я ваш покорный слуга \(nameArtist), мои дорогие поклонники и поклонницы написал для вас песню \"\(track.nameTrack)\"")
   }
   
   override func performSong(nameSong track: Track) {
     print("Я ваш покорный слуга \(nameArtist) исполнил для Вас эту песню \"\(track.nameTrack)\"")
   }
}

//MARK: ShansonSinger class
final class ShansonSinger: Artist { // Подкласс Шансон исполнитель
  var isBlackBMW: Bool // уникальное свойство имеет черный БМВ (Задание №2)
  
  init(nameArtist: String, country: String, genreOfMusic: GenderOfMusic, isBlackBMW: Bool) {
    self.isBlackBMW = isBlackBMW
    super.init(nameArtist: nameArtist, country: country, genreOfMusic: genreOfMusic)
  }
  
  func giveConsert(inTheHall: String) { // уникальный метод выступупить с концертом в... (Задание №2)
    print("\(nameArtist) выступил с концертом в \(inTheHall)")
  }
  
  override func writeSong(nameSong track: Track) {
     print("Вечер в хату, добрые люди я \(nameArtist) настрочил \"\(track.nameTrack)\"")
   }
   
   override func performSong(nameSong track: Track) {
     print("Вечер в хату, добрые люди я \(nameArtist) спел песню \"\(track.nameTrack)\"")
   }
}


//MARK: Задание №2
///Создание списка артистов.
///Алгоритм выполнения
///Доработайте существующих артистов так, чтобы они имели уникальные для каждого из них свойства и методы.
///Защитите этих артистов от редактирования в будущем.

/// Для рок исполнителя добавлено:
/// - уникально свойство Инстаграмм звезда
/// - уникальное свойсвто Количество подписчиков, со встроенным наблюдателем свойств
/// Для Поп исполнителя добавлено
/// - уникальнное свойство общее количество полученных цветов
/// - уникальнное свойство исполнить песню на бис
/// Для Шансон исполнителя
/// - уникальное свойство имеет черный БМВ
/// - уникальный метод выступупить с концертом в...

print("\t Рок артист:")
let firstRockArtist = RockSinger(nameArtist: "Freddie Mercury", country: "GBR", genreOfMusic: .Rock, numberOfSubscribers: 900_000)
firstRockArtist.alias = "Queen"
firstRockArtist.writeSong(nameSong: Track(nameTrack: "Bohemian Rhapsody", artist: firstRockArtist.nameArtist, duration: 5.55, country: firstRockArtist.coutnry))
firstRockArtist.performSong(nameSong: Track(nameTrack: "Bohemian Rhapsody", artist: firstRockArtist.nameArtist, duration: 5.55, country: firstRockArtist.coutnry))
firstRockArtist.breakTheGuitarInConcert()

print("\t Поп артист:")
let firstPopArtist = PopSinger(nameArtist: "Gordon Matthew Thomas Sumner", country: "GBR", genreOfMusic: .Pop)
firstPopArtist.alias = "Sting"
firstPopArtist.numberOfFlovers
firstPopArtist.writeSong(nameSong: Track(nameTrack: "Shape of My Heart", artist: firstPopArtist.nameArtist, duration: 4.38, country: firstPopArtist.coutnry))
firstPopArtist.performSong(nameSong: Track(nameTrack: "Shape of My Heart", artist: firstPopArtist.nameArtist, duration: 4.38, country: firstPopArtist.coutnry))
firstPopArtist.singAnEncore(repeat: Track(nameTrack: "Shape of My Heart", artist: firstPopArtist.nameArtist, duration: 4.38, country: firstPopArtist.coutnry))
firstPopArtist.numberOfFlovers

print("\t Шансон артист:")
let firstShansonArtist = ShansonSinger(nameArtist: "Трофимов, Сергей Вячеславович", country: "RU", genreOfMusic: .Shanson, isBlackBMW: true)
firstShansonArtist.alias = "Трофим"
firstShansonArtist.writeSong(nameSong: Track(nameTrack: "Московская Песня", artist: firstShansonArtist.nameArtist, duration: 3.05, country: firstShansonArtist.coutnry))
firstShansonArtist.performSong(nameSong: Track(nameTrack: "Московская Песня", artist: firstShansonArtist.nameArtist, duration: 3.05, country: firstShansonArtist.coutnry))
firstShansonArtist.giveConsert(inTheHall: "Дом Офицеров")


