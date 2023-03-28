//
//  WatchClient.swift
//  Wrist
//
//  Created by 라주영 on 2023/03/28.
//

import ComposableArchitecture
import Foundation
import XCTestDynamicOverlay

struct WatchSearch: Decodable, Equatable, Sendable {
    var results: [Result]
    
    struct Result: Decodable, Equatable, Identifiable, Sendable {
        var id: String
        var name: String
        var dimension: Float16
        var thickness: Float16
        var movement: String
        var glass: String
        var weight: Float16
        var rugDistance: UInt8
    }
}


struct WatchClient {
    var productURL: @Sendable (WatchSearch.Result) async throws -> URL
    var watchSearch: @Sendable (String) async throws -> WatchSearch
}

//extension WatchSearch: TestDependencyKey {
//    static var testValue = Self(
//        productURL: unimplemented("\(Self.self).productURL"),
//        watchSearch: unimplemented("\(Self.self).watchSearch")
//    )
//    
//    static let previewValue = Self(
//        productURL: { $0 },
//        watchSearch: { $0 }
//    )
//}
//
//extension DependencyValues {
//    var watchClient: WatchClient {
//        get { self[WatchClient.self] }
//        set { self[WatchClient.self] = newValue }
//    }
//}
