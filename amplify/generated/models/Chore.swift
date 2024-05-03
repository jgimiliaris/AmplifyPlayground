// swiftlint:disable all
import Amplify
import Foundation

public struct Chore: Model {
  public let id: String
  public var name: String
  public var completdTime: Temporal.DateTime?
  public var dueDate: Temporal.DateTime
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      name: String,
      completdTime: Temporal.DateTime? = nil,
      dueDate: Temporal.DateTime) {
    self.init(id: id,
      name: name,
      completdTime: completdTime,
      dueDate: dueDate,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      name: String,
      completdTime: Temporal.DateTime? = nil,
      dueDate: Temporal.DateTime,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.name = name
      self.completdTime = completdTime
      self.dueDate = dueDate
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}