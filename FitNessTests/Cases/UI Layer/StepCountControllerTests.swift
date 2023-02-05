import XCTest
@testable import FitNess

final class StepCountControllerTests: XCTestCase {
  
  var sut: StepCountController!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    let rootController = getRootViewController()
    sut = rootController.stepController
  }
  
  override func tearDownWithError() throws {
    AppModel.instance.dataModel.goal = nil
    AppModel.instance.restart()
    sut.updateUI()
    try super.tearDownWithError()
  }
  
  //MARK: - Given
  
  func givenGoalSet() {
    AppModel.instance.dataModel.goal = 1000
  }
  
  func givenInProgress() {
    givenGoalSet()
    sut.startStopPause(nil)
  }
  
  func testDataModel_whenGoalUpdate_updatesToNewGoal() {
    sut.updateGoal(newGoal: 50)
    
    XCTAssertEqual(AppModel.instance.dataModel.goal, 50)
  }
  
  // MARK: - When
  
  private func whenStartStopPauseCalled() {
    sut.startStopPause(nil)
  }
  
  // MARK: - Initial State
  
  func testController_whenCreated_buttonLabelIsStart() {
    let text = sut.startButton.title(for: .normal)
    XCTAssertEqual(text, AppState.notStarted.nextStateButtonLabel)
  }
  
  // MARK: - In Progress
  
  func testController_whenStartTapped_appIsInProgress() {   //   При нажатии на Start нужно проверить изменился ли State и UI
    givenGoalSet()
    
    whenStartStopPauseCalled()
    
    let state = AppModel.instance.appState
    XCTAssertEqual(state, AppState.inProgress)
  }
  
  func testController_whenStartTapped_buttonLabelIsPause() {
    //given
    givenGoalSet()
    //when
    whenStartStopPauseCalled()
    //testing behavior
    let text = sut.startButton.title(for: .normal)
    XCTAssertEqual(text, AppState.inProgress.nextStateButtonLabel)
  }
  
 //MARK: - Chase View
  
  func testChaseView_whenLoaded_isNotStarted() {
    //when loaded, then
    let chaseView = sut.chaseView
    XCTAssertEqual(chaseView?.state, .notStarted)
  }
  
  func testChaseView_whenInProgress_viewIsInProgress() {
    //given
    givenInProgress()
    
    //then
    let chaseView = sut.chaseView
    XCTAssertEqual(chaseView?.state, .inProgress)
  }
}
