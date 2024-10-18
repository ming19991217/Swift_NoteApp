//
//  ContentView.swift
//  Keep-Remake
//
//  Created by Ming on 2024/10/17.
//

import SwiftUI

struct MainView:View
{
    @State private var savedTexts: [String] = ["哈嘍","你們好 這裡是台灣🇹🇼"]
    @State private var showingAddView = false
    
    @State private var showingDetailView = false
    
    @State private var showPreview = false
    
    
    var body: some View
    {
        NavigationView {
            VStack {
                Spacer()
                List {
                    ForEach(savedTexts,id:\.self) { text in
                        NavigationLink(destination:DetailView(text:text))
                        {
                            Text(text)
                                .font(.headline)
                                .padding()
                        }
                        .onLongPressGesture{
                            withAnimation{showPreview.toggle()}
                        }
                        .overlay (
                            Group{
                                if showPreview {
                                    Image(systemName: "plus")
                                        .font(.title)
                                }
                                
                            }
                        )
                            
                    }
                }
            }
            .navigationTitle("文字列表")
            .navigationBarItems(trailing: Button(action: { showingAddView = true })
            {
                Text("新增")
                    .font(.headline)
                    .padding()
//                Image(systemName: "plus")
//                    .font(.title)
            })
            .sheet(isPresented:$showingAddView)
            {
                AddTextView(savedTexts:$savedTexts)
            }
        }
    }
    
}

struct AddTextView:View {
    @State private var inputText:String = ""
    @Binding var savedTexts: [String]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("新增文字")
                    .font(.title)
                    .padding()
                    
                
                TextEditor(text:$inputText)
                    .frame(height: 300)
                    .font(.footnote)
                    .padding()
                    .scrollContentBackground(.hidden)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Button(action:{
                    if inputText.isEmpty != true {
                        savedTexts.append(inputText)
                        presentationMode.wrappedValue.dismiss()
                    }
                }){
                    Text("儲存")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth:.infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                .disabled(inputText.isEmpty)
                
                Spacer()
            }
        }
        .padding()
        .navigationTitle("新增文字")
        .navigationBarItems(leading: Button("取消"){
            presentationMode.wrappedValue.dismiss()
        })
        
    }
}

struct DetailView:View
{
    var text:String
    
    var body: some View
    {
        VStack{
            Text(text)
                .font(.largeTitle)
                .padding()
            
            Spacer()
        }
        .navigationTitle("詳細內容")
    }
    
}





    #Preview {
    MainView()

    }
