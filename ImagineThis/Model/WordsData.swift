//
//  WordsData.swift
//  ImagineThis
//
//  Created by Aleksey on 1126..20.
//

import Foundation

struct WordsData {
    
    let verbs: [Category: [String]] = [
        .random: ["randomVerb1", "randomVerb2", "randomVerb4", "randomVerb4", "randomVerb5"],
        .horror: ["horrorVerb1", "horrorVerb2", "horrorVerb3", "horrorVerb4", "horrorVerb5"],
        .urban: ["urbanVerb1", "urbanVerb2", "urbanVerb3", "urbanVerb4", "urbanVerb5"],
        .magic: ["magicVerb1", "magicVerb2", "magicVerb3", "magicVerb4", "magicVerb5"]
    ]
    
    
    let subjects: [Category: [String]] = [
        .random: ["randomSubject1", "randomSubject2", "randomSubject3", "randomSubject4", "randomSubject5"],
        .horror: ["horrorSubject1", "horrorSubject2", "horrorSubject3", "horrorSubject4", "horrorSubject5"],
        .urban: ["urbanSubject1", "urbanSubject2", "urbanSubject3", "urbanSubject4", "urbanSubject5"],
        .magic: ["magicSubject1", "magicSubject2", "magicSubject3", "magicSubject4", "magicSubject5"]
    ]
    
    
    
    let objects: [Category: [String]] = [
        .random: ["randomObject1", "randomObject2", "randomObject3", "randomObject4", "randomObject5"],
        .horror: ["horrorObject1", "horrorObject2", "horrorObject3", "horrorObject4", "horrorObject5"],
        .urban: ["urbanObject1", "urbanObject2", "urbanObject3", "urbanObject4", "urbanObject5"],
        .magic: ["magicObject1", "magicObject2", "magicObject3", "magicObject4", "magicObject5"]
    ]
    
    
    let adjectives: [Category: [String]] = [
        .random: ["randomAdjective1", "randomAdjective2", "randomAdjective3", "randomAdjective4", "randomAdjective5"],
        .horror: ["horrorAdjective1", "horrorAdjective2", "horrorAdjective3", "horrorAdjective4", "horrorAdjective5"],
        .urban: ["urbanAdjective1", "urbanAdjective2", "urbanAdjective3", "urbanAdjective4", "urbanAdjective5"],
        .magic: ["magicAdjective1", "magicAdjective2", "magicAdjective3", "magicAdjective4", "magicAdjective5"]
    ]
    
    
    let situations: [Category: [String]] = [
        .random: ["randomSituation1", "randomSituation2", "randomSituation3", "randomSituation4", "randomSituation5"],
        .horror: ["horrorSituation1", "horrorSituation2", "horrorSituation3", "horrorSituation4", "horrorSituation5"],
        .urban: ["urbanSituation1", "urbanSituation2", "urbanSituation3", "urbanSituation4", "urbanSituation5"],
        .magic: ["magicSituation1", "magicSituation2", "magicSituation3", "magicSituation4", "magicSituation5"]
    ]
}
