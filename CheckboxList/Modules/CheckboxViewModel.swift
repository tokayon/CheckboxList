//
//  CheckboxViewModel.swift
//  CheckboxList
//
//  Created by Serge Sinkevych on 11/18/23.
//

import Foundation

final class CheckboxViewModel: ObservableObject {
    var title: String
    @Published var isChecked: Bool
    
    init(title: String, isChecked: Bool = false) {
        self.title = title
        self.isChecked = isChecked
    }
}

extension CheckboxViewModel: Hashable {
    static func == (lhs: CheckboxViewModel, rhs: CheckboxViewModel) -> Bool {
        lhs.title == rhs.title
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

