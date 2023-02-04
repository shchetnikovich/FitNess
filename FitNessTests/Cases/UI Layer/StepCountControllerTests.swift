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
  
  // MARK: - When
  
  private func whenStartStopPauseCalled() {
    sut.startStopPause(nil)
  }
  
  // MARK: - Initial State
  
  func testController_whenCreated_buttonLabelIsStart() {
    sut.viewDidLoad()
    
    let text = sut.startButton.title(for: .normal)
    XCTAssertEqual(text, AppState.notStarted.nextStateButtonLabel)
  }
  
  // MARK: - In Progress
  
  func testController_whenStartTapped_appIsInProgress() {   //   При нажатии на Start нужно проверить изменился ли State и UI
    whenStartStopPauseCalled()
    
    let state = AppModel.instance.appState
    XCTAssertEqual(state, AppState.inProgress)
  }
  
  func testController_whenStartTapped_buttonLabelIsPause() {
    // when
    whenStartStopPauseCalled()
    // testing behavior
    let text = sut.startButton.title(for: .normal)
    XCTAssertEqual(text, AppState.inProgress.nextStateButtonLabel)
  }
  
 
  
}
