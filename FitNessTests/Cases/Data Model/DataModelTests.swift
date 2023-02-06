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
    XCTAssertFalse(sut.goalReached, "text_error_test here")  //  Тесты могут иметь тектовое поле для описания ошибки
  }
  
  func testModel_whenStepsReachGoal_goalIsReached() {
    //Дано
    sut.goal = 1000
    
    //Когда
    sut.steps = 1000
    
    //Тогда
    XCTAssertTrue(sut.goalReached)
  }
  
  func testGoal_whenUserCaught_cannotBeReached() {
    //given
    sut.goal = 1000
    sut.steps = 1000
    
    //when
    sut.distance = 100
    sut.nessie.distance = 100
    
    //then
    XCTAssertFalse(sut.goalReached)
  }
  
  //MARK: - Nessie
  
  func testModel_whenStarted_userIsNotCaught() {
    XCTAssertFalse(sut.caught)
  }
  
  func testModel_whenUserAheadOfNessie_isNotCaught() {
    //given
    sut.distance = 1000
    sut.nessie.distance = 100
    
    //then
    XCTAssertFalse(sut.caught)
  }
  
  func testModel_whenNessieAheadOfUser_isCaught() {
    //given
    sut.nessie.distance = 1000
    sut.distance = 100
    
    //then
    XCTAssertTrue(sut.caught)
  }
}
