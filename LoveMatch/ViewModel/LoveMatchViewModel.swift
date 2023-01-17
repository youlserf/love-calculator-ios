//
//  LoveMatchViewModel.swift
//  LoveMatch
//
//  Created by youlserf on 16/01/23.
//

import Foundation

final class LoveMatchViewModel: ObservableObject {
    
    @Published var loveMatches: [LoveMatch] = []
    @Published var fname = ""
    @Published var sname = ""
    
    func getLoveMatch() {

        let newFname = fname.replacingOccurrences(of: " ", with: "")
        
        let newSname =  sname.replacingOccurrences(of: " ", with: "")
        
        
        
            let headers = [
                "X-RapidAPI-Key": "your key",
                "X-RapidAPI-Host": "love-calculator.p.rapidapi.com"
            ]
            
            let url = "https://love-calculator.p.rapidapi.com/getPercentage?sname=\(newSname)&fname=\(newFname)"
            let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                                    cachePolicy: .useProtocolCachePolicy,
                                                timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if let error = error {
                    print(error)
                } else {
                    if let jsonData = data,
                       let json = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any],
                       let fname = json["fname"] as? String,
                       let sname = json["sname"] as? String,
                       let percentage = json["percentage"] as? String,
                       let result = json["result"] as? String {
                        
                        let loveMatch = LoveMatch(id: UUID(), fname: fname, sname: sname, percentage: percentage, result: result)
                        self.loveMatches.append(loveMatch)
                    }
                }
            })
            
            dataTask.resume()
    }
    func deleteItem(at indexSet: IndexSet) {
        loveMatches.remove(atOffsets: indexSet)
    }
    func deleteAllMatches() {
        loveMatches.removeAll()
    }
}
