//
//  ContentView.swift
//  ToughWorkOut
//
//  Created by Zheng Kanyan on 2020/9/9.
//  Copyright © 2020 Zheng Kanyan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: SystemSoundLibraryView()) {
                Text("系统声音Lib")
            }
            .navigationBarTitle("硬派")
        }
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .light)
    }
}
