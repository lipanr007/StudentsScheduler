//
//  TitleView.swift
//  StudentsScheduler
//
//  Created by rares on 22.03.2023.
//

import SwiftUI

struct TitleView: View {
    @Environment(\.colorScheme) var colorScheme
    
    private var colors: [Color] = [.purple.opacity(0.5),
                                   .blue.opacity(0.5),
                                   .red.opacity(0.2)]
    
    @State private var offset = 0.0
    @State private var navigationBarHeight: CGFloat = 0
    
    var body: some View {
        ZStack {
            background
            upperTail
            lowerTail
            appTitle
        }
        .onAppear {
            withAnimation(.linear(duration: 0.75).repeatForever(autoreverses: false)) {
                offset = 0.5
            }
        }
        .frame(height: navigationBarHeight)
        .background(GeometryReader { geometry in
            Color.clear
                .onAppear {
                    navigationBarHeight = geometry.safeAreaInsets.top + 44
                }
        })
    }
    
    var appTitle: some View {
        Text("Student's scheduler")
            .bold()
            .foregroundStyle(LinearGradient(gradient: Gradient(colors: colors),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing))
    }
    
    var background: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .foregroundColor(colorScheme == .light ? .gray.opacity(0.1) : .white)
            .frame(width: 200, height: 50)
    }
    
    var upperTail: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .trim(from: 0.25 + offset, to: 0.5 + offset)
            .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round))
            .frame(width: 200, height: 50)
    }
    
    var lowerTail: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .trim(from: 0.25 + offset, to: 0.5 + offset)
            .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round))
            .rotation(Angle(degrees: 180))
            .frame(width: 200, height: 50)
    }
}


struct Title_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
