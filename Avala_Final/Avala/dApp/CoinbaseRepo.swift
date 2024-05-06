//
//  CoinbaseRepo.swift
//  Avala
//
//  Created by qianru zhang on 2024/3/28.
//

import Foundation
import CoinbaseWalletSDK

class CoinbaseRepo: ObservableObject {
    @Published var ethAddress = ""

    func connectToCoinbase() async throws {
        if !CoinbaseWalletSDK.isConfigured {
            print("configuring")
            CoinbaseWalletSDK.configure(callback: URL(string: "avala://")!)
        }

        let cbwallet = CoinbaseWalletSDK.shared
        cbwallet.resetSession()

        do {
            try await withCheckedThrowingContinuation { continuation in
                DispatchQueue.main.async {
                    cbwallet.initiateHandshake(
                        initialActions: [
                            Action(jsonRpc: .eth_requestAccounts)
                        ]
                    ) { result, account in
                        switch result {
                        case .success:
                            if let account {
                                self.ethAddress = account.address
                                print("Successfully retrieve address", self.ethAddress)
                                continuation.resume(returning: ())
                            } else {
                                let error = NSError(domain: "error.CoinbaseSDK", code: 999, userInfo: [NSLocalizedDescriptionKey: "Coinbase wallet is not available"])
                                print("Cannot retrieve account",error)
                                continuation.resume(throwing: error)
                            }

                        case .failure(let error):
                            print("Cannot connect to coinbase",error)
                            continuation.resume(throwing: error)
                        }
                    }
                }
            }
        } catch {
            print("Line 50",error)
            throw error
        }
    }
}
