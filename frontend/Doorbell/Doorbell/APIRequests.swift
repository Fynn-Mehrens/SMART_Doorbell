//
//  APIRequests.swift
//  Doorbell
//
//  Created by Cora Bleier on 20.01.23.
//

import Foundation

public func get(_ completion: @escaping ([DoorbellRing])->Void) {
    let url: URL = URL(string: "http://192.168.178.31:5000/doorbell_notification/1")!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    let session = URLSession.shared
    let decoder = JSONDecoder()
//    request.addValue("application/json", forHTTPHeaderField: "accept")
    
    let task = session.dataTask(with: request) { data, response, error in
        if let data = data {
            do {
                var decoded: [DoorbellRing] = []
                
                decoded = try decoder.decode([DoorbellRing].self, from: data)
                
                DispatchQueue.main.async {
                    completion(decoded)
                }
            } catch {
                print("\(error)")
            }
        }
    }
    task.resume()
}

