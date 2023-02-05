import XCTest
@testable import FitNess

final class DataModelTests: XCTestCase {
  
  var sut: DataModel!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = DataModel()
  }
  
  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }
  
  //  MARK: - Goal
  
  func testModel_whenStarted_goalIsNotReached() {
    XCTAssertFalse(sut.goalReached, "goalReached should be false when model is created")  //  Тесты могут иметь тектовое поле для описания ошибки
  }
  
  func testModel_whenStepsReachGoal_goalIsReached() {
    //Дано
    sut.goal = 1000
    
    //Когда
    sut.steps = 1000
    
    //Тогда
    XCTAssertTrue(sut.goalReached)
  }
  
}
