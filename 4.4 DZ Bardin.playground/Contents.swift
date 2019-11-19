import UIKit

//MARK: Home task 4.4
//MARK: Задача №1
/*
 Вы разрабатываете библиотеку аудио треков. Вам необходимо реализовать одну из категорий музыки, наполненную треками.
 Алгоритм выполнения
 Создайте объект трек
 Определите в нем свойства имя, исполнитель, длительность и страна
 Создайте класс категория
 Объявите в нем свойства название категории, список треков и количество треков в списке (экспериментируйте с "ленивыми" и вычисляемыми свойствами)
 Определите методы добавления и удаления треков в эту категорию
 */

struct Track {
  var name: String
  var artist: String
  var duration: Float
  var country: String
}

class Category {
  let nameCategory: String
  lazy var trackList: [Track] = [] // до первого обращения не активно
  var numbersOfTrack: Int { // вычисляем кол. треков в категории
    trackList.count
  }
  
  var totalDuration: Float { // вычисляем общую продолжительность воспроизводимых треков
    var allDur: Float = 0.0
    for item in trackList {
      allDur += item.duration
    }
    return allDur
  }

  init(nameCategory: String) {
    self.nameCategory = nameCategory
  }
  
  func addNew(track: Track) { // добавляем треки
    trackList.append(track)
  }
  func removeTrack(numder: Int) { // удаляем треки
    trackList.remove(at: (numder - 1)) // для того чтобы пользователь мог в привычной форме удалять треки по номеру нахождения в списке добавлю формулу: значение минус 1 будет индекс под которым находится запрашиваемый трек
  }
}

// Проверка
var cat = Category(nameCategory: "Rock")
cat.addNew(track: Track(name: "Воздух", artist: "Наутилус", duration: 5.03, country: "RU"))
cat.addNew(track: Track(name: "Титаник", artist: "Наутилус", duration: 5.16, country: "RU"))
cat.addNew(track: Track(name: "Тутанхамон", artist: "Наутилус", duration: 4.51, country: "RU"))
cat.totalDuration
cat.removeTrack(numder: 2)
print(cat.trackList)
cat.totalDuration


