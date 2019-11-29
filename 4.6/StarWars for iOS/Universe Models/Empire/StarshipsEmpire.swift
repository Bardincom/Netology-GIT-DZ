//
//  StarshipsEmpire.swift
//  StarWars
//
//  Created by Aleksey Rochev (Netology) on 19.11.2019.
//  Copyright © 2019 Aleksey Rochev (Netology). All rights reserved.
//

import Foundation
// Звезда смерти корабль Империи

class DeathStar: StarshipImp {
  
  // MARK: - Constants
  
  private enum Constants {
    static let health = 1000
    static let forseField = 300
  }
  
  // MARK: - Lifecycle
  
  init(coordinate: Point) {
    super.init(name: "Death Star",
               fraction: .empare,
               coordinate: coordinate,
               weapons: [SuperLazer()])
    health = Constants.health
    forseField = Constants.forseField
  }
  
  deinit {
    print("Люк, я твой отец!")
  }
}

