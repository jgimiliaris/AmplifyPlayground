// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "a3575e0b5b9446b108f4e3f35dace0cb"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Chore.self)
  }
}