//
//  SentenceManager.swift
//  ImagineThis
//
//  Created by Aleksey on 1201..20.
//

import Foundation

struct SentenceManager {
    
    let words = WordsData()
    var category: Category!
    var level: Level!
    
    
    struct Sentence {
        var article: Article?
        var adjective: String?
        var subject: String
        var verb: String
        var object: String
        let space = " + "
        
        func buildSentence(for level: Level) -> String {
            switch level {
            case .easy: return subject + space + verb + space + object
            case .normal: return "" // replace with real one
            case .hard: return "" // replace with real one
            }
        }
    }
    
    func generateSentence() -> String {
        let subject = words.subjects[category]?.randomElement()
        let verb = words.verbs[category]?.randomElement()
        let object = words.objects[category]?.randomElement()
        
        
        let sentence = Sentence(article: nil, adjective: nil, subject: subject!, verb: verb!, object: object!)
        
        
        return sentence.buildSentence(for: level)
    }
    
    
    // article logic
    enum Article: String {
        case a // doesn't start with vowel
        case an // starts with vowel
        case the //specific words from data set
    }
    private func defineAnArticle(word: String) -> Article {
        return .a
    }
}
