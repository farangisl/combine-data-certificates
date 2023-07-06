//
//  NotificationsRow.swift
//  SwiftUICombineAndData
//
//  Created by Махмадёрова Фарангис Шухратовна on 18.04.2023.
//

import SwiftUI

struct NotificationsRow: View {
    @State private var subscribed: Bool = true
    
    var body: some View {
        Toggle(isOn: $subscribed, label: {
            HStack(spacing: 12) {
                GradientIcon(icon: "bell.fill")
                
                VStack(alignment: .leading) {
                    Text("Notify me of new content")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Text("Max once a week.")
                        .font(.caption2)
                        .opacity(0.7)
                    
                    Link(destination: URL(string: UIApplication.openSettingsURLString)!, label: {
                        Text("Open Settings")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    })
                    
                }
            }
        })
        .toggleStyle(SwitchToggleStyle(tint: Color(#colorLiteral(red: 0.4212473631, green: 0.4374457002, blue: 0.8710209727, alpha: 1))))
    }
}

struct NotificationsRow_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsRow()
    }
}
