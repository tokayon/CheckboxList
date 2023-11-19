//
//  ListView.swift
//  CheckboxList
//
//  Created by Serge Sinkevych on 11/18/23.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        VStack {
            ForEach(viewModel.selectableValues, id: \.self) { selectableValue in
                SelectableView(viewModel: selectableValue)
            }
        }
        .padding()
    }
}

#Preview {
    return ListView(viewModel: .init(values: ["1", "2", "3"], exclusiveValue: "3"))
}
