//
//  NavigationBar.swift
//  iTunesApp
//
//  Created by Dev on 12.10.22.
//

import SwiftUI

struct NavigationBar: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var title: String? = ""
    
    var body: some View {
        VStack{
            if let title = title, !title.isEmpty {
                Text(title)
                    .font(.largeTitle)
                    .foregroundColor(.fontPrimary)
            }
            
            HStack {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .imageScale(.large)
                        .foregroundColor(.fontPrimary)
                }
                .padding(.bottom)
                .padding(.leading)
                
                Spacer()

            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
        .background(Color.bg)
        
        
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
            .background(Color.bg)
    }
}
