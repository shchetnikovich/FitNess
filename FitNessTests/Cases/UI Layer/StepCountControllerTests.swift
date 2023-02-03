import XCTest
@testable import FitNess

final class StepCountControllerTests: XCTestCase {
  
  var sut: StepCountController!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = StepCountController()
  }
  
  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }
  
  func testController_whenStartTapped_appIsInProgress() {   //  Проверяем когда user тапнет на кнопку startStopPause() проверяем по State
    sut.startStopPause(nil)
    let state = AppModel.instance.appState
    XCTAssertEqual(state, AppState.inProgress)
  }
  
}
