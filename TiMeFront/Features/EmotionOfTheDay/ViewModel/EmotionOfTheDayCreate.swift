//
//  EmotionOfTheDayCreate.swift
//  YourProjectName
//
//  Created by YourName on 2025-10-09.
//

import Foundation

public struct EmotionOfTheDayCreate: Codable, Sendable {
    public let userID: UUID
    public let emotionID: UUID

    public init(userID: UUID, emotionID: UUID) {
        self.userID = userID
        self.emotionID = emotionID
    }
}
