//
//  Trie.swift
//  CareMapping
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

import Foundation


public class Trie {
    
    private var root: TrieNode!
    
    init(){
        root = TrieNode()
    }
    
    //finds all words based on the prefix
    func findWord(keyword: String) -> Array<String>! {
        
        guard keyword.characters.count > 0 else {
            return nil
        }
        
        var current: TrieNode = root
        var wordList: Array<String> = Array<String>()
        
        while (keyword.characters.count != current.level) {
            
            var childToUse: TrieNode!
            let searchKey: String = keyword.substringToIndex(current.level + 1)
            
            
            print("looking for prefix: \(searchKey)..")
            
            //iterate through any children
            for child in current.children {
                
                if (child.key == searchKey) {
                    childToUse = child
                    current = childToUse
                    break
                }
            }
            
            if childToUse == nil {
               return nil
            }
            
        } //end while
        
        
        //retrieve the keyword and any decendants
        if ((current.key == keyword) && (current.isFinal)) {
            wordList.append(current.key)
        }

        //include only children that are words
        for child in current.children {
            
            if (child.isFinal == true) {
                wordList.append(child.key)
            }
        }
        
        return wordList
        
    } //end function
    
    //builds a iterative tree of dictionary content
    func addWord(keyword: String) {
        
        guard keyword.characters.count > 0 else {
            return
        }
        
        var current: TrieNode = root
        
        while(keyword.characters.count != current.level) {
            
            var childToUse: TrieNode!
            let searchKey: String = keyword.substringToIndex(current.level + 1)
            
            print("current (\(keyword)) has \(current.children.count) children..")
            
            var loop = 0
            for _ in current.children {
                print("children: \(current.children[loop].key)")
                loop += 1
            }
            
            //iterate through the node children
            for child in current.children {
                
                if (child.key == searchKey) {
                    childToUse = child
                    break
                }
            }
            
            //create a new node
            if  (childToUse == nil) {
                
                childToUse = TrieNode()
                childToUse.key = searchKey
                childToUse.level = current.level + 1
                current.children.append(childToUse)
            }
            
            current = childToUse
            
        } //end while
        
        //add final end of word check
        if (keyword.characters.count == current.level) {
            current.isFinal = true
            print("end of word reached!")
            return
        }
    } //end function
}