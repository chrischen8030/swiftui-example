//
//  DraggableView.swift
//  examples (iOS)
//
//  Created by 陳　愛 on 2023/04/04.
//

import SwiftUI

struct DraggableView<Content:View>: View {
    @GestureState private var dragOffset: CGSize = .zero
    let content: () -> Content
    typealias Content = _ConditionalContent<Image, TextField<Text>>

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        content()
            .offset(dragOffset)
            .gesture(
                DragGesture()
                    .updating($dragOffset) { value, state, transaction in
                        state = value.translation
                    }
            )
    }
}

struct DraggableViewContentView: View {
    @State private var textInput: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                DraggableView {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                }

                DraggableView {
                    TextField("请输入文字", text: $textInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(height: 100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
            }

            HStack {
                DraggableView {
                    TextField("请输入文字", text: $textInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(height: 100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }

                DraggableView {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                }
            }
        }
        .padding()
    }
}

struct DraggableViewContentView_Previews: PreviewProvider {
    static var previews: some View {
        DraggableViewContentView()
    }
}
