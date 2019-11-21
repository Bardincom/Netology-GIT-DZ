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
  var nameTrack: String
  var artist: String
  var duration: Float
  var country: String
}

class Category {
  let nameCategory: String
  
  lazy var trackList: [Track] = []

  var numbersOfTrack: Int { // вычисляем кол. треков в категории
    trackList.count
  }
  
  var totalDuration: Float { // вычисляем общую продолжительность воспроизводимых треков
    var durations: Float = 0.0
    for item in trackList {
      durations += item.duration
    }
    
    return durations
  }

  init(nameCategory: String) {
    self.nameCategory = nameCategory
  }
  
  func addNew(track: Track) { // добавляем треки
    trackList.append(track)
  }
  func removeTrack(numder: Int) { // удаляем треки
    trackList.remove(at: numder - 1) // для того чтобы пользователь мог в привычной форме удалять треки по номеру нахождения в списке добавлю формулу: значение минус 1 будет индекс под которым находится запрашиваемый трек
  }
}

// Проверка
var categoryRock = Category(nameCategory: "Rock")
print("До добавления Треков: \(categoryRock.trackList) \n")
categoryRock.addNew(track: Track(nameTrack: "Титаник", artist: "Наутилус", duration: 5.16, country: "RU"))
categoryRock.addNew(track: Track(nameTrack: "Воздух", artist: "Наутилус", duration: 5.03, country: "RU"))
categoryRock.addNew(track: Track(nameTrack: "Тутанхамон", artist: "Наутилус", duration: 4.51, country: "RU"))
print("После добавления Треков: \(categoryRock.trackList) \n")
categoryRock.totalDuration
categoryRock.removeTrack(numder: 1)
print("После удаления Треков: \(categoryRock.trackList) \n")

//MARK: Задача №2
///Доработайте свою библиотеку так, чтобы в ней было несколько категорий
///Алгоритм выполнения
///Создайте класс библиотеки. Этот класс будет аналогичен классу категории, только хранить он должен список категорий

class Library {
  var nameLibrary: String
  lazy var categoryList: [Category] = []
  var numbersOfCategoru: Int { // вычисляем кол. категорий
    categoryList.count
  }
  
  var durationLibrary: Float { // вычисляем общyю продолжительность всей библиотеки
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
  
  func displayAllTracks() { // выводим в консоль треки разбитые по категориям
    for category in categoryList { // обходим по массиву категория
      print("\t Категрия: \(category.nameCategory), продолжительность звучания: \(category.totalDuration) мин") // выводим в консоль названия категория
      for tracks in category.trackList { // внутри категорий обходим трек листы
        print(tracks) // выводим название треков для каждой их категорий
      }
    }
    print("Общая продолжительность звучания библиотеки: \"\(nameLibrary)\"  \(durationLibrary) мин")
  }
  
  func transferTrack(from categoryOne: Category, to categoryTwo: Category, track number: Int) {
    print("Запрашиваемый трек для переноса: \(categoryOne.trackList[number - 1])")
    categoryTwo.addNew(track: categoryOne.trackList[number - 1]) // переношу запрашиваемый трек в другую категорию
    categoryOne.removeTrack(numder: number) // удаляю из первой категории перенесенный трек
  }

}


var categoryLirics = Category(nameCategory: "Lirics")
categoryLirics.addNew(track: Track(nameTrack: "Shape of My Heart", artist: "Sting", duration: 4.38, country: "GBR"))
categoryLirics.addNew(track: Track(nameTrack: "Gitan", artist: "Garou", duration: 4.07, country: "FR"))

var newLibrary = Library(name: "Моя сборка хитов")
newLibrary.addNew(category: categoryRock)
newLibrary.addNew(category: categoryLirics)
newLibrary.numbersOfCategoru
newLibrary.displayAllTracks()

//MARK: Задача 3 (*)
//Преобразуйте классы так, чтобы в пределах вашей библиотеки можно было обмениваться треками между категориями

/// Решение данной задачи реализовано в методе transferTrack - задачи №2
print("\n")
newLibrary.transferTrack(from: categoryRock, to: categoryLirics, track: 1)
newLibrary.displayAllTracks()
