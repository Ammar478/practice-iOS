//
//  Task.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 22/05/2024.
//

import Foundation

extension Task where Success == Never , Failure == Never {
    static func sleep(timeInterval:TimeInterval) async throws {
        let duration = Measurement(value: timeInterval, unit: UnitDuration.seconds)
            .converted(to: UnitDuration.nanoseconds)
            .value
        try await Task.sleep(nanoseconds: UInt64(duration))
    }
}
