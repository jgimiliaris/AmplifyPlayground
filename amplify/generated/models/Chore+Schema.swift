// swiftlint:disable all
import Amplify
import Foundation

extension Chore {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case completdTime
    case dueDate
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let chore = Chore.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.listPluralName = "Chores"
    model.syncPluralName = "Chores"
    
    model.attributes(
      .primaryKey(fields: [chore.id])
    )
    
    model.fields(
      .field(chore.id, is: .required, ofType: .string),
      .field(chore.name, is: .required, ofType: .string),
      .field(chore.completdTime, is: .optional, ofType: .dateTime),
      .field(chore.dueDate, is: .required, ofType: .dateTime),
      .field(chore.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(chore.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension Chore: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}