//
//  MemeCoinSession.swift
//  Avala
//
//  Created by qianru zhang on 2024/3/13.
//

import SwiftUI

// Define your view model
class MemeCoinViewModel: ObservableObject {
    @Published var memeCoinData: [MemeCoin] = [] // Assuming MemeCoin is a struct representing meme coin data
    
    func fetchMemeCoinData() {
        let headers = [
            "X-RapidAPI-Key": "d25eb9279amshfda026b08d9a984p1ea465jsn603867ae7669",
            "X-RapidAPI-Host": "coinpaprika1.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://coinpaprika1.p.rapidapi.com/tickers")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let memeSet : Set<String> = ["DOGE", "WIF", "BONK", "SHIB", "FLOKI", "CORGIAI", "BOME", "MEME", "BABYDOGE", "COQ"]
        let dataTask = session.dataTask(with: request as URLRequest) { [weak self] (data, response, error) in
            guard let self = self else { return }
            
            if let error = error {
                print("Error: \(error)")
            } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let coinData = try decoder.decode([MemeCoin].self, from: data)
                        let memeCoins = coinData.filter { memeSet.contains($0.symbol ) || $0.name == "Pepe"  }
                        DispatchQueue.main.async {
                            self.memeCoinData = memeCoins
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            }
        }
        dataTask.resume()
    }
}


struct MemeCoin: Codable, Hashable {
    let id: String
    let name: String
    let symbol: String
    let quotes: Quote?
}

struct Quote: Codable, Hashable {
    let USD: USDQuote
}

struct USDQuote: Codable, Hashable {
    let price: Double
    let marketCap: Double
    
    enum CodingKeys: String, CodingKey {
        case price = "price"
        case marketCap = "market_cap"
    }
}


