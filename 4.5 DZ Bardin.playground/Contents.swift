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
  var name: String
  var artist: String = "Artist Name"
  var duration: Float
  var country: String = "Artist Country"
}

class Artist {
  enum MusicalDirection: String {
    case Pop
    case Rock
    case Shanson
  }
  //  массив песен куда добавляются все написанные песни Артиста
  var trackList: [Track] = []
  
  // добавляю наблюдателя свойст для отслеживания изменения имени артиста на псевдоним
  final var nameArtist: String {
    willSet {
      print("CNN: Исполнитель под именем \(nameArtist) принял решение взять себе новый псевдоним \(newValue)")
    }
    didSet {
      print("CNN: Все старые лейблы с его прежним именем \(oldValue) теперь выпускаются под новым именем \(nameArtist)")
    }
  }
  
  var country: String
  var genreOfMusic: MusicalDirection
  
  // артист может взять себе псевдоним, это свойство не может быть изменнено подклассном
  final var alias: String {
    get {
      return nameArtist
    }
    set {
      nameArtist = newValue
    }
  }
  
  // провожу инициализацию свойств класса
  init(nameArtist: String,
       country: String,
       genreOfMusic: MusicalDirection) {
    self.nameArtist = nameArtist
    self.country = country
    self.genreOfMusic = genreOfMusic
  }
  
  //  метод автоматизирует добавление полной информации о Треке (Дополнение)
  final func addTo(track: Track, nameArtist: String, country: String) -> Track {
    var trackInfo = track
    trackInfo.artist = nameArtist
    trackInfo.country = country
    trackList.append(trackInfo)
    return trackInfo
  }
  
  func write(track: Track) -> Track {
    print("Я \(nameArtist) написал песню \"\(track.name)\"")
    return addTo(track: track, nameArtist: nameArtist, country: country)
  }
  
  func perform(track: Track) {
    print("Я \(nameArtist) исполнил песню \"\(track.name)\"")
  }
}


// Создаю подклассы супер класса Артист
//MARK: RockSinger class

// подкласс Рок исполнитель, "final" защищено от изменений в подклассах
final class RockSinger: Artist {
  
  // уникальное свойство Инстаграмм звезда (Задание №2) извне изменить нельзя
  private var instagramStar = false
  
  // уникальное свойство Количество подписчиков (Задание №2) со встроенным наблюдателем свойств
  var numberOfSubscribers: Int {
    didSet {
      numberOfSubscribers >= 1_000_000 ? (instagramStar = true) : (instagramStar = false)
      guard numberOfSubscribers >= 1_000_000 else {
        return
      }
      print("\(nameArtist) Инстаграм звезда")
    }
  }
  
  init(nameArtist: String,
       country: String,
       genreOfMusic: MusicalDirection,
       numberOfSubscribers: Int) {
    self.numberOfSubscribers = numberOfSubscribers
    super.init(nameArtist: nameArtist,
               country: country,
               genreOfMusic: genreOfMusic)
  }
  
  // уникальный метод Разбить гитару на концерте, который добавляет подписчиков в инстаграм.
  func breakTheGuitarInConcert() {
    print("\(nameArtist) разбил очередную гитару, армия его подписчиков растет")
    numberOfSubscribers += 100000
  }
  
  // переопределяю метод Написать песню
  override func write(track: Track) -> Track {
    print("Я \(nameArtist), кумир молодежи написал хитяру \"\(track.name)\"")
    return addTo(track: track, nameArtist: nameArtist, country: country)
  }
  
  // переопределяю метод Исполнить песню
  override func perform(track: Track) {
    print("Я \(nameArtist), кумир молодежи исполнил этот хит \"\(track.name)\"")
  }
}

//MARK: PopSinger class
// Подкласс Поп исполнитель
final class PopSinger: Artist {
  // уникальнное свойство общее количество полученных цветов (Задание №2)
  var numberOfFlowers: Int = 0
  
  // уникальнное свойство исполнить песню на бис (Задание №2)
  func singAnEncore(track: Track) {
    print("Песня на бис: \"\(track.name)\"")
    numberOfFlowers += 120
  }
  
  override func write(track: Track) -> Track {
    print("Я ваш покорный слуга \(nameArtist), мои дорогие поклонники и поклонницы написал для вас песню \"\(track.name)\"")
    return addTo(track: track, nameArtist: nameArtist, country: country)
  }
  
  override func perform(track: Track) {
    print("Я ваш покорный слуга \(nameArtist) исполнил для Вас эту песню \"\(track.name)\"")
  }
}

//MARK: ShansonSinger class
// Подкласс Шансон исполнитель

