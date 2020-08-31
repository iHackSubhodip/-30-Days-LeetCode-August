/*
 Question - Add and Search Word - Data structure design
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/549/week-1-august-1st-august-7th/3413/
 */

class TrieNode{
        var children: [String: TrieNode]
        var isWord: Bool

        init(){
            self.children = [String: TrieNode]()
            self.isWord = false
        }
    }

class WordDictionary {
    
    var root: TrieNode
    /** Initialize your data structure here. */
    init() {
       root = TrieNode()
    }
    
    /** Adds a word into the data structure. */
    func addWord(_ word: String) {
        guard !word.isEmpty else { return }
        var current = self.root
        
        for letter in word{
            if let node = current.children[String(letter)]{
                current = node
            }else{
                var trie = TrieNode()
                current.children[String(letter)] = trie
                current = trie
            }
        }
        current.isWord = true
    }
    
    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
    func search(_ word: String) -> Bool {
        func backtrack(_ array: [Character], _ index: Int, _ node: TrieNode) -> Bool {
            let c = array[index]
            if c != "." {
                guard let child = node.children[String(c)] else { return false }
                return index == array.count-1 ? child.isWord : backtrack(array, index+1, child)
            } else {
                for (key, child) in node.children {
                    if index == array.count-1 {
                        if child.isWord == true { return true }
                    } else {
                        if backtrack(array, index+1, child) == true { return true }
                    }
                }
                return false
            }
        }
        
        return backtrack(Array(word), 0, root)
    }
}
