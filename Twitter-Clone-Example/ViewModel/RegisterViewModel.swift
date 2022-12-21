import Foundation
import Firebase
import Combine



final class RegisterViewModel: ObservableObject {
    
    @Published var email: String? // This pubished variables is bindend with the UITextField
    @Published var password: String?
    @Published var isRegistrationFormValid: Bool = false
	@Published var user: User?
	
	private var subscriptions: Set<AnyCancellable> = []
	
    // binding textFields to the @published variables, same as create account button
    func validateRegistrationForm(){
        guard let validEmail = email,
              let validPassword = password
        else {
            isRegistrationFormValid = false
            return
        }
        
        isRegistrationFormValid = isValidEmail(validEmail) && validPassword.count >= 8
        
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
	func createUser() {
		guard let email,
			  let password
		else { return }
		AuthManager.selfInstante.registerUserWithEmail(with: email, and: password)
			.sink(receiveCompletion: { _ in }, receiveValue: { [ weak self ] _User in
				self?.user = _User
			})
			.store(in: &subscriptions)
	}
	
}
