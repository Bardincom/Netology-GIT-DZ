//
//  Weapons.swift
//  StarWars
//
//  Created by Aleksey Rochev (Netology) on 19.11.2019.
//  Copyright © 2019 Aleksey Rochev (Netology). All rights reserved.
//

import Foundation
// протокол Вооруженный, содержит массив Оружия
protocol Armed {
  var weapons: [Weapons] { get }
}

// протокол Стрельба, подписан на протокол Вооружен, содержит метод Огонь по координатам, может вернуть ошибку
protocol Shooting: Armed {
  func fire(to coordinate: Point) throws
}

// перечисление Ошибка оружия, подписан по протоколу Ошибки
enum WeaponsError: Error {
  case isEmpty
}

// протокол Оружие
protocol Weapons {
  var name: String { get }
  var damage: Int { get }
  // дистанция поражения
  var distance: Int { get }
  var ammunition: Int { get set }
  mutating func fire() throws
}


//расширение оружия
extension Weapons {
  mutating func fire() throws {
    guard ammunition > 0 else {
      print("\(name) Нет патронов!")
      throw WeaponsError.isEmpty
    }
    ammunition -= 1
  }
}

