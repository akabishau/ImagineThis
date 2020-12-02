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
    
    
    func generateSentance(for category: Category, level: Level) -> String {
        switch (level, category) {
            case (.easy, .horror): return generateEasyHorrorSentence()
            case (.easy, .urban): return generateEasyUrbanSentence()
                // the same implementation for normal and hard for now
            case (.normal, .horror): return generateHorrorSentence()
            case (.normal, .urban): return generateUrbanSentence()
            case (.hard, .horror): return generateHorrorSentence()
            case (.hard, .urban): return generateUrbanSentence()
        }
    }
    
    
    func generateEasyUrbanSentence() -> String {
        let noun = words.urbanNouns[Int.random(in: 0..<words.urbanNouns.count)]
        let verb = words.verbs[Int.random(in: 0..<words.verbs.count)]
        let place = words.places[Int.random(in: 0..<words.places.count)]
        
        return noun + " " + verb + " " + place
    }
    
    
    func generateEasyHorrorSentence() -> String {
        let noun = words.horrorNouns[Int.random(in: 0..<words.horrorNouns.count)]
        let verb = words.verbs[Int.random(in: 0..<words.verbs.count)]
        let place = words.places[Int.random(in: 0..<words.places.count)]
        
        return noun + " " + verb + " " + place
    }
    
    
    func generateUrbanSentence() -> String {
        let adjuective = words.adjectives[Int.random(in: 0..<words.adjectives.count)]
        let noun = words.urbanNouns[Int.random(in: 0..<words.urbanNouns.count)]
        let verb = words.verbs[Int.random(in: 0..<words.verbs.count)]
        let noun2 = words.urbanNouns[Int.random(in: 0..<words.urbanNouns.count)]
        let place = words.places[Int.random(in: 0..<words.places.count)]
        
        return adjuective + " " + noun + " " + verb + " " + noun2 + " " + place
    }
    
    
    func generateHorrorSentence() -> String {
        let adjuective = words.adjectives[Int.random(in: 0..<words.adjectives.count)]
        let noun = words.horrorNouns[Int.random(in: 0..<words.horrorNouns.count)]
        let verb = words.verbs[Int.random(in: 0..<words.verbs.count)]
        let noun2 = words.horrorNouns[Int.random(in: 0..<words.horrorNouns.count)]
        let place = words.places[Int.random(in: 0..<words.places.count)]
        
        return adjuective + " " + noun + " " + verb + " " + noun2 + " " + place
    }
}
