//
//  EmotionOfTheDayCreate.swift
//  TiMeFront
//
//  Created by Thibault on 08/10/2025.
//

import Foundation

public struct EmotionOfTheDayCreate: Codable, Sendable {
    public let date: Date
    public let userID: UUID
    public let emotionID: UUID

    public init(date:Date ,userID: UUID, emotionID: UUID) {
        self.date = Date()
        self.userID = userID
        self.emotionID = emotionID
    }
}
