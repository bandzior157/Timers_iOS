//
//  NewTimerViewControllerTextFieldsControllerTests.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 04/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import TimersApp

class NewTimerViewControllerTextFieldsControllerTests: XCTestCase {

    func test_titleTextField_nextReturnKeyType() {
        let titleTextField = UITextField()
        let descriptionTextField = UITextField()
        let _ = makeSUT(nil, titleTextField, descriptionTextField)
        
        XCTAssertEqual(titleTextField.returnKeyType, UIReturnKeyType.next)
    }
    
    func test_descriptionTextField_doneReturnKeyType() {
        let titleTextField = UITextField()
        let descriptionTextField = UITextField()
        let _ = makeSUT(nil, titleTextField, descriptionTextField)
        
        XCTAssertEqual(descriptionTextField.returnKeyType, UIReturnKeyType.done)
    }
    
    func test_presenter_titleChanged_getCalled_onTitleTextFieldDidEndEditing() {
        let titleTextField = UITextField()
        let descriptionTextField = UITextField()
        let presenter = MockNewTimerPresenter()
        let sut = makeSUT(presenter, titleTextField, descriptionTextField)
        
        sut.textFieldDidEndEditing(titleTextField)
        XCTAssertEqual(presenter.titleChangedCounter, 1)
        
        sut.textFieldDidEndEditing(titleTextField)
        sut.textFieldDidEndEditing(titleTextField)
        XCTAssertEqual(presenter.titleChangedCounter, 3)
    }
    
    func test_presenter_descriptionChanged_getCalled_onDescriptionTextFieldDidEndEditing() {
        let titleTextField = UITextField()
        let descriptionTextField = UITextField()
        let presenter = MockNewTimerPresenter()
        let sut = makeSUT(presenter, titleTextField, descriptionTextField)
       
        sut.textFieldDidEndEditing(descriptionTextField)
        XCTAssertEqual(presenter.descriptionChangedCounter, 1)
       
        sut.textFieldDidEndEditing(descriptionTextField)
        sut.textFieldDidEndEditing(descriptionTextField)
        XCTAssertEqual(presenter.descriptionChangedCounter, 3)
    }
    
    func test_unhandled_textField_doNotCallPresenter_onDidEndEditing() {
        let titleTextField = FakeBecomeFirstResponderTextField()
        let descriptionTextField = FakeBecomeFirstResponderTextField()
        let presenter = MockNewTimerPresenter()
        let sut = makeSUT(presenter, titleTextField, descriptionTextField)

        let unhandledTextField = UITextField()
        sut.textFieldDidEndEditing(unhandledTextField)
        
        XCTAssertEqual(presenter.titleChangedCounter, 0)
        XCTAssertEqual(presenter.descriptionChangedCounter, 0)
    }
    
    func test_titleTextField_returnKeyAction_makesDescriptionTextFieldFirstResponder() {
        let titleTextField = FakeBecomeFirstResponderTextField()
        let descriptionTextField = FakeBecomeFirstResponderTextField()
        let presenter = MockNewTimerPresenter()
        let sut = makeSUT(presenter, titleTextField, descriptionTextField)
          
        XCTAssertTrue(sut.textFieldShouldReturn(titleTextField))
        XCTAssertEqual(descriptionTextField.becomeFirstResponderCounter, 1)
    }
    
    func test_descripitionTextField_returnKeyAction_hidesKeyboard() {
        let titleTextField = FakeBecomeFirstResponderTextField()
        let descriptionTextField = FakeBecomeFirstResponderTextField()
        let presenter = MockNewTimerPresenter()
        let sut = makeSUT(presenter, titleTextField, descriptionTextField)
          
        XCTAssertFalse(sut.textFieldShouldReturn(descriptionTextField))
        XCTAssertEqual(titleTextField.becomeFirstResponderCounter, 0)
        XCTAssertEqual(descriptionTextField.becomeFirstResponderCounter, 0)
    }
    
    func test_unhandled_textField_returnKeyAction() {
        let titleTextField = FakeBecomeFirstResponderTextField()
        let descriptionTextField = FakeBecomeFirstResponderTextField()
        let presenter = MockNewTimerPresenter()
        let sut = makeSUT(presenter, titleTextField, descriptionTextField)

        let unhandledTextField = UITextField()
        XCTAssertFalse(sut.textFieldShouldReturn(unhandledTextField))
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT(_ presenter: NewTimerPresenting? = nil, _ titleTextField: UITextField, _ descriptionTextField: UITextField) -> NewTimerViewControllerTextFieldsController {
        NewTimerViewControllerTextFieldsController(presenter: presenter, titleTextField: titleTextField, descriptionTextField: descriptionTextField)
    }
    
}

fileprivate class FakeBecomeFirstResponderTextField: UITextField {
    private(set) var becomeFirstResponderCounter = 0
    
    override func becomeFirstResponder() -> Bool {
        becomeFirstResponderCounter += 1
        return true
    }
}
