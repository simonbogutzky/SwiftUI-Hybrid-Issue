//
//  MainViewController.swift
//  Hybrid
//
//  Created by Simon Bogutzky on 27.08.24.
//

import SwiftUI
import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // Create the SwiftUI view.
        let mainView = MainView()
            .environmentObject(User.shared)

        // Embed the SwiftUI view in a UIHostingController.
        let hostingController = UIHostingController(rootView: mainView)

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

struct MainView: View {
    @EnvironmentObject var user: User

    var body: some View {
        ZStack {
            if user.isLoggedIn {
                Overview()
                    .onAppear {
                        print("--> Overview appear")
                    }
                    .onDisappear {
                        print("--> Overview disappear")
                    }

            } else {
                EntryView()
                    .onAppear {
                        print("--> EntryView appear")
                    }
                    .onDisappear {
                        print("--> EntryView disappear")
                    }
            }
        }
        .padding()
    }
}

struct EntryView: View {
    var body: some View {
        VStack {
            Image(systemName: "xmark")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Entry")
        }
        .padding()
    }
}

struct Overview: View {
    var body: some View {
        VStack {
            Image(systemName: "list.bullet")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Overview")
        }
        .padding()
    }
}
