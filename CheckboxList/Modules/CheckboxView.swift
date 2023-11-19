//
//  CheckboxView.swift
//  CheckboxList
//
//  Created by Serge Sinkevych on 11/18/23.
//

import SwiftUI

struct SelectableView: View {
    private struct Constants {
        static let selectedImageName = "checkmark.square"
        static let imageName = "square"
        static let selectedFont = Font.system(size: 18, weight: .medium)
        static let font = Font.system(size: 16, weight: .regular)
    }
     
    @ObservedObject var viewModel: CheckboxViewModel
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: viewModel.isChecked ? Constants.selectedImageName : Constants.imageName)
                .foregroundColor(.green)
                .frame(width: 25, height: 25)
            Text(viewModel.title)
                .font(viewModel.isChecked ? Constants.selectedFont : Constants.font)
            Spacer()
        }
        .padding()
        .onTapGesture {
            viewModel.isChecked.toggle()
        }
    }
}

#Preview {
    SelectableView(viewModel: .init(title: "Text"))
}
