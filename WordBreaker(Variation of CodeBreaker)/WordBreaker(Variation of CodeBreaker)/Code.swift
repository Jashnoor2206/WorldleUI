//
//  Code.swift
//  WordBreaker(Variation of CodeBreaker)
//
//  Created by Jashnoor Singh on 08/06/26.
//

import SwiftUI

enum Match{ // this will check against master code
    case exact
    case inexact
    case nomatch
}

struct Code{
    var kind: Kind
    var inside: [Character]
    
    enum Kind: Equatable{
        case mastercode (isHidden: Bool)
        case guess
        case attempt ([Match]) // this will store exact, inexact, no match array for each code in attempts array
    }
    
    var matches: [Match]?{ // returns matches array from the case
        switch kind{
        case .attempt(let matches): return matches
        default: return nil
        }
    }
    
    func match(against otherCode: Code) -> [Match] {
        var wordsToMatch = otherCode.inside
        let backward_exactMatches = wordsToMatch.indices.reversed().map{ index in
            if wordsToMatch.count > index , wordsToMatch[index] == inside[index]{
                wordsToMatch.remove(at: index)
                return Match.exact
            } else{return .nomatch}
        }
        
        let exactMatches = Array(backward_exactMatches.reversed())
        
        return inside.indices.map{ index in
            if exactMatches[index] != .exact ,let matchIndex = wordsToMatch.firstIndex(of: inside[index]){
                wordsToMatch.remove(at: matchIndex)
                return .inexact
            }
            else{
                return exactMatches[index]
            }
        }
    }
}
