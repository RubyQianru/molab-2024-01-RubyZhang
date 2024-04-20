//
//  ListSort.swift
//  Avala
//
//  Created by qianru zhang on 2024/4/12.
//

import Foundation
import SwiftUI

func sortByFollowersCount(_ coins: [CoinFollower]) -> [CoinFollower] {
    return coins.sorted { $0.followerCount > $1.followerCount }
}

func sortByName(_ coins: [CoinFollower]) -> [CoinFollower] {
    return coins.sorted { $0.name.first ?? Character("") < $1.name.first ?? Character("") }
}

func sortByGrowth(_ coins: [CoinFollower]) -> [CoinFollower] {
    return coins.sorted { $0.diff > $1.diff}
}


