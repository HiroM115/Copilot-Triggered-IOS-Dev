//
//  TaskListView.swift
//  CopilotIOSApp
//
//  Created with GitHub Copilot Pro
//

import SwiftUI

struct TaskListView: View {
    @State private var tasks: [TaskItem] = []
    @State private var showingAddTask = false
    @State private var newTaskTitle = ""
    @State private var newTaskDescription = ""
    @State private var newTaskPriority: TaskItem.Priority = .medium
    
    var body: some View {
        List {
            ForEach(tasks) { task in
                TaskRowView(task: task) {
                    toggleTaskCompletion(task)
                }
            }
            .onDelete(perform: deleteTasks)
        }
        .navigationTitle("Tasks")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showingAddTask = true }) {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddTask) {
            NavigationView {
                Form {
                    TextField("Title", text: $newTaskTitle)
                    TextField("Description", text: $newTaskDescription)
                    Picker("Priority", selection: $newTaskPriority) {
                        ForEach(TaskItem.Priority.allCases, id: \.self) { priority in
                            Text(priority.rawValue).tag(priority)
                        }
                    }
                }
                .navigationTitle("New Task")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            showingAddTask = false
                            resetNewTaskFields()
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            addTask()
                            showingAddTask = false
                        }
                        .disabled(newTaskTitle.isEmpty)
                    }
                }
            }
        }
    }
    
    private func addTask() {
        let task = TaskItem(
            title: newTaskTitle,
            description: newTaskDescription,
            priority: newTaskPriority
        )
        tasks.append(task)
        resetNewTaskFields()
    }
    
    private func resetNewTaskFields() {
        newTaskTitle = ""
        newTaskDescription = ""
        newTaskPriority = .medium
    }
    
    private func toggleTaskCompletion(_ task: TaskItem) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    private func deleteTasks(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

struct TaskRowView: View {
    let task: TaskItem
    let onToggle: () -> Void
    
    var body: some View {
        HStack {
            Button(action: onToggle) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .green : .gray)
            }
            
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.headline)
                    .strikethrough(task.isCompleted)
                if !task.description.isEmpty {
                    Text(task.description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            Spacer()
            
            Text(task.priority.rawValue)
                .font(.caption)
                .padding(4)
                .background(priorityColor(for: task.priority))
                .cornerRadius(4)
        }
    }
    
    private func priorityColor(for priority: TaskItem.Priority) -> Color {
        switch priority {
        case .low: return .green.opacity(0.3)
        case .medium: return .yellow.opacity(0.3)
        case .high: return .red.opacity(0.3)
        }
    }
}

#Preview {
    NavigationView {
        TaskListView()
    }
}
