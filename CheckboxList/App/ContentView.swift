//
//  ContentView.swift
//  CheckboxList
//
//  Created by Serge Sinkevych on 11/18/23.
//

import SwiftUI

struct ContentView: View {
    var viewModel: ListViewModel
    
    var body: some View {
        VStack {
            ListView(viewModel: viewModel)
        }
        .padding()
    }
}

extension ContentView {
    static func stub() -> ContentView {
        ContentView(viewModel: .init(values: ["Orange", "Apple", "Cherry", "None of the above"], exclusiveValue: "None of the above"))
    }
}

#Preview {
    ContentView.stub()
}
