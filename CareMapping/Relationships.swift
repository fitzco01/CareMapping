//
//  Relationships.swift
//  CareMapping
//
//  Created by Connor Fitzpatrick on 5/21/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import Foundation

class Relationships {

    var relationshipTrie: Trie = Trie()

    func addNameToTree(groupName: String) {
        relationshipTrie.addWord(groupName)
    }

    /*
    the findWord algorithm will only return strings identified as words. For example, the prefix "Ba" has 3 children,
    but only 2 are marked as final. Even though the phrase "Bal" is found in the trie, it is not
    identified as a word.
    */

    func findWithPrefix() {
        
        let wordList: Array<String>! = relationshipTrie.findWord("Ba")
        for word in wordList {
            print("\(word) found in trie..")
        }
    }

    /*
     the findWord algorthim will identify both parents and children identified as words
    */

    func findWithWord() {
        
        let wordList: Array<String>! = relationshipTrie.findWord("Ball")
        for word in wordList {
            print("\(word) found in trie..")
        }
    }

    //testing false search results
    func findNoExist() -> Bool {
        
        let keyword: String = "Barstool"
        let wordList: Array<String>! = relationshipTrie.findWord(keyword)
        
        
        if (wordList == nil) {
            print("keyword \(keyword) not found in trie..")
            return false
        }
            
        else {
            for word in wordList {
                print("\(word) found in trie..")
            }
            return true
        }
    }
}