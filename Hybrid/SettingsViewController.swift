//
//  SettingsViewController.swift
//  Hybrid
//
//  Created by Simon Bogutzky on 27.08.24.
//

import SwiftUI
import UIKit

class SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // Create the SwiftUI view.
        let settingsView = SettingsView()
            .environmentObject(User.shared)

        // Embed the SwiftUI view in a UIHostingController.
        let hostingController = UIHostingController(rootView: settingsView)

        // Add the hosting controller's view as a child of the current view controller.
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)

        // Set constraints or frame for the SwiftUI view to position it correctly.
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

struct SettingsView: View {
    @EnvironmentObject var user: User
    var body: some View {
        VStack {
            Image(systemName: "slider.horizontal.3")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Settings")
            Toggle("Login", isOn: $user.isLoggedIn)
        }
        .padding()
        .onAppear {
            print("--> SettingsView appear")
        }
        .onDisappear {
            print("--> SettingsView disappear")
        }
    }
}
