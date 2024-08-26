//
//  User.swift
//  NonHybird
//
//  Created by Simon Bogutzky on 27.08.24.
//

import Foundation

final class User: ObservableObject {
    public static let shared = User()

    @Published var isLoggedIn: Bool = false
}
