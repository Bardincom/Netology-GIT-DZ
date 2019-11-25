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
  let name: String
  
  lazy var trackList: [Track] = []

  // вычисляем кол. треков в категории
  var numbersOfTrack: Int {
    trackList.count
  }
  
  // вычисляем общую продолжительность воспроизводимых треков
  var totalDuration: Float {
    var durations: Float = 0.0
    for item in trackList {
      durations += item.duration
    }
    
    return durations
  }

  init(name: String) {
    self.name = name
  }
  
  // добавляем треки
  func addNew(track: Track) {
    trackList.append(track)
  }
  
  // удаляем треки
  func removeTrack(number: Int) {
    guard number != 0  else {
      print("ERROR: Введенный номер отсутствует")
      return
    }
    guard (number - 1) < trackList.count else {
      print("ERROR: Введенный номер отсутствует")
      return
    }

    // для того чтобы пользователь мог в привычной форме удалять треки по номеру нахождения в списке добавлю формулу: значение минус 1, будет индекс под которым находится запрашиваемый трек
    trackList.remove(at: number - 1)
  }
}

//MARK: Проверка №1
var categoryRock = Category(name: "Rock")
print("До добавления Треков: \(categoryRock.trackList) \n")

categoryRock.addNew(track: Track(name: "Титаник",
                                 artist: "Наутилус",
                                 duration: 5.16,
                                 country: "RU"))

categoryRock.addNew(track: Track(name: "Воздух",
                                 artist: "Наутилус",
                                 duration: 5.03,
                                 country: "RU"))

categoryRock.addNew(track: Track(name: "Тутанхамон",
                                 artist: "Наутилус",
                                 duration: 4.51,
                                 country: "RU"))

print("После добавления Треков: \(categoryRock.trackList) \n")
categoryRock.totalDuration
categoryRock.removeTrack(number: 4)
print("После удаления Треков: \(categoryRock.trackList) \n")

//MARK: Задача №2
///Доработайте свою библиотеку так, чтобы в ней было несколько категорий
///Алгоритм выполнения
///Создайте класс библиотеки. Этот класс будет аналогичен классу категории, только хранить он должен список категорий

class Library {
  var nameLibrary: String
  lazy var categoryList: [Category] = []
  
  // вычисляем кол. категорий
  var numbersOfCategoru: Int {
    categoryList.count
  }
  
  // вычисляем общyю продолжительность всей библиотеки
  var durationLibrary: Float {
    var duration: Float = 0
    
    for item in categoryList {
      duration += item.totalDuration
    }
    
    return duration
  }
  
  init(name: String) {
    self.nameLibrary = name
  }
  
  func addNew(category: Category) {
    categoryList.append(category)
  }
  
  func removeCategory(number: Int) {
    categoryList.remove(at: number - 1)
  }
  
  // выводим в консоль треки разбитые по категориям
  func displayAllTracks() {
    // обходим по массиву категория
    for category in categoryList {
      print("\t Категрия: \(category.name), продолжительность звучания: \(category.totalDuration) мин") // выводим в консоль названия категория
      for tracks in category.trackList { // внутри категорий обходим трек листы
        print(tracks) // выводим название треков для каждой их категорий
      }
    }
    print("Общая продолжительность звучания библиотеки: \"\(nameLibrary)\"  \(durationLibrary) мин")
  }
  
  func transferTrack(from categoryOne: Category,
                     to categoryTwo: Category,
                     track number: Int) {
    guard number != 0 else {
      print("ERROR: Выбранный трек отсутствует")
      return
    }
    guard (number - 1) < categoryOne.trackList.count else {
      print("ERROR: Выбранный трек отсутствует")
      return
    }
    print("Запрашиваемый трек для переноса: \(categoryOne.trackList[number - 1])")
    categoryTwo.addNew(track: categoryOne.trackList[number - 1]) // переношу запрашиваемый трек в другую категорию
    categoryOne.removeTrack(number: number) // удаляю из первой категории перенесенный трек
  }

}

//MARK: Проверка №2
var categoryLirics = Category(name: "Lirics")
categoryLirics.addNew(track: Track(name: "Shape of My Heart",
                                   artist: "Sting",
                                   duration: 4.38,
                                   country: "GBR"))
categoryLirics.addNew(track: Track(name: "Gitan",
                                   artist: "Garou",
                                   duration: 4.07,
                                   country: "FR"))

var newLibrary = Library(name: "Моя сборка хитов")
newLibrary.addNew(category: categoryRock)
newLibrary.addNew(category: categoryLirics)
newLibrary.numbersOfCategoru
newLibrary.displayAllTracks()

//MARK: Задача 3 (*)
//Преобразуйте классы так, чтобы в пределах вашей библиотеки можно было обмениваться треками между категориями

/// Решение данной задачи реализовано в методе transferTrack - задачи №2
print("\n")
newLibrary.transferTrack(from: categoryRock,
                         to: categoryLirics,
                         track: 4)
newLibrary.displayAllTracks()
