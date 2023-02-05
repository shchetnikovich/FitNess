import Foundation


class DataModel {
  
  var steps: Int = 0
  var goal: Int?    //  Пользователь может выбрать значение
  
  var goalReached: Bool {
    if let goal = goal,
       steps >= goal {
      return true
    }
    return false
  }
  
  
  
}
