//
//  ListViewModel.swift
//  CheckboxList
//
//  Created by Serge Sinkevych on 11/18/23.
//

import Foundation
import Combine

final class ListViewModel: ObservableObject {
    var values: [String]
    var exclusiveValue: String
    var selectableValues: [CheckboxViewModel]
    @Published var selectedValues: [String]
    private var cancellables: Set<AnyCancellable> = []
    
    init(values: [String], exclusiveValue: String) {
        self.values = values
        self.exclusiveValue = exclusiveValue
        selectableValues = values.map { .init(title: $0) }
        selectedValues = []
        setupBinding()
    }
    
    private func setupBinding() {
        selectableValues.forEach { selectableValue in
            selectableValue.$isChecked
                .receive(on: RunLoop.main)
                .sink { [weak self] isChecked in
                    self?.handle(isChecked, on: selectableValue)
                }
                .store(in: &cancellables)
        }
    }
    
    private func handle(_ isChecked: Bool, on viewModel: CheckboxViewModel) {
        if isChecked && viewModel.title == exclusiveValue {
            selectedValues = [viewModel.title]
            
            /// Uncheck selected values
            selectableValues
                .filter {
                    $0 != viewModel
                }
                .forEach {
                    $0.isChecked = false
                }
        } else if isChecked {
            selectedValues.append(viewModel.title)

            /// Uncheck exclusive value
            selectedValues = selectedValues.filter { $0 != exclusiveValue }
            selectableValues
                .filter {
                    $0.title == exclusiveValue
                }
                .forEach {
                    $0.isChecked = false
                }
        } else {
            selectedValues = selectedValues.filter { $0 != viewModel.title }
        }
    }
}
