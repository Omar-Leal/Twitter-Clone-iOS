import Foundation
import Firebase
import FirebaseAuthCombineSwift
import Combine


class AuthManager {
	
	static let selfInstante = AuthManager()
	
	func registerUserWithEmail(with email: String, and password: String) -> AnyPublisher<User,Error> {
		return Auth.auth().createUser(withEmail: email, password: password)
			.map(\.user)
			.eraseToAnyPublisher()
	}
	
}



