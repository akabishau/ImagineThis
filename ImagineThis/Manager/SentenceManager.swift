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
        var adjectiveSubject: String
        var subject: String
        var verb: String
        var adjectiveObject: String
        var object: String
        var situation: String
        let space = " + "
        
        func buildSentence(for level: Level) -> String {
            switch level {
            case .easy:
                return subject + space + verb + space + object
            case .normal:
                return adjectiveSubject + space + subject + space + verb + space + adjectiveObject + space + object
            case .hard:
                return adjectiveSubject + space + subject + space + verb + space + adjectiveObject + space + object + space + situation
            }
        }
    }
    
    func generateSentence() -> String {
        let subject = words.subjects[category]?.randomElement()
        let adjustiveSubject = words.adjectives[category]?.randomElement()
        let verb = words.verbs[category]?.randomElement()
        let adjectiveObject = words.adjectives[category]?.randomElement()
        let object = words.objects[category]?.randomElement()
        let situation = words.situations[category]?.randomElement()
        
        
        let sentence = Sentence(article: nil,
                                adjectiveSubject: adjustiveSubject!,
                                subject: subject!, verb: verb!,
                                adjectiveObject: adjectiveObject!,
                                object: object!,
                                situation: situation!)
        
        
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
