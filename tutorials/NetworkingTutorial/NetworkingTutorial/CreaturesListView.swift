//
//  CreaturesListView.swift
//  NetworkingTutorial
//
//  Created by Mason Drabik on 2/18/24.
//

import SwiftUI

struct CreaturesListView: View {
    @StateObject var creaturesVM = CreaturesViewModel()

    var body: some View {
        NavigationStack {
            List(creaturesVM.creaturesArray, id: \.self, rowContent: {
                creature in
                Text(creature.name)
                    .font(.title2)
            })
            .listStyle(.plain)
            .navigationTitle("Pokemon")
        }
        .task {
            await creaturesVM.getData()
        }
    }
}

#Preview {
    CreaturesListView()
}
