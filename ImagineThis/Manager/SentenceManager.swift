//
//  SentenceManager.swift
//  ImagineThis
//
//  Created by Aleksey on 1201..20.
//

import UIKit

struct SentenceManager {
    
    let words = WordsData()
    var category: Category!
    var level: Level!
    
    
    struct Sentence {
        var article: Article
        var adjectiveSubject: String
        var subject: String
        var verb: String
        var adjectiveObject: String
        var object: String
        var situation: String
        let space = " "
        let period = "."
        
        
        func buildSentence(for level: Level) -> String {
            switch level {
            case .easy:
                return article.defineArticle(word: subject).rawValue.capitalized + space + subject + space + verb + space + article.defineArticle(word: object).rawValue + space + object + period
            case .normal:
                return article.defineArticle(word: adjectiveSubject).rawValue.capitalized + space + adjectiveSubject + space + subject + space + verb + space + article.defineArticle(word: adjectiveObject).rawValue + space + adjectiveObject + space + object + period
            case .hard:
                return article.defineArticle(word: adjectiveSubject).rawValue.capitalized + space + adjectiveSubject + space + subject + space + verb + space + article.defineArticle(word: adjectiveObject).rawValue + space + adjectiveObject + space + object + space + situation + period
            }
        }
    }
    
    func generateSentence() -> Card {
        print(#function)
        let subject = words.subjects[category]?.randomElement()
        let adjustiveSubject = words.adjectives[category]?.randomElement()
        let verb = words.verbs[category]?.randomElement()
        let adjectiveObject = words.adjectives[category]?.randomElement()
        let object = words.objects[category]?.randomElement()
        let situation = words.situations[category]?.randomElement()
        
        
        let sentence = Sentence(article: .none,
                                adjectiveSubject: adjustiveSubject!,
                                subject: subject!,
                                verb: verb!,
                                adjectiveObject: adjectiveObject!,
                                object: object!,
                                situation: situation!)
        
        let angle = generateRandomAngle(for: 10)
        let text = sentence.buildSentence(for: level)
        
        return Card(text: text, rotationAngle: angle)
    }
    
    
    func generateRandomAngle(for angle: Int) -> CGFloat {
        print(#function)
        let minimum = -CGFloat(angle) * .pi / 180
        let maximum = CGFloat(angle) * .pi / 180
        let randomAngle = CGFloat.random(in: minimum...maximum)
        return randomAngle
    }
    
}

struct Card: Hashable {
    var text: String
    var rotationAngle: CGFloat
    
    init(text: String, rotationAngle: CGFloat) {
        self.text = text
        self.rotationAngle = rotationAngle
    }
}


// article logic
enum Article: String {
    case a // doesn't start with vowel
    case an // starts with vowel
    case the //specific words from data set
    case none = ""
    
    func defineArticle(word: String) -> Article {
        
        // check if subject of object is the one of "the" words
        // get first letter
        // check is it one of five vowels
        
        let words = WordsData()
        if let exception = words.articlesExceptions[word] {
            return exception
        }
        
        let first = word[word.startIndex]
        
        switch first {
        case "a", "e", "o", "u", "y": return .an
        default: return .a
        }
    }
}
