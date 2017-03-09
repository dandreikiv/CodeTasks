//: Playground - noun: a place where people can play

import Foundation

class Point: CustomDebugStringConvertible, Equatable {
	
	var name: String
	
	private var linkedPoints: [ Connection ] = []
	
	var connections: [ Connection ] {
		get {
			return linkedPoints;
		}
	}
	
	var debugDescription: String {
		get {
			
			var connectedStr = ""
			for conn in linkedPoints {
				connectedStr += "[\(conn.endPoint.name) (\(conn.weight))] "
			}
			
			return "\(name): " + connectedStr
		}
	}
	
	init(_ name: String) {
		self.name = name
	}
	
	func addConnectionTo(point:Point, with weight: Double) {
		linkedPoints.append(
			Connection(startPoint: self, endPoint: point, weight: weight)
		)
	}
	
	static func ==(lhs: Point, rhs: Point) -> Bool {
		return lhs.name == rhs.name
	}
}

class Connection: CustomDebugStringConvertible {
	var startPoint: Point
	var endPoint: Point
	var weight: Double = 0.0
	
	var debugDescription: String {
		get {
			return "\(startPoint.debugDescription)->\(endPoint.debugDescription) \(weight)"
		}
	}
	
	init(startPoint: Point, endPoint: Point, weight: Double) {
		self.startPoint = startPoint
		self.endPoint = endPoint
		self.weight = weight
	}
}

var eur = Point("EUR")
var usd = Point("USD")
var gbp = Point("GBP")

eur.addConnectionTo(point: usd, with: 0.8631)
eur.addConnectionTo(point: gbp, with: 1.4600)

usd.addConnectionTo(point: eur, with: 1 / 0.8631)
usd.addConnectionTo(point: gbp, with: 1.6939)

gbp.addConnectionTo(point: eur, with: 1 / 1.4600)
gbp.addConnectionTo(point: usd, with: 1 / 1.6939)

var visitedPoins: [Point] = []

func traverse(from startPoint:Point, toPoint endPoint: Point) {
	
	visitedPoins.append(startPoint)
	
	for conn in startPoint.connections {
		if conn.endPoint != endPoint {
			if (visitedPoins.contains(conn.endPoint) == false) {
				traverse(from: conn.endPoint, toPoint: endPoint)
				visitedPoins.removeLast()
			}

		} else {
			
			var result = visitedPoins
			result.append(endPoint)
			
			let names = result.map({ $0.name })
			print(names.joined(separator: "->"))
		}
	}
}

traverse(from: usd, toPoint: usd)

