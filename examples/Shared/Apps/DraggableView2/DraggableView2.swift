//
//  Demo2.swift
//  ImageTextDemo
//
//  Created by 陳　愛 on 2023/04/04.
//

import SwiftUI
import Foundation
import Combine


enum ContentType: String, Codable {
    case image
    case text
}

struct ContentItem: Identifiable, Codable {
    let id = UUID()
    let type: ContentType
    let content: String
}


class DraggableView2Model: ObservableObject {
    @Published var contentItems: [ContentItem] = []
}

struct DraggableView2: View {
    @StateObject private var viewModel = DraggableView2Model()
    @State private var textInput = ""
    @State private var imageURL = ""
    @State private var editMode = EditMode.inactive

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.contentItems) { item in
                        if item.type == .text {
                            Text(item.content)
                        } else {
                            AsyncImage(url: URL(string: item.content))
                        }
                    }
                    .onMove(perform: move)
                }
                .environment(\.editMode, $editMode)

                VStack {
                    TextField("输入图片URL", text: $imageURL)
                    Button("添加图片") {
                        let item = ContentItem(type: .image, content: imageURL)
                        viewModel.contentItems.append(item)
                        imageURL = ""
                    }

                    TextEditor(text: $textInput)
                        .frame(height: 100)
                        .border(Color.gray, width: 1)

                    Button("添加文字") {
                        let item = ContentItem(type: .text, content: textInput)
                        viewModel.contentItems.append(item)
                        textInput = ""
                    }
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(editMode == .inactive ? "编辑" : "完成") {
                        withAnimation {
                            editMode = editMode == .inactive ? .active : .inactive
                        }
                    }
                }
            }
        }
    }

    func move(fromOffsets: IndexSet, toOffset: Int) {
        viewModel.contentItems.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        DraggableView2()
    }
}
