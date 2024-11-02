//
//  DetailView.swift
//  HeroWiki
//
//  Created by AudyDev on 1/11/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    let idHero:String
    
    @State var viewModel = DetailVM()
    
    var body: some View {
        ScrollView{
            TitleDetail(title: viewModel.superhero?.name ?? "")
            HStack{
                WebImage(url: URL(string: viewModel.superhero?.image.url ?? ""))
                            .resizable()
                            .indicator(.activity)
                            .border(.textTitleApp, width: 3)
                            .frame(width: 105)
                VStack(spacing:5) {
                    PowerstatsField(
                        title: "Inteligencia",
                        value: viewModel.superhero?.powerstats.intelligence ?? "0",
                        color: .blue.opacity(0.80)
                    )
                    PowerstatsField(
                        title: "Fuerza",
                        value: viewModel.superhero?.powerstats.strength ?? "0",
                        color: .green.opacity(0.80)
                    )
                    PowerstatsField(
                        title: "Velocidad", 
                        value: viewModel.superhero?.powerstats.speed ?? "0",
                        color: .yellow.opacity(0.80)
                    )
                    PowerstatsField(
                        title: "Durabilidad", 
                        value: viewModel.superhero?.powerstats.durability ?? "0",
                        color: .brown.opacity(0.80)
                    )
                    PowerstatsField(
                        title: "Poder", 
                        value: viewModel.superhero?.powerstats.power ?? "0",
                        color: .red.opacity(0.80)
                    )
                    PowerstatsField(
                        title: "Combate", 
                        value: viewModel.superhero?.powerstats.combat ?? "0",
                        color: .purple.opacity(0.80)
                    )
                }.frame(maxWidth: .infinity, maxHeight: 170)
                    .foregroundColor(.backgroundApp)
                    .padding(6)
                    .border(.textTitleApp, width: 3)
            }.frame(maxWidth: .infinity, maxHeight: 170)

            let biography = viewModel.superhero?.biography
            let diccBiography: [(String, String)] = [
                ("Nombre", biography?.fullName ?? ""),
                ("Alter egos", biography?.alterEgos ?? ""),
                ("Alias", biography?.aliases.joined(separator: ", ") ?? ""),
                ("Nacimiento", biography?.placeOfBirth ?? ""),
                ("Aparicion", biography?.firstAppearance ?? ""),
                ("Editor", biography?.publisher ?? ""),
                ("Alineacion", biography?.alignment ?? "")
            ]
            FrameDetail(title: "Biografia", diccionary: diccBiography)
            
            let appearances = viewModel.superhero?.appearance
            let diccAppearances: [(String, String)] = [
                ("Genero", appearances?.gender ?? ""),
                ("Raza", appearances?.race ?? ""),
                ("Altura", appearances?.height.joined(separator: " // ") ?? ""),
                ("Peso", appearances?.weight.joined(separator: " // ") ?? ""),
                ("Color ojos", appearances?.eyeColor ?? ""),
                ("Color pelo", appearances?.hairColor ?? "")
            ]
            FrameDetail(title: "Apariencia", diccionary: diccAppearances)
            
            let work = viewModel.superhero?.work
            let diccWork: [(String, String)] = [
                ("Ocupacion", work?.occupation ?? ""),
                ("Base", work?.base ?? "")
            ]
            FrameDetail(title: "Trabajo", diccionary: diccWork)

            let connections = viewModel.superhero?.connections
            let diccConnections: [(String, String)] = [
                ("Afiliación", connections?.groupAffiliation ?? ""),
                ("Parientes", connections?.relatives ?? "")
            ]
            FrameDetail(title: "Conexiones", diccionary: diccConnections)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundApp)
            .padding(8)
        .onAppear(perform: {
            Task{
                await viewModel.getHeroById(id: idHero)
            }
        })
    }
}

#Preview {
    DetailView(idHero: "1")
}

#Preview {
    DetailView(idHero: "1").preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
