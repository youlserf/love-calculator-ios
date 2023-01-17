//
//  ContentView.swift
//  LoveMatch
//
//  Created by youlserf on 16/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = LoveMatchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                InputView(placeHolder: "name one", name: $viewModel.fname)
                InputView(placeHolder: "name two", name: $viewModel.sname)
                
                Button(action: {
                    self.viewModel.getLoveMatch()
                }) {
                    Text("Get Love Match")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                List {
                    ForEach(viewModel.loveMatches.reversed()){ loveMatch in
                        MatchView(loveMatch: loveMatch)
                    }
                    .onDelete{ indexSet in
                        self.viewModel.deleteItem(at: indexSet)}
                    .padding(0)
            
                }
                
                
            }
            .padding()
            .navigationTitle("Find your real love")
            .navigationBarItems(trailing:
                           Button(action: viewModel.deleteAllMatches) {
                               Image(systemName: "trash")
                                
                           }
            )
        }
       
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




