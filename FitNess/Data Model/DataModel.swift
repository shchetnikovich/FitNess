import Foundation


class DataModel {
  
  var steps: Int = 0
  var goal: Int?    //  Пользователь может выбрать значение
  
  var goalReached: Bool {
    if let goal = goal,
       steps >= goal, !caught {
      return true
    }
    return false
  }
  
  //MARK: - Nessie
  
  let nessie = Nessie()
  var distance: Double = 0
  
  var caught: Bool {
    return distance > 0 && nessie.distance >= distance
  }

}
