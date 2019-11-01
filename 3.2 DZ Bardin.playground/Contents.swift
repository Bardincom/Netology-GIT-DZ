import UIKit

//MARK: Homework for Lesson 3.2

//MARK: Задача №1
/*
 Работа с кортежами
 Вы работаете над приложением "Информация о вас и ваших друзей". Ваша задача создать список людей с минимальной информацией о них и объединить одно из полей для создания общего значения.

 Алгоритм выполнения
 1. Создайте кортеж с тремя параметрами: ваш любимый фильм, ваше любимое число и ваше любимое блюдо. Все элементы кортежа должны быть именованы.
 2. Одним выражением запишите каждый элемент кортежа в три константы.
 3. Создайте второй кортеж, аналогичный первому по параметрам, но описывающий другого человека (с другими значениями).
 4. Обменяйте значения в кортежах между собой (с использованием дополнительного промежуточного кортежа).
 5. Создайте новый кортеж, элементами которого будут любимое число из первого кортежа, любимое число из второго кортежа и разница любимых чисел первого и второго кортежей.
 */

// Условие №1
var myFavorite = (film: "Garry Potter", number: 19, dish: "Cake Surprise") // создаю кортеж с тремя параметрами

// Условие №2
let (favoriteFilm, favoriteNumber, favoriteEda) = myFavorite // записываю одним выражением в три константы

// Условие №3
var myBelovedWife = (film: "Just go whit it", number: 17, dish: "Cesar salad") // создаю втрой кортеж с налогичными первому параметрами

// Условие №4
var intermediateTuple: (String, Int, String) // промежуточный кортеж
intermediateTuple = myFavorite // присваиваю промежуточному кортежу данные первого кортежа
myFavorite = myBelovedWife // присваиваю первому кортежу данные второго кортежа
myBelovedWife = intermediateTuple // присваивают второму кортежу данные промежуточного кортежа

print("\t Итоговый результат присвоений:")
print("myFavorite - Фильм: \(myFavorite.film), Число: \(myFavorite.number), Блюдо: \(myFavorite.dish)")
print("myBelovedWife - Фильм: \(myBelovedWife.film), Число: \(myBelovedWife.number), Блюдо: \(myBelovedWife.dish)")


// Условие №5
let spesialNumbers = (myFavorite.number, myBelovedWife.number, myFavorite.number - myBelovedWife.number)
spesialNumbers.0
spesialNumbers.1
spesialNumbers.2
