//
//  extensions.swift
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


extension String {
  
    
    //compute the length
    var length: Int {
        return self.characters.count
    }
    
    
    //returns characters up to a specified index
    func substringToIndex(to: Int) -> String {
        return self.substringToIndex(self.startIndex.advancedBy(to))
    }
    
    
    
    //return a character at a specific index
    func stringAtIndex(position: Int) -> String {
        return String(Array(self.characters)[position])
    }
    
    
    //replace string content
    func replace(string:String, replacement:String) -> String {
        return self.stringByReplacingOccurrencesOfString(string, withString: replacement)
    }
    
    
    //removes empty string content
    func removeWhitespace() -> String {
        return self.replace(" ", replacement: "")
    }
    

    //insert a string at a specified index
    func insertSubstring(string:String, index:Int) -> String {
        return  String(self.characters.prefix(index)) + string + String(self.characters.suffix(self.characters.count-index))
    }

    
    //convert a string into a character array
    func characters() ->Array<Character>! {
        return Array(self.characters)
    }

    
    //reverse string order
    func reverse() -> String! {
                
        /*
        notes: While this operation would normally be done 'in-place', there are limited
        functions for manipulating native Swift strings. Even there is a
        native Array.reverse() method, this has been added as an example interview question.
        */

        
        //convert to array
        var characters = self.characters()
        
        var findex: Int = 0
        var bindex: Int = characters.count - 1
        
        
        while findex < bindex {
            
            //swap positions - inout parameters
            swap(&characters[findex], &characters[bindex])
            
            //update values
            findex += 1
            bindex -= 1
            
            
        } //end while
        
        
        return String(characters)
        
    }

    
}





extension Int {
    
    //iterates the closure body a specified number of times
	func times(closure:(Int)->Void) {
		for i in 0...self {
			closure(i)
		}
	}
	
}



extension Array {
    
    //returns the middle index
    func midIndex() -> Index {
        return startIndex + (count / 2)
    }
    
    
    //returns the first index
    func minIndex() -> Index {
        return startIndex
    }
    
    
    //returns the max index
    func maxIndex() -> Index {
        return endIndex - 1
    }
    
}

