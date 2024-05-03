//
//  ChoresView.swift
//  AmplifyAPI
//
//  Created by John G on 03/05/2024.
//

import SwiftUI
import Amplify

struct ChoresView: View {
    
    @StateObject var viewModel: ChoresView.ViewModel = .init()
    
    var body: some View {
        NavigationView {
            ZStack{
                List(viewModel.chores) {chore in
                    VStack{Text(chore.name)
                        Text(String(describing: chore.dueDate))
                    }
                }
                Button("Poutsos") {Task {await viewModel.addChore()}}
            }
                .navigationTitle("Chores")
            
        
//        .onAppear(perform: viewModel.getChores)
        }
        .onAppear {
            Task {
                await viewModel.getChores()
            }
            }
        
            
    }
}

extension ChoresView {
    class ViewModel: ObservableObject {
        @Published var chores: [Chore] = []
        
//        func getChores() {
//            Amplify.DataStore.query(Chore.self) {result in
//                switch result {
//                case .success(let chores):
//                    self?.chores = chores
//                case .failure(let error):
//                    print(error)
//                }}
//        }
        
        func getChores() async {
            do {
                let chores = try await Amplify.DataStore.query(Chore.self)
                DispatchQueue.main.async { [weak self] in
                    self?.chores = chores}
            } catch {
                print("Failed to fetch chores: \(error)")
            }
        }
        
//        func addChore() {
//            let newChore = Chore(name: UUID().uuidString, dueDate: .init(.now.addingTimeInterval(2000)))
//            
//            Amplify.DataStore.save(newChore) {result in
//                switch result {
//                case .success(savedChore):
//                    print("Saved chore: \(savedChore.id)")
//                    self?.getChores()
//                case .failure(let error):
//                    print(error)
//                }}
//        }
        
        func addChore() async {
            let newChore = Chore(name: UUID().uuidString, dueDate: .init(.now.addingTimeInterval(2000)))
            
            do {
                let savedChore = try await Amplify.DataStore.save(newChore)
                print("Saved chore: \(savedChore.id)")
                await getChores()
            } catch {
                print("Error saving chore: \(error)")
            }
            
        }
        
    }
}

#Preview {
    ChoresView()
}

