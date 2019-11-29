//
//  Space.swift
//  StarWars
//
//  Created by Aleksey Rochev (Netology) on 19.11.2019.
//  Copyright © 2019 Aleksey Rochev (Netology). All rights reserved.
//

import Foundation

// MARK: - Models

// система координат
protocol Coordinating {
  var coordinate: Point { get set }
}

// уязвимость, содержит здоровье
protocol Vulnerable {
  var health: Int { get set }
  //  силовое поле
  var forseField: Int { get set }
}

// космические объекты протокол подписан на протоколы Координаты и Уязвимость
protocol SpaceObject: Coordinating, Vulnerable { }

// протокол только для Классов помогает определить объект в области поиска
protocol Displayable: AnyObject {
  func expose(for rect: Rect) -> [SpaceObject]
}

// протокол только для Классов - обработчик стрельбы, протокол содержит метод "огонь из оружия по координатам"
protocol ShootHandler: AnyObject {
  func fire(from weapons: Weapons, to coordinate: Point)
}

// MARK: - Space
// класс космос
class Space {
  
  // MARK: - Properties
  // содержит массив Космических объектов
  private var objects = [SpaceObject]() {
    didSet {
      // TODO: можно что-то сделать
      print("Старое значение: \(oldValue) - Новое значение \(objects)")
    }
  }
  
  // MARK: - Methods
  //    добавляем объект в массив
  func add(object: SpaceObject) {
    self.objects.append(object)
  }
  //    добавляем массив объектов в массив
  func add(objects: [SpaceObject]) {
    self.objects.append(contentsOf: objects)
  }
  //    удаляем объект с координатой
  func remove(with coordinate: Point) {
    if let index = objects.firstIndex(where: { $0.coordinate == coordinate } ) {
      print("Будет удален объект \(self.objects.remove(at: index))")
      self.objects.remove(at: index)
    }
  }
}


// MARK: - ShootHandler
// расширение класса Космос
extension Space: ShootHandler {
  
  func fire(from weapons: Weapons, to coordinate: Point) {
    guard var spaceObject = objects.first(where: { $0.coordinate == coordinate })  else {
      print("Не попал ха-ха")
      return
    }
    
    //Проверка состояния силового поля
    guard spaceObject.forseField > 0 else {
      print("Командор силовая броня пала")
      
      //Старое стостояние здоровья объекта
      print("Старое значение здоровья объекта: \(spaceObject) \(spaceObject.health)")
      spaceObject.health -= weapons.damage * 10
      
      //Текущее состояние здоровья объекта
      print("Новое значение здоровья объекта: \(spaceObject) \(spaceObject.health)")
      
      if spaceObject.health <= 0 {
        remove(with: spaceObject.coordinate)
      }
      return
    }
    
    //бъем силовое поле
    spaceObject.forseField -=  weapons.damage
//    weapons.ammunition -= 1
    
    print("Количество патронов: \(weapons.ammunition)")

  }
}

// MARK: - Displayable

extension Space: Displayable {
  
  func expose(for rect: Rect) -> [SpaceObject] {
    let filteredObjects = objects.filter { rect.contains($0.coordinate) }
    return filteredObjects
  }
}

