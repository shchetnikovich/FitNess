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
  
  func testExample() throws {}
  
  func testPerformanceExample() throws {
    self.measure {}
  }
  
  func testAppModel_whenInitialized_isInNotStartedState() {
    let initialState = sut.appState
    XCTAssertEqual(initialState, AppState.notStarted)
  }
  
  func testAppModel_whenStarted_isInInProgressState() {
    sut.start()
    let observedState = sut.appState
    XCTAssertEqual(observedState, .inProgress)  //  Проверяем state = .inProgress
  }
}
