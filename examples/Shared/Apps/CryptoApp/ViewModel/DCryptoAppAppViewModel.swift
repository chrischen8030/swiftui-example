//
//  AppViewModel.swift
//  CryptoApp (iOS)
//
//  Created by Balaji on 10/04/22.
//

import SwiftUI
import _Concurrency
class DCryptoAppAppViewModel: ObservableObject {
    @Published var coins: [CryptoAppAppCryptoModel]?
    @Published var currentCoin: CryptoAppAppCryptoModel?
    
    init(){
//        Task(context: NSManagedObjectContext)
        Task {
            do{
                try await fetchCryptoData()
            }catch{
                // HANDLE ERROR
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: Fetching Crypto Data
    func fetchCryptoData()async throws{
        // MARK: Using Latest Async/Await
        guard let url = cryptoAppAppurl else{return}
        let session = URLSession.shared
        
        let response = try await session.data(from: url)
        let jsonData = try JSONDecoder().decode([CryptoAppAppCryptoModel].self, from: response.0)
        
        // Alternative For DispatchQueue Main
        await MainActor.run(body: {
            self.coins = jsonData
            if let firstCoin = jsonData.first{
                self.currentCoin = firstCoin
            }
        })
    }
}
