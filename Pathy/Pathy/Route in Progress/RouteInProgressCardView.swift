//
//  RouteInProgressCardView.swift
//  Pathy
//
//  Created by Mason Drabik on 2/27/24.
//

import SwiftUI

struct RouteInProgressCardView: View {
    @ObservedObject var vm: RouteInProgressViewModel
    let startStopSaveAction: () -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            if vm.routeState != .notStarted {
                metadata
                startStopButton
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
            } else {
                startStopButton
            }
        }
        .frame(width: 361)
        .background(.thickMaterial, in: .rect(cornerRadius: 32))
    }
    
    @ViewBuilder
    private var metadata: some View {
        // - You'll need to add some VStacks/HStacks and modifiers to the elements
        HStack(alignment: .firstTextBaseline) {
            VStack {
                HStack(alignment: .firstTextBaseline) {
                    Text(vm.formattedDistance)
                        .monospacedDigit()
                        .contentTransition(.numericText())
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .fontDesign(.rounded)
                    Text("mi")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .fontDesign(.rounded)
                }
                Text("Distance")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fontDesign(.default)
                    .padding(.trailing, 45)
            }
            Spacer()
            VStack {
                timeElapsed
                Text("Duration")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fontDesign(.default)
            }
        }
        .padding(.top, 10)
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder
    private var timeElapsed: some View {
        Group {
            switch vm.routeState {
            case .notStarted:
                EmptyView()
            case .inProgress(let startTime):
                Text(startTime, style: .timer)
            case .ended(let startTime, let endTime):
                Text(vm.formatDuration(startTime: startTime, endTime: endTime))
            }
        }
       
        .monospacedDigit()
        .transition(.scale(0, anchor: .trailing).combined(with: .opacity))
        .font(.largeTitle)
        .fontWeight(.semibold)
        .foregroundColor(.primary)
        .fontDesign(.rounded)
    }
    
    @ViewBuilder
    private var startStopButton: some View {
        Button {
            startStopSaveAction()
        } label: {
            let c: Color = switch vm.routeState {
            case .notStarted: .green
            case .inProgress: .red
            case .ended: .blue
            }
            
            let buttonLabel: String = switch vm.routeState {
            case .notStarted: "Start"
            case .inProgress: "Stop"
            case .ended: "Save"
            }
            
            if vm.routeState == .notStarted {
                Text(buttonLabel)
                    .frame(maxWidth: .infinity)
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(width: 361, height: 57)
                    .foregroundColor(.white)
                    .background(c, in: .rect(cornerRadius: 16))
            } else {
                Text(buttonLabel)
                    .frame(maxWidth: .infinity)
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(width: 329, height: 57)
                    .foregroundColor(.white)
                    .background(c, in: .rect(cornerRadius: 16))
            }
        }
    }
}

#Preview {
    Group {
        RouteInProgressCardView(vm: RouteInProgressViewModel(), startStopSaveAction: {})
    }
}
