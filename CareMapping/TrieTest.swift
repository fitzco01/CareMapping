//
//  TrieTest.swift
//  SwiftStructures
//
//Thanks to Wayne Bishop for the open source trie implementation
//
//link to his website:
//waynewbishop.com
//
//The MIT License (MIT)
//
//Copyright (c) 2015, Wayne Bishop & Arbutus Software Inc.
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import UIKit
import XCTest

@testable import SwiftStructures


class TrieTest: XCTestCase {
    
    var testTrie: Trie = Trie()

    
    override func setUp() {
        super.setUp()
        
        XCTAssertNotNil(testTrie, "Trie instance not correctly intialized..")
    
        
        //add words to data structure
        testTrie.addWord("Ball")
        testTrie.addWord("Balls")
        testTrie.addWord("Ballard")
        testTrie.addWord("Bat")
        testTrie.addWord("Bar")
    }
    
    

    /*
    the findWord algorithm will only return strings identified as words. For example, the prefix "Ba" has 3 children,
    but only 2 are marked as final. Even though the phrase "Bal" is found in the trie, it is not
    identified as a word.
    */

    func testFindWithPrefix() {
        
        let wordList: Array<String>! = testTrie.findWord("Ba")
        for word in wordList {
            print("\(word) found in trie..")
        }
        
    }

    
    
    /*
    the findWord algorthim will identify both parents and children identified as words
    */
    
    func testFindWithWord() {
        
        let wordList: Array<String>! = testTrie.findWord("Ball")
        for word in wordList {
            print("\(word) found in trie..")
        }
        
    }
    
    
    //testing false search results
    func testFindNoExist() {
        
        let keyword: String = "Barstool"
        let wordList: Array<String>! = testTrie.findWord(keyword)
        
        
        if (wordList == nil) {
            print("keyword \(keyword) not found in trie..")
        }
        
        else {
            for word in wordList {
                print("\(word) found in trie..")
            }
        }
        

        
    } //end function
    

}
