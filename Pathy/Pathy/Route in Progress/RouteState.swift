//
//  RouteState.swift
//  Pathy
//
//  Created by Mason Drabik on 2/27/24.
//

import Foundation

enum RouteState: Equatable {
    case notStarted
    case inProgress(startTime: Date)
    case ended(startTime: Date, endTime: Date)
}
