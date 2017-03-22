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
            return "\(startPoint.name)->\(endPoint.name) \(weight)"
        }
    }
    
    init(startPoint: Point, endPoint: Point, weight: Double) {
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.weight = weight
    }
}

struct Currency {
    let name: String
}

struct Pair {
    let currencyOne: Currency
    let currencyTwo: Currency
    let rate: Double
    
    func reversePair() -> Pair {
        
        let reverseRate = (self.rate != 0) ? 1 / self.rate : 0.0
        
        let reverse = Pair(currencyOne: self.currencyOne,
                           currencyTwo: self.currencyTwo,
                           rate: reverseRate)
        return reverse
    }
}

var btc = Point("BTC")
var ltc = Point("LTC")
var nmc = Point("NMC")
var nvc = Point("NVC")
var usd = Point("USD")
var eur = Point("EUR")
var ppc = Point("PPC")
var dsh = Point("DSH")
var eth = Point("ETH")
var rur = Point("RUR")

var gbp = Point("GBP")

// BTC connections

//usd.addConnectionTo(point: btc, with: 1174.2)
//btc.addConnectionTo(point: usd, with: 1 / 1174.2)
//
//rur.addConnectionTo(point: btc, with: 68600.0)
//btc.addConnectionTo(point: rur, with: 1 / 68600.0)
//
//eur.addConnectionTo(point: btc, with: 1115.0)
//btc.addConnectionTo(point: eur, with: 1 / 1115.0)
//
//btc.addConnectionTo(point: ltc, with: 0.00322)
//ltc.addConnectionTo(point: btc, with: 1 / 0.00322)
//
//usd.addConnectionTo(point: ltc, with: 3.774083)
//ltc.addConnectionTo(point: usd, with: 1 / 3.774083)
//
//rur.addConnectionTo(point: ltc, with: 223.265)
//ltc.addConnectionTo(point: rur, with: 1 / 223.265)
//
//eur.addConnectionTo(point: ltc, with: 3.607)
//ltc.addConnectionTo(point: eur, with: 1 / 3.607)
//
//btc.addConnectionTo(point: nmc, with: 0.00025)
//nmc.addConnectionTo(point: btc, with: 1 / 0.00025)
//
//usd.addConnectionTo(point: nmc, with: 0.304)
//nmc.addConnectionTo(point: usd, with: 1 / 0.304)
//
//btc.addConnectionTo(point: nvc, with: 0.00082)
//nvc.addConnectionTo(point: btc, with: 1 / 0.00082)
//
//usd.addConnectionTo(point: nvc, with: 0.965)
//nvc.addConnectionTo(point: usd, with: 1 / 0.965)
//
//rur.addConnectionTo(point: usd, with: 58.72001)
//usd.addConnectionTo(point: rur, with: 1 / 58.72001)
//
//usd.addConnectionTo(point: eur, with: 1.054)
//eur.addConnectionTo(point: usd, with: 1 / 1.054)
//
//rur.addConnectionTo(point: eur, with: 61.68083)
//eur.addConnectionTo(point: rur, with: 1 / 61.68083)
//
//btc.addConnectionTo(point: ppc, with: 0.00033)
//ppc.addConnectionTo(point: btc, with: 1 / 0.00033)
//
//usd.addConnectionTo(point: ppc, with: 0.388)
//ppc.addConnectionTo(point: usd, with: 1 / 0.388)
//
//btc.addConnectionTo(point: dsh, with: 0.05915)
//dsh.addConnectionTo(point: btc, with: 1 / 0.05915)
//
//usd.addConnectionTo(point: dsh, with: 68.13825)
//dsh.addConnectionTo(point: usd, with: 1 / 68.13825)
//
//rur.addConnectionTo(point: dsh, with: 4098.453)
//dsh.addConnectionTo(point: rur, with: 1 / 4098.453)
//
//eur.addConnectionTo(point: dsh, with: 65.85)
//dsh.addConnectionTo(point: eur, with: 1 / 65.85)
//
//ltc.addConnectionTo(point: dsh, with: 18.387)
//dsh.addConnectionTo(point: ltc, with: 1 / 18.387)
//
//eth.addConnectionTo(point: dsh, with: 3.17)
//dsh.addConnectionTo(point: eth, with: 1 / 3.17)
//
//btc.addConnectionTo(point: eth, with: 0.01885)
//eth.addConnectionTo(point: btc, with: 1 / 0.01885)
//
//usd.addConnectionTo(point: eth, with: 21.9689)
//eth.addConnectionTo(point: usd, with: 1 / 21.9689)
//
//eur.addConnectionTo(point: eth, with: 20.83018)
//eth.addConnectionTo(point: eth, with: 1 / 20.83018)
//
//ltc.addConnectionTo(point: eth, with: 5.80861)
//eth.addConnectionTo(point: ltc, with: 1 / 5.80861)
//
//rur.addConnectionTo(point: eth, with: 1288.98844)
//eth.addConnectionTo(point: rur, with: 1 / 1288.98844)


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

traverse(from: eur, toPoint: eur)




