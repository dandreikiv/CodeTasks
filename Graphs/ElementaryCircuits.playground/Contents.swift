//: Playground - noun: a place where people can play
//: Donald B. Johnson. Finding all the elementary circuits of a directed graph.

import Foundation

var verticesRalations = Array<[Int]>([
	[1, 2],
	[0, 2],
	[0, 1],
	]
)

let numberOfVertices = verticesRalations.count

var b = Array<[Int]>(repeating: [], count: numberOfVertices)
var blockedVertices = Array<Bool>(repeating: false, count: numberOfVertices)

var observingVertex: Int = 0
var stack = Array<Int>()

func circuitsFrom(vertex vIndex: Int) -> Bool {
	var result: Bool = false
	stack.append(vIndex)
	
	blockedVertices[vIndex] = true
	
	for vertex in verticesRalations[vIndex] {
		if vertex == observingVertex {
			var arr = stack
			arr.append(vertex)
			print(arr)
			result = true
		}
		else if blockedVertices[vertex] == false {
			if circuitsFrom(vertex: vertex) {
				result = true
			}
		}
	}
	
	if result == true {
		unblock(vertice: vIndex)
	}
	else {
		for vertex in verticesRalations[vIndex] {
			if b[vertex].contains(vIndex) == false {
				b[vertex].append(vIndex)
			}
		}
	}
	
	stack.removeLast()
	return result
}

func unblock(vertice vIndex: Int) {
	
	blockedVertices[vIndex] = false
	
	for w in b[vIndex] {
		
		let idx = b[vIndex].index(where: {$0 == w})
		if let idx = idx {
			b[vIndex].remove(at: idx)
			if blockedVertices[idx] == true {
				unblock(vertice: idx)
			}
		}
	}
}

observingVertex = 0

while observingVertex < numberOfVertices {

	for idx in 0 ..< numberOfVertices {
		blockedVertices[idx] = false
		b[idx].removeAll()
	}
	_ = circuitsFrom(vertex: observingVertex)
	observingVertex = observingVertex + 1
}




