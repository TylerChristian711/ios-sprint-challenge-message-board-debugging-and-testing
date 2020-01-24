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
    
    func testCreateMessage() {
        messageThreadController.createMessageThread(with: "Test One") {
            let messageThreads = self.messageThreadController.messageThreads
            
            guard let messageThread = messageThreads.first else { return }
            
            self.messageThreadController.createMessage(in: messageThread, withText: "Title Test", sender: "Tyler") {
                let message = messageThread.messages
                XCTAssertGreaterThan(message.count, 0)
            }
        }
    }
    
    func testFetchMessage() {
        messageThreadController.createMessageThread(with: "Test one") {
            let messageThreads = self.messageThreadController.messageThreads
            
            guard let messageThread = messageThreads.first else { return }
            
            self.messageThreadController.createMessage(in: messageThread, withText: "Title test", sender: "Tyler") {
                let message = messageThread.messages
                XCTAssertGreaterThan(message.count, 0)
            }
        }
        
        messageThreadController.fetchMessageThreads {
            let messageThreads = self.messageThreadController.messageThreads
            XCTAssertGreaterThan(messageThreads.count, 0)
        }
    }
    
}
