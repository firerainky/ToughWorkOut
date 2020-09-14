//
//  SystemSoundLibraryView.swift
//  ToughWorkOut
//
//  Created by Zheng Kanyan on 2020/9/9.
//  Copyright © 2020 Zheng Kanyan. All rights reserved.
//

import SwiftUI
import AVFoundation

struct SystemSoundItem {
    var id: Int
    var name: String
}

struct SystemSoundLibraryView: View {
    var readSystemSounds: [SystemSoundItem] {
        var result = [SystemSoundItem]()
        let path = Bundle.main.path(forResource:"SystemSounds", ofType:"txt")
        let text = try! String(contentsOfFile:path!, encoding: String.Encoding.utf8)
        let strings = text.split(separator: Character("\n"))
        print(strings)
        for string in strings {
            let item = string.components(separatedBy: .whitespaces)
                .filter { !$0.isEmpty }
            result.append(SystemSoundItem(id: Int(item[0]) ?? -1, name: item[1]))
        }
        return result
    }
    
    var body: some View {
        VStack {
            List(readSystemSounds, id: \.id) { systemSoundItem in
                Text("\(systemSoundItem.id) - \(systemSoundItem.name)").onTapGesture {
                    AudioServicesPlayAlertSound(SystemSoundID(systemSoundItem.id))
                }
            }
        }
    }
}

struct SystemSoundLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        SystemSoundLibraryView()
    }
}
