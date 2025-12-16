//
//  TaskItemTests.swift
//  CopilotIOSAppTests
//
//  Created with GitHub Copilot Pro
//

import XCTest
@testable import CopilotIOSApp

final class TaskItemTests: XCTestCase {
    
    func testTaskItemInitialization() {
        // Given
        let title = "Test Task"
        let description = "This is a test task"
        let priority = TaskItem.Priority.high
        
        // When
        let task = TaskItem(title: title, description: description, priority: priority)
        
        // Then
        XCTAssertEqual(task.title, title)
        XCTAssertEqual(task.description, description)
        XCTAssertEqual(task.priority, priority)
        XCTAssertFalse(task.isCompleted)
        XCTAssertNotNil(task.id)
        XCTAssertNotNil(task.createdDate)
    }
    
    func testTaskItemDefaultPriority() {
        // Given
        let title = "Test Task"
        let description = "Description"
        
        // When
        let task = TaskItem(title: title, description: description)
        
        // Then
        XCTAssertEqual(task.priority, .medium)
    }
    
    func testPriorityColors() {
        // Test that each priority has the correct color
        XCTAssertEqual(TaskItem.Priority.low.color, "green")
        XCTAssertEqual(TaskItem.Priority.medium.color, "yellow")
        XCTAssertEqual(TaskItem.Priority.high.color, "red")
    }
    
    func testTaskItemCodable() throws {
        // Given
        let task = TaskItem(title: "Codable Test", description: "Test encoding/decoding", priority: .high)
        
        // When - Encode
        let encoder = JSONEncoder()
        let data = try encoder.encode(task)
        
        // Then - Decode
        let decoder = JSONDecoder()
        let decodedTask = try decoder.decode(TaskItem.self, from: data)
        
        XCTAssertEqual(task.id, decodedTask.id)
        XCTAssertEqual(task.title, decodedTask.title)
        XCTAssertEqual(task.description, decodedTask.description)
        XCTAssertEqual(task.priority, decodedTask.priority)
        XCTAssertEqual(task.isCompleted, decodedTask.isCompleted)
    }
}
