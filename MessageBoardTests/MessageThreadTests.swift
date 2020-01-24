//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadTests: XCTestCase {
    var messageThreadController: MessageThreadController!
    
     override  func setUp() {
        messageThreadController = MessageThreadController()
    }
    
    func testCreateNewThread() {
        messageThreadController.createMessageThread(with: "Test One") {
            let messageThread = self.messageThreadController.messageThreads
            XCTAssertGreaterThan(messageThread.count, 0)
        }
    }
    
    
    
}
