import Foundation

public class AppModel {
  
  static let instance = AppModel()
  
  public var appState: AppState = .notStarted

  public init() {}
  
  let dataModel = DataModel()
  
  public func start() throws {
    guard dataModel.goal != nil else {
      throw AppError.goalNotSet
    }
    appState = .inProgress
  }
  
  func restart() {
    appState = .notStarted
  }
}
