//  tuwaiq 1000
//
//  Created by M.Al-qhtani.
//

import Foundation
var someSet = Set<Character>()


class QuizManager {
    
    private let quizes: [(question: String, correctAnswer: String, options: [String])] = [
            (question: "Which of these is string?", correctAnswer: "\"Hello World\"",
             options: ["20", "\"Hello World\"", "Hello World", "'Hello World'"]),
            (question: "What is the result of the expression \"1\" + \"1\"", correctAnswer: "\"11\"",
             options: ["11", "\"2\"", "\"11\"", "\"1 1\""]),
            (question: "Which of these symbols is used to \"escape\" special characters", correctAnswer: "\\",
             options: ["/", "\\", "!", "ESC"]),
            (question: "What is the correct syntax for declaring a function?", correctAnswer: "func myFunction() {}",
             options: ["func = myFunction() {}", "let myFunction = func() {}", "let func = myFunction() {}", "func myFunction() {}"]),
            (question:
                """
                   func printSomething() {
                      print("I love KSA")
                   }
                   printSomething()
                """, correctAnswer: "Adoro funções",
                     options: ["Nothing", "printSomething()", "I love KSA", "Error"]),
            (question: "When we don't declare a function's return type, what is the default return?", correctAnswer: "Void",
             options: ["Void", "Int", "String", "nil"]),
            (question: "What is the correct syntax for declaring a parameter?", correctAnswer: "resposta correta",
             options: ["func myFunc(String message) {}", "func myFunc(let message = String) {}", "func myFunc(message String) {}", "func myFunc(message: String) {}"]),
            
            (question: "What is the type of a String variable that can accept nil?", correctAnswer: "String?",
             options: ["String", "String?", "Int", "Void"]),
            (question: "When we want to declare a constant, which reserved word should we use?", correctAnswer: "let",
             options: ["var", "const", "let", "CONST"]),
            (question: "What is a dictionary?", correctAnswer: "It is an unordered collection with key and value.",
             options: ["It is a collection that does not accept repeated objects.", "It is an ordered collection with key and value.", "It is an unordered collection with key and value.", "It is a collection that allows values ​​of different types."]),
            (question: "What is the name of the special type in Swift that is used to declare anonymous blocks or functions?", correctAnswer: "Closure",
             options: ["Lambda", "Block", "Closure", "Protocol"]),
            (question: "What is an enum?", correctAnswer: "User defined type for a group of related values",
             options: ["It's a set of Strings", "It's a special type of String", "It is a unary operator of type prefix.", "User defined type for a group of related values"]),
            (question: "What can an extension not do?", correctAnswer: "Add stored properties",
             options: ["Add new features", "Define new builders", "Add stored properties", "Add computed properties"]),
            (question: "When we inherit from a class and want to call its constructor, we use...", correctAnswer: "super.init",
             options: ["main.init", "super.init", "self.init", "super"]),
            ]
    private var quiz: Quiz!
    private var _totalAnswers = 0
    private var _totalCorrect = 0
    var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]


    var question: String {
        return quiz.question
    }
    
    var options: [String]{
        return quiz.options
    }
    
    var totalAnswers: Int {
        return _totalAnswers
    }
    
    var totalCorrectAnswers: Int {
        return _totalCorrect
    }
    func refreshQuiz() {
        let randomIndex = Int(arc4random_uniform(UInt32(quizes.count)))
        let quizData = quizes[randomIndex]
        quiz = Quiz(question: quizData.question, options: quizData.options, correctedAnswer: quizData.correctAnswer)
    }
    
    func validateAnswer(index: Int) {
        _totalAnswers += 1
        if quiz.validateOption(index) {
            _totalCorrect += 1
        }
    }
}
