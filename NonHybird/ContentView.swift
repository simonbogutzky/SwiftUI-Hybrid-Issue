//
//  ContentView.swift
//  NonHybird
//
//  Created by Simon Bogutzky on 27.08.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem { Text("Main") }
                .environmentObject(User.shared)
            SettingsView()
                .tabItem { Text("Settings") }
                .environmentObject(User.shared)
                .onAppear {
                    print("--> SettingsView appear")
                }
                .onDisappear {
                    print("--> SettingsView disappear")
                }
        }
    }
}

#Preview("ContentView") {
    ContentView()
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

#Preview("MainView") {
    MainView()
        .environmentObject(User())
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

#Preview("EntryView") {
    EntryView()
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

#Preview("Overview") {
    Overview()
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
    }
}

#Preview("SettingsView") {
    SettingsView()
        .environmentObject(User())
}
