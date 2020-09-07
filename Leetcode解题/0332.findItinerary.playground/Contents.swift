import UIKit

//var allPlaces = [String: [String]]()
//var minTracket = [String]()
//let JFK = "JFK"
//
//func findItinerary(_ tickets: [[String]]) -> [String] {
//    var dic = [String: [String]]()
//    for ticket in tickets {
//        let from = ticket[0]
//        let to = ticket[1]
//
//        if var toArray = dic[from] {
//
//            var index = 0
//            while index <= toArray.count {
//                if (index == toArray.count) {
//                    toArray.append(to)
//                    dic[from] = toArray
//                    break;
//                }
//                let toValue = toArray[index]
//                if toValue > to {
//                    toArray.insert(to, at: index)
//                    dic[from] = toArray
//                     break;
//                } else {
//                    index += 1
//                }
//            }
//
//        } else {
//            dic[from] = [to]
//        }
//    }
//
//    allPlaces = dic
//    print(allPlaces)
//
//    minTracket = [JFK]
//    minTracketTool()
//
//    return minTracket
//}
//
//func nextToPlace(from: String) -> String? {
//    if let toPlaces = allPlaces[from] {
//        if toPlaces.count > 0 {
//            for (index, toPlace) in toPlaces.enumerated() {
//                if let toPlaceToPlaces = allPlaces[toPlace], toPlaceToPlaces.count > 0 {
//
//                    // 提前删除
//                    var del_array = toPlaces
//                    del_array.remove(at: index)
//                    if del_array.count > 0 {
//                        allPlaces[from] = del_array
//                    } else {
//                        allPlaces.removeValue(forKey: from)
//                    }
//
//                    return toPlace
//                }
//            }
//
//            let toPlace = toPlaces[0]
//
//            var del_array = toPlaces
//            del_array.removeFirst()
//            if del_array.count > 0 {
//                allPlaces[from] = del_array
//            } else {
//                allPlaces.removeValue(forKey: from)
//            }
//
//            return toPlace
//        }
//    }
//
//    return nil
//}
//
//func minTracketTool(){
//    let from = minTracket[minTracket.count - 1]
//    //    print(from)
//    if let toPlace = nextToPlace(from: from){
//        minTracket.append(toPlace)
//        print(minTracket)
//        minTracketTool()
//    } else {
//        if let toPlace = nextToPlace(from: JFK) {
//            minTracket.append(toPlace)
//            print(minTracket)
//            minTracketTool()
//        }
//    }
//
//    print(allPlaces)
//}
//
////let places = [["JFK","ATL"],["ATL","JFK"]]
////let places =  [["JFK","KUL"],["JFK","NRT"],["NRT","JFK"]]
//let places = [["EZE","TIA"],["EZE","HBA"],["AXA","TIA"],["JFK","AXA"],["ANU","JFK"],["ADL","ANU"],["TIA","AUA"],["ANU","AUA"],["ADL","EZE"],["ADL","EZE"],["EZE","ADL"],["AXA","EZE"],["AUA","AXA"],["JFK","AXA"],["AXA","AUA"],["AUA","ADL"],["ANU","EZE"],["TIA","ADL"],["EZE","ANU"],["AUA","ANU"]]
//
//
//
//print(findItinerary(places))
