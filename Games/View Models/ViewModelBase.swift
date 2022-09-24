//
//  ViewModelBase.swift
//  Games
//
//  Created by HIS nutech on 12/09/22.
//

import Foundation

enum LoadingState {
    case loading, success, failed, none
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
