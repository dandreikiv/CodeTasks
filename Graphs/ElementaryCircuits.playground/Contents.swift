//: Playground - noun: a place where people can play
//: Donald B. Johnson. Finding all the elementary circuits of a directed graph.

import Foundation

let a:[[Int]] = [
	[1, 2],
	[0, 2],
	[0, 1],
]

let numberOfVertices = a.count

var ak = Array<[Int]>(a)
var b = Array<[Int]>(repeating: [], count: numberOfVertices)
var blockedVertices = Array<Bool>(repeating: false, count: numberOfVertices)

var index: Int = 0
var stack = Array<Int>()

func circuit(v: Int) -> Bool {
	var result: Bool = false
	stack.append(v)
	
	blockedVertices[v] = true
	
	for w in ak[v] {
		if w == index {
			var arr = stack
			arr.append(w)
			print(arr)
			result = true
		}
		else if blockedVertices[w] == false {
			if circuit(v: w) {
				result = true
			}
		}
	}
	
	if result == true {
		unblock(u: v)
	}
	else {
		for w in ak[v] {
			if b[w].contains(v) == false {
				b[w].append(v)
			}
		}
	}
	
	stack.removeLast()
	return result
}

func unblock(u: Int) {
	
	blockedVertices[u] = false
	
	for w in b[u] {
		
		let idx = b[u].index(where: {$0 == w})
		if let idx = idx {
			b[u].remove(at: idx)
			if blockedVertices[idx] == true {
				unblock(u: idx)
			}
		}
	}
}

index = 0

while index < numberOfVertices {

	for idx in 0..<numberOfVertices {
		blockedVertices[idx] = false
		b[idx].removeAll()
	}
	_ = circuit(v: index)
	index = index + 1
}






