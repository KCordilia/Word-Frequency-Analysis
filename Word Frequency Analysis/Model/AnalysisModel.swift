//
//  AnalysisModel.swift
//  Word Frequency Analysis
//
//  Created by Karim Cordilia on 28/06/2019.
//  Copyright © 2019 Karim Cordilia. All rights reserved.
//

import Foundation

struct CountedWords {
    static var countedWords: [(String, Int)] = []
//    static var history: [String] = []
}

func separateAndCountWords(in text: String){
    let allWords = text.words
    let mappedItems = allWords.map { ($0, 1) }
    let counts = Dictionary(mappedItems, uniquingKeysWith: +).sorted {$0.value > $1.value}
    
    counts.forEach { element in
        CountedWords.countedWords.append((String(element.key), element.value))
    }
}

extension StringProtocol {
    var words: [SubSequence] {
        return split{ !$0.isLetter }
    }
}

