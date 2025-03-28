//
//  ContentView.swift
//  ContactList
//
//  Created by Aslan  on 28.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var movies = [
        MovieList(name: "Baywatch", image: "baywatch", description: "Группа пляжных спасателей работает на побережье Тихого океана. Они всегда находятся на своем посту и охраняют отдыхающих от несчастных случаев на воде."), MovieList(name: "Hangover", image: "hangover", description: "Незабываемый мальчишник в Вегасе."),
        MovieList(name: "Central Intelligence", image: "shpion", description: "От лайка в соцсети до спасения мира — один шаг. Сегодня ты френдишь бывшего одноклассника, а завтра — он тащит тебя под пули"),
        MovieList(name: "Tag", image: "tag", description: "Каждый год в течение месяца пятеро друзей участвуют в беспощадно навороченной версии игры в кошки-мышки.")
    ]
    @State private var descriptions = [
        MovieDescriptions(name: "Baywatch", image: "baywatch", descriptions: "«Спасатели Малибу» (2017) — комедийный боевик о команде пляжных спасателей во главе с Митчем Бьюкененом (Дуэйн Джонсон), которые расследуют преступный заговор, угрожающий их побережью. Вместе с новичком Мэттом Броди (Зак Эфрон) они противостоят наркоторговке Виктории Лидс.", rating: "IMDb: 5,5/10"),
        MovieDescriptions(name: "Hangover", image: "hangover", descriptions: "​«Мальчишник в Вегасе» (2009) — комедия о трёх друзьях, которые после бурной вечеринки в Лас-Вегасе пытаются вспомнить события ночи и найти пропавшего жениха.", rating: "IMDb: 7,9/10"),
        MovieDescriptions(name: "Central Intelligence", image: "shpion", descriptions: "«Полтора шпиона» (2016) — комедийный боевик о бухгалтере Кэлвине Джойнере (Кевин Харт), который воссоединяется с бывшим одноклассником Бобом Стоуном (Дуэйн Джонсон), ныне агентом ЦРУ, и втягивается в шпионскую операцию.​", rating: "IMDb: 6,3/10"),
        MovieDescriptions(name: "Tag", image: "tag", descriptions: "«Ты водишь!» (2018) — комедия о пятерых друзьях, которые ежегодно в течение месяца играют в экстремальную версию салок, рискуя всем ради победы. В этом году игра совпадает со свадьбой единственного непобежденного участника, что делает его главной мишенью.​", rating: "IMDb: 6,8/10​")
    ]
    @State private var showAddMovie = false
    
    var body: some View {
            NavigationStack {
                List(descriptions) { movie in
                    NavigationLink(destination: descriptionsView(movie: movie)) {
                        cell(movies: movie)
                    }
                }
                .navigationTitle("Comedy movies")
                .toolbar {
                                ToolbarItem(placement: .topBarTrailing) {
                                    Button(action: {
                                        showAddMovie.toggle() 
                                    }) {
                                        Image(systemName: "plus")
                                    }
                                }
                            }
                            .sheet(isPresented: $showAddMovie) {
                                AddMovieView(descriptions: $descriptions)
                            }
            }
    }
    func deleteItems(at offsets: IndexSet){
        movies.remove(atOffsets:offsets)
    }
}
struct MovieView: View {
    var item: String
    var body: some View {
        Text("\(item)")
    }
}
struct MovieDescriptions: Identifiable{
    var id = UUID()
    var name: String
    var image: String
    var descriptions: String
    var rating: String
}

struct MovieList: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var description: String
}
#Preview {
    ContentView()
}
