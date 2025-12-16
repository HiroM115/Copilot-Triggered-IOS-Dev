//
//  TaskItem.swift
//  CopilotIOSApp
//
//  Created with GitHub Copilot Pro
//

import Foundation

struct TaskItem: Identifiable, Codable {
    let id: UUID
    var title: String
    var description: String
    var isCompleted: Bool
    var createdDate: Date
    var priority: Priority
    
    enum Priority: String, Codable, CaseIterable {
        case low = "Low"
        case medium = "Medium"
        case high = "High"
        
        var color: String {
            switch self {
            case .low: return "green"
            case .medium: return "yellow"
            case .high: return "red"
            }
        }
    }
    
    init(title: String, description: String, priority: Priority = .medium) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.isCompleted = false
        self.createdDate = Date()
        self.priority = priority
    }
}
