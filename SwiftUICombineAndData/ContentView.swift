//
//  ContentView.swift
//  SwiftUICombineAndData
//
//  Created by Махмадёрова Фарангис Шухратовна on 10.04.2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var contentOffset = CGFloat(0)
    @State private var showCertificates: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                TrackableScrollView(offsetChanged: { offset in
                    contentOffset = offset.y
//                    print("contentOffset", contentOffset)
                }) {
                    content
                }

                VisualEffectBlur(blurStyle: .systemMaterial)
                    .opacity(contentOffset < -16 ? 1 : 0)
                    .animation(.easeIn)
                    .ignoresSafeArea()
                    .frame(height: 0)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .background(AccountBackground())
            .navigationBarHidden(true)
        }
        .accentColor(colorScheme == .dark ? .white : Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)))
    }
    
    var content: some View {
        VStack {
            ProfileRow()
                .onTapGesture {
                    showCertificates.toggle()
                }
            
            VStack {
                NotificationsRow()
                divider
                LiteModeRow()
            }
            .blurBackground()
            .padding(.top, 20)
            
            VStack {
                NavigationLink(destination: FAQView()) {
                    MenuRow()
                }
                
                divider
                
                NavigationLink(destination: PackagesView()) {
                    MenuRow(title: "SwiftUI Packages", leftIcon: "square.stack.3d.up.fill")
                }
                
                divider
                
                Link(destination: URL(string: "https://www.youtube.com/channel/UCTIhfOopxukTIRkbXJ3kN-g")!, label: {
                    MenuRow(title: "YouTube Channel", leftIcon: "play.rectangle.fill", rightIcon: "link")
                })

                
            }
            .blurBackground()
            .padding(.top, 20)
            
            Text("Version 1.00")
                .foregroundColor(.white.opacity(0.7))
                .padding(.top, 20)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                .font(.footnote)
        }
        .foregroundColor(.white)
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
        .sheet(isPresented: $showCertificates) {
            CertificatesView()
        }
    }
    
    var divider: some View {
        Divider().background(.white.blendMode(.overlay))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
