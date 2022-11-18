import Foundation


final class RegisterViewModel: ObservableObject {
    
    @Published var email: String?
    @Published var password: String?
    @Published var isRegistrationFormValid: Bool = false
    
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
    
    
    
}
