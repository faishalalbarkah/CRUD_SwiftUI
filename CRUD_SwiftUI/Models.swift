//
//  Models.swift
//  CRUD_SwiftUI
//
//  Created by faisalalbarkah on 14/11/22.
//

import Foundation
import SwiftUI

struct DataModel: Decodable {
    let error: Bool
    let message: String
    let data: [PostModel]
}

struct PostModel: Decodable {
    let id: Int
    let title: String
    let post: String
}
