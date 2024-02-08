//
//  DividerView.swift
//  Moonshot
//
//  Created by Ricardo on 26/12/23.
//

import SwiftUI

struct DividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.black).opacity(0.05)
            .padding(.vertical)
    }
}

#Preview {
    DividerView()
}