final class ShansonSinger: Artist {
  // уникальное свойство имеет черный БМВ (Задание №2)
  var isBlackBMW: Bool
  
  init(nameArtist: String,
       country: String,
       genreOfMusic: MusicalDirection,
       isBlackBMW: Bool) {
    self.isBlackBMW = isBlackBMW
    super.init(nameArtist: nameArtist,
               country: country,
               genreOfMusic: genreOfMusic)
  }
  
  // уникальный метод выступупить с концертом в... (Задание №2)
  func giveConcert(inTheHall: String) {
    print("\(nameArtist) выступил с концертом в \(inTheHall)")
  }
  
  override func write(track: Track) -> Track {
    print("Вечер в хату, добрые люди я \(nameArtist) настрочил \"\(track.name)\"")
    return addTo(track: track, nameArtist: nameArtist, country: country)
  }
  
  override func perform(track: Track) {
    print("Вечер в хату, добрые люди я \(nameArtist) спел песню \"\(track.name)\"")
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
let firstRockArtist = RockSinger(nameArtist: "Freddie Mercury",
                                 country: "GBR",
                                 genreOfMusic: .Rock,
                                 numberOfSubscribers: 900_000)
firstRockArtist.alias = "Queen"

firstRockArtist.write(track: Track(name: "Bohemian Rhapsody",
                                   duration: 5.55))

firstRockArtist.trackList

firstRockArtist.perform(track: Track(name: "Bohemian Rhapsody",
                                     duration: 5.55))

firstRockArtist.breakTheGuitarInConcert()

print("\t Поп артист:")
let firstPopArtist = PopSinger(nameArtist: "Gordon Matthew Thomas Sumner",
                               country: "GBR",
                               genreOfMusic: .Pop)

firstPopArtist.alias = "Sting"
firstPopArtist.numberOfFlowers

firstPopArtist.write(track: Track(name: "Shape of My Heart",
                                  duration: 4.38))

firstPopArtist.perform(track: Track(name: "Shape of My Heart",
                                    duration: 4.38))

firstPopArtist.singAnEncore(track: Track(name: "Shape of My Heart",
                                         duration: 4.38))
firstPopArtist.numberOfFlowers

print("\t Шансон артист:")
let firstShansonArtist = ShansonSinger(nameArtist: "Трофимов, Сергей Вячеславович",
                                       country: "RU",
                                       genreOfMusic: .Shanson,
                                       isBlackBMW: true)
firstShansonArtist.alias = "Трофим"

firstShansonArtist.write(track: Track(name: "Московская Песня",
                                      duration: 3.05))

firstShansonArtist.perform(track: Track(name: "Московская Песня",
                                        duration: 3.05))

firstShansonArtist.giveConcert(inTheHall: "Дом Офицеров")


//MARK: Задание 3(*)
///Создайте пустой массив, чтобы потом добавить в него ваших артистов;
///Добавьте созданных ранее артистов в массив;
///Напишите отчет о том, что вы поняли/в чем разобрались, выполняя это задание;
///Дайте оценку своему пониманию данной темы.

print("\t Создание массива артистов:")
var compilationOfArtist: [Artist] = []
compilationOfArtist.append(firstRockArtist)
compilationOfArtist.append(firstPopArtist)
compilationOfArtist.append(firstShansonArtist)

compilationOfArtist.forEach {print($0.alias,
                                   $0.country,
                                   $0.genreOfMusic)}

/*
 При изучении данного материала более углубился в понимании одного из основных принципов ООП - Наследования.
 Научился отличать Базовый класс от Супер класса и Подкласса, разобрался с возможностью переопределия свойств и методов в Подклассах, создал в домашнем задании Супер класс и его Подклассы, переопределил методы, добавив особенности для каждого Подкласса, а так же добавил для каждого из Подклассов уникальные свойства и методы. Все подклассы защитил от возможости дальнейшего наследования от них (final). Так же защитил некторые свойства от переопределения в возможных Подклассах.
 В домашнем задании дополнительно попробовал работу Наблюдателей свойст и вычислемых свойств Getter и Setter. Если делаются изменение - в отслеживаемом свойстве, срабатывают Наблюдатели свойст - в моем случае выводится текстовая информация в консоль при уснововке нового имени-псевдониме - наблюдатель Супер класса срабатывает и при изменении данных экземпляров подклассов. Так же через наблюдателя свойств я смог переключить на True свойство Инстаграм Звезда, при достижении 1 млн. подписчиков.
 Считаю что данную тему освоил, наверняка при дальнейшей практике придет понимание новых возможностей при работе с Наследованием и Переопределением.
 */




