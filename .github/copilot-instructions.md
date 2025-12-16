# GitHub Copilot Custom Instructions

## Project Overview
This is an iOS development project repository. GitHub Copilot should assist with iOS-specific development tasks following Apple's best practices and Swift/Objective-C conventions.

## Code Style and Conventions
- Use Swift as the primary programming language for new code
- Follow Swift API Design Guidelines
- Use descriptive variable and function names that clearly convey intent
- Prefer Swift's modern concurrency features (async/await) over completion handlers when possible
- Use proper access control modifiers (private, fileprivate, internal, public, open)
- Follow the SwiftLint rules if configured in the project

## iOS Development Best Practices
- Use UIKit or SwiftUI based on project requirements
- Follow MVC, MVVM, or other architectural patterns consistently
- Implement proper memory management and avoid retain cycles
- Use Auto Layout or SwiftUI layout system for UI components
- Handle different device sizes and orientations appropriately
- Implement proper error handling using Swift's Result type or do-catch blocks

## Testing
- Write unit tests for business logic using XCTest framework
- Write UI tests for critical user flows
- Aim for meaningful test coverage, focusing on critical paths
- Use descriptive test method names that explain what is being tested

## Security and Privacy
- Never commit sensitive data like API keys, tokens, or passwords
- Use Keychain for storing sensitive information
- Request appropriate permissions before accessing user data
- Follow App Transport Security (ATS) requirements
- Implement proper authentication and authorization

## Documentation
- Add documentation comments for public APIs using Swift's markup format
- Include examples in documentation where helpful
- Keep README.md updated with setup instructions and project information
- Document any non-obvious implementation decisions

## Dependencies
- Use Swift Package Manager (SPM) as the preferred dependency manager
- CocoaPods or Carthage may be used if already present in the project
- Keep dependencies up to date and review for security vulnerabilities
- Minimize external dependencies when possible

## Git and Version Control
- Write clear, descriptive commit messages
- Keep commits focused and atomic
- Follow the project's branching strategy
- Review changes before committing

## Performance
- Be mindful of performance, especially in scrolling views
- Avoid blocking the main thread with heavy operations
- Use proper background threading for network requests and data processing
- Profile and optimize code when performance issues are identified

## Accessibility
- Support VoiceOver and other assistive technologies
- Use proper accessibility labels and hints
- Ensure appropriate color contrast and text sizing
- Test with accessibility features enabled
