//
//  CheckboxView.swift
//  CheckboxList
//
//  Created by Serge Sinkevych on 11/18/23.
//

import SwiftUI

struct SelectableView: View {
    private struct Constants {
        static let selectedImageName = "checkmark.square.fill"
        static let imageName = "square"
        static let selectedFont = Font.system(size: 18, weight: .medium)
        static let font = Font.system(size: 18, weight: .regular)
        static let checkboxColor = Color(red: 0.25, green: 0.25, blue: 0.25)
        static let checkboxSize = CGSizeMake(25, 25)
    }
     
    @ObservedObject var viewModel: CheckboxViewModel
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: viewModel.isChecked ? Constants.selectedImageName : Constants.imageName)
                .foregroundColor(Constants.checkboxColor)
                .frame(width: Constants.checkboxSize.width, height: Constants.checkboxSize.height)
            Text(viewModel.title)
                .font(viewModel.isChecked ? Constants.selectedFont : Constants.font)
                .foregroundColor(Constants.checkboxColor)
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
