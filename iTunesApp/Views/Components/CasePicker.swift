//
//  CasePicker.swift
//  iTunesApp
//
//  Created by Dev on 10.10.22.
//

import SwiftUI
import UIKit

struct CasePicker: View {
    
    @Binding var selectedTab: EntityType
    
    init(selectedTab: Binding<EntityType>) {
        
        self._selectedTab = selectedTab
        
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.main)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(named: "FontSecondaryColor") ?? .gray], for: .normal)
                  UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        
        UITableView.appearance().backgroundColor = .red
            UITableViewCell.appearance().backgroundColor = .red
            UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        
        Picker("Select state", selection: $selectedTab) {
            ForEach(EntityType.allCases) { item in
                Text(item.name())
                    .tag(item)
            }
        }
        .pickerStyle(.segmented)
    }
}


struct CasePicker_Previews: PreviewProvider {
    static var previews: some View {
        CasePicker(selectedTab: .constant(.all))
    }
}
