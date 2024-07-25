//
//  SearchJokeModel.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 7/25/24.
//

import Foundation

struct SearchJokeModel: Codable{
    let result: [JokesModel]
    let total: Int
}
