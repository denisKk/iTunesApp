//
//  SearchBarView.swift
//  iTunesApp
//
//  Created by Dev on 10.10.22.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searhTerm: String
    @State var isShowButton: Bool = false
    @FocusState var isFocused: Bool
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.bgSecondary)
                HStack{
                    Image(systemName:"magnifyingglass")
                        .imageScale(.large)
                        .foregroundColor(.fontSecondary)
                    TextField("", text: $searhTerm, prompt:
                                Text("...").foregroundColor(.fontSecondary)
                    )
                        .focused($isFocused)
                    Button {
                        searhTerm = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(.fontSecondary)
                    }
                    .opacity(searhTerm.isEmpty ? 0 : 1)
                }
                .padding(5)
            }
            .frame(maxHeight: 30)
            .padding(.trailing, isShowButton ? 0 : 8)
            .padding(.vertical ,3)
            
            
            if isShowButton {
                Button {
                    isFocused = false
                } label: {
                    Text("Cancel")
                        .foregroundColor(.fontSecondary)
                }
                .padding(.trailing, 16)
            }
        }
        .onChange(of: isFocused) { newValue in
            withAnimation {
                isShowButton = newValue
            }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searhTerm: .constant(""))
    }
}
