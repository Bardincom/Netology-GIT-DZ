//
//  WeaponsJedi.swift
//  StarWars
//
//  Created by Aleksey Rochev (Netology) on 19.11.2019.
//  Copyright © 2019 Aleksey Rochev (Netology). All rights reserved.
//

import Foundation
// Оружие джедаев Бомба и Лазерный бластер

struct Bomb: Weapons {
  var distance: Int = 1
  //  неверно указано название поменял на Bomb
  var name: String = "Bomb"
  var damage: Int = 100
  var rateOfFire: Int = 2
  var ammunition: Int = 2
}

struct LazerBlaster: Weapons {
  var distance: Int = 3
  var name: String = "Lazer Blaster"
  var damage: Int = 10
  var rateOfFire: Int = 60
  var ammunition: Int = 100
}
