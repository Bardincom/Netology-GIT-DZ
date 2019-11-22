import UIKit

//MARK: 4.5 Home work
//MARK: Задача №1
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
      print("Исполнитель под именем \(nameArtist) принял решение взять себе новый псевдоним \(newValue)")
    }
    didSet {
      print("Все старые лейблы с его прежним именем \(oldValue) вскоpе будут перевыпущены под новым именем \(nameArtist)")
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
  
  init(nameArtist: String, country: String, genreOfMusic: GenderOfMusic) {
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

class RockSinger: Artist { // подкласс Рок исполнитель
  
  override func writeSong(nameSong track: Track) { // переопределяю метод Написать песню
    print("Я \(nameArtist), кумир молодежи написал хитяру \"\(track.nameTrack)\"")
  }
  
  override func performSong(nameSong track: Track) { // переопределяю метод Исполнить песню
    print("Я \(nameArtist), кумир молодежи исполнил этот хит \"\(track.nameTrack)\"")
  }
}


class PopSinger: Artist { // Подкласс Поп исполнитель
  override func writeSong(nameSong track: Track) {
     print("Я ваш покорный слуга \(nameArtist), мои дорогие поклонники и поклонницы написал для вас песню \"\(track.nameTrack)\"")
   }
   
   override func performSong(nameSong track: Track) {
     print("Я ваш покорный слуга \(nameArtist) исполнил для Вас эту песню \"\(track.nameTrack)\"")
   }
}

class ShansonSinger: Artist { // Подкласс Шансон исполнитель
  override func writeSong(nameSong track: Track) {
     print("Вечер в хату, добрые люди я \(nameArtist) настрочил \"\(track.nameTrack)\"")
   }
   
   override func performSong(nameSong track: Track) {
     print("Вечер в хату, добрые люди я \(nameArtist) спел песню \"\(track.nameTrack)\"")
   }
}


