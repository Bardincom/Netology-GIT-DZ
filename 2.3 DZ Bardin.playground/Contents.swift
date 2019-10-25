import UIKit

// MARK: Homework for Lesson 2.3

//MARK: Задача 1
//Вам необходимо написать программу для оценки графиков, характеризующих движение валюты в течение дня.
//У вас есть 3 числа A, B, C и формула D=B * B - 4AC, где D — возможное движение графика.
//Если D > 0, график скорее всего продолжит направление;
//Если D < 0, график скорее всего поменяет направление;
//Если D = 0, неопределенная ситуация — нужно ждать.
//Выведите в консоль строку, указывающую движение графика, в зависимости от полученного D.
//Решите задачу тремя способами, используя if-else, тернарный оператор и switch.

var a = -15
var b = 7
var c = -5

var d = b * b - 4 * a * c

// используем конструкцию if-else
if d > 0 {
  print("график скорее всего продолжит направление")
} else if d < 0 {
  print("график скорее всего поменяет направление")
} else {
  print("неопределенная ситуация — нужно ждать")
}

// используем тернарный оператор
d > 0 ? print("график скорее всего продолжит направление") :
  d < 0 ? print("график скорее всего поменяет направление") : print("неопределенная ситуация — нужно ждать")


// используя switch
switch d {
  case ..<0:
  print("график скорее всего поменяет направление")
  case 1...:
  print("график скорее всего продолжит направление")
  default:
  print("неопределенная ситуация — нужно ждать")
}

//используя switch и where
switch d {
  case let k where k < 0:
  print("график скорее всего поменяет направление")
  case let k where k > 0:
  print("график скорее всего продолжит направление")
  default:
  print("неопределенная ситуация — нужно ждать")
}

// MARK: Задание 2(*)
//Вы работаете над приложением, которое предоставляет видеоконтент для пользователей. Вам нужно реализовать фильтр материалов по 2 характеристикам: пол и возраст.

///Категории по возрасту:
///возраст детей от 3 до 17 лет;
///взрослых людей от 18 до 65 лет включительно;
///пожилых людей от 66 лет и без верхнего ограничения.

///Используя условные конструкции, напишите программу, которая в зависимости от значений, придуманных вами пола и возраста, напечатает в консоль одну из следующих строк:

///"Детский контент для девочек"
///"Детский контент для мальчиков"
///"Взрослый контент для мужчин"
///"Взрослый контент для женщин"
///"Контент для женщин пожилого возраста"
///"Контент для мужчин пожилого возраста"

///Во всех, неподходящих под описание случаях, напечатайте в консоль:
///"Нет подходящего контента"

// использую для данных значений Константы, если в процессе написания программы мне понадобиться менять эти значения Xcode предложит мне поменять let на var.
let age = 31
let isMale = true // where true is male false is female

switch isMale {
  case true:
    if age >= 3 && age <= 17 {
      print("Детский контент для мальчиков")
    } else if age >= 18 && age <= 65 {
      print("Взрослый контент для мужчин")
    } else if age > 65 {
      print("Контент для мужчин пожилого возраста")
    } else {
      print("Нет подходящего контента")
  }
  case false:
    age >= 3 && age <= 17 ? print("Детский контент для девочек") :
      age >= 18 && age <= 65 ? print("Взрослый контент для женщин") :
        age > 65 ? print("Контент для женщин пожилого возраста") : print("Нет подходящего контента")
}

/// в данном примере использовал все виды изученых условных инструкций. Инструкцией switch рассматриваю 2 возможных кейса Истина или Ложь относительно пола человека - так как больше вариантов быть не может, дефолтный кейс не используется.
/// В первом кейса если у нас true, т.е. мужской пол - использую инструкцию if-else, и перебираю все условия которые приведены в задаче.
/// Во втором кейсе если у нас false, т.е. женский пол - использую тернарный условный оператор, и проверяю все значения возраста.
/// Тернарный условный оператор занимает меньше строк кода, однако может выглядеть несколько сложновато для быстрого понимая, инструкция if-else в данном случае более нагляда и ее легче прочесть.


