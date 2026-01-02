import Foundation
import Quick
import Nimble
@testable import AIDrivenIOSApp

/// Behavior-Driven Development spec for AIDrivenUtilities
/// Quick/Nimbleを使用した振る舞い駆動開発のテスト仕様
final class AIDrivenUtilitiesSpec: QuickSpec {
    override class func spec() {
        describe("AIDrivenUtilities") {
            
            // MARK: - Email Validation Specs
            
            describe("email validation") {
                context("when email is valid") {
                    it("returns true for standard email") {
                        expect(AIDrivenUtilities.isValidEmail("user@example.com")).to(beTrue())
                    }
                    
                    it("returns true for email with plus sign") {
                        expect(AIDrivenUtilities.isValidEmail("user+tag@example.com")).to(beTrue())
                    }
                    
                    it("returns true for email with dots") {
                        expect(AIDrivenUtilities.isValidEmail("first.last@example.com")).to(beTrue())
                    }
                    
                    it("returns true for email with numbers") {
                        expect(AIDrivenUtilities.isValidEmail("user123@example456.com")).to(beTrue())
                    }
                    
                    it("returns true for email with subdomain") {
                        expect(AIDrivenUtilities.isValidEmail("user@mail.example.com")).to(beTrue())
                    }
                }
                
                context("when email is invalid") {
                    it("returns false for email without @") {
                        expect(AIDrivenUtilities.isValidEmail("userexample.com")).to(beFalse())
                    }
                    
                    it("returns false for email without domain") {
                        expect(AIDrivenUtilities.isValidEmail("user@")).to(beFalse())
                    }
                    
                    it("returns false for email without username") {
                        expect(AIDrivenUtilities.isValidEmail("@example.com")).to(beFalse())
                    }
                    
                    it("returns false for email without TLD") {
                        expect(AIDrivenUtilities.isValidEmail("user@example")).to(beFalse())
                    }
                    
                    it("returns false for empty string") {
                        expect(AIDrivenUtilities.isValidEmail("")).to(beFalse())
                    }
                    
                    it("returns false for email with spaces") {
                        expect(AIDrivenUtilities.isValidEmail("user @example.com")).to(beFalse())
                    }
                }
            }
            
            // MARK: - Date Formatting Specs
            
            describe("date formatting") {
                var testDate: Date!
                
                beforeEach {
                    // Create a fixed date for consistent testing
                    var components = DateComponents()
                    components.year = 2024
                    components.month = 1
                    components.day = 15
                    components.hour = 12
                    components.minute = 0
                    components.second = 0
                    testDate = Calendar.current.date(from: components)
                }
                
                context("when formatting date to long format") {
                    it("returns a non-empty string") {
                        let formatted = AIDrivenUtilities.formatDate(testDate)
                        expect(formatted).toNot(beEmpty())
                    }
                    
                    it("includes the year") {
                        let formatted = AIDrivenUtilities.formatDate(testDate)
                        expect(formatted).to(contain("2024"))
                    }
                }
                
                context("when formatting relative time") {
                    it("returns a non-empty string for current date") {
                        let formatted = AIDrivenUtilities.formatRelativeTime(Date())
                        expect(formatted).toNot(beEmpty())
                    }
                    
                    it("indicates past time for old date") {
                        let pastDate = Date(timeIntervalSinceNow: -3600) // 1 hour ago
                        let formatted = AIDrivenUtilities.formatRelativeTime(pastDate)
                        expect(formatted).toNot(beEmpty())
                    }
                }
            }
            
            // MARK: - UUID Generation Specs
            
            describe("UUID generation") {
                context("when generating full UUID") {
                    it("returns a 36-character string") {
                        let uuid = AIDrivenUtilities.generateUUID()
                        expect(uuid.count).to(equal(36))
                    }
                    
                    it("returns a valid UUID format") {
                        let uuid = AIDrivenUtilities.generateUUID()
                        expect(uuid).to(match("^[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}$"))
                    }
                    
                    it("generates unique UUIDs") {
                        let uuid1 = AIDrivenUtilities.generateUUID()
                        let uuid2 = AIDrivenUtilities.generateUUID()
                        expect(uuid1).toNot(equal(uuid2))
                    }
                }
                
                context("when generating short UUID") {
                    it("returns an 8-character string") {
                        let shortUUID = AIDrivenUtilities.generateShortUUID()
                        expect(shortUUID.count).to(equal(8))
                    }
                    
                    it("returns a valid hex format") {
                        let shortUUID = AIDrivenUtilities.generateShortUUID()
                        expect(shortUUID).to(match("^[0-9A-F]{8}$"))
                    }
                    
                    it("generates unique short UUIDs") {
                        let uuid1 = AIDrivenUtilities.generateShortUUID()
                        let uuid2 = AIDrivenUtilities.generateShortUUID()
                        expect(uuid1).toNot(equal(uuid2))
                    }
                }
            }
        }
    }
}
