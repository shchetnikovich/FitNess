import XCTest
@testable import FitNess


final class AppModelTests: XCTestCase {
  
  var sut: AppModel!  //  upwrapped тк нету доступа к class init
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = AppModel()
  }
  
  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }
  
  func testAppModel_whenInitialized_isInNotStartedState() {
    let initialState = sut.appState
    XCTAssertEqual(initialState, AppState.notStarted)
  }
  
  func testAppModel_whenStarted_throwsError() {
    XCTAssertThrowsError(try sut.start())
  }
  
  func testStart_withGoalSet_doesNotThrow() {
    givenGoalSet()
    
    XCTAssertNoThrow(try sut.start())
  }
  
  func testAppModel_whenStarted_isInInProgressState() {
    givenGoalSet()
    
    try? sut.start()
    let observedState = sut.appState
    XCTAssertEqual(observedState, .inProgress)  //  Проверяем state = .inProgress
  }
  
  //MARK: - Given:
  
  func givenGoalSet() {
    sut.dataModel.goal = 1000
  }
  
  func givenInProgress() {
    givenGoalSet()
    try! sut.start()
  }
  
  //MARK: - Restart
  
  func testAppModel_whenRest_isInNotStartedState() {
    //given
    givenInProgress()
    
    //when
    sut.restart()
    
    //then
    XCTAssertEqual(sut.appState, .notStarted)
    
  }
  
}
