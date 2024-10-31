//
//  HomeView.swift
//  HeroWiki
//
//  Created by AudyDev on 31/10/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var viewModel = HomeVM()
    @State var superhero = ""
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Super Hero Wiki")
                    .font(.custom("BadaBoomBB", size: 46))
                TextField("", text: $superhero, prompt:
                            Text("Busca tu superheroe...").font(.custom("KomikaAxis", size: 13)).bold()
                )
                .font(.custom("KomikaAxis", size: 13))
                .foregroundColor(.textTitleApp)
                .bold()
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal, 24)
                .autocorrectionDisabled()
                .onSubmit {
                    Task{
                        await viewModel.getHeroes(query: superhero)
                    }
                }.alert(isPresented: $viewModel.showError) {
                    return Alert(
                        title: Text("Se ha producido un error"),
                        message: Text(viewModel.errorMessage)
                    )
                }
                if (viewModel.isLoading){
                    ProgressView()
                        .tint(.textTitleApp)
                        .padding(.top, 12)
                }
                
                List(viewModel.superheroes?.results ?? []){ superhero in
                    ZStack{
                        SuperHeroItem(superhero: superhero)
                        NavigationLink(destination: {}) {EmptyView()}.opacity(0)
                    }.listRowBackground(Color.backgroundApp)
                }.listStyle(.plain)
                    .background(.backgroundApp)
                
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.vertical)
                .background(.backgroundApp)
            
        }
    }
}

#Preview {
    HomeView()
}
#Preview {
    HomeView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
