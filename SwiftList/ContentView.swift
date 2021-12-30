//
//  ContentView.swift
//  SwiftList
//
//  Created by Samuel Cardoso on 30/12/21.
//

import SwiftUI

enum Period: String, CaseIterable {
    case original = "Original trilogy"
    case prequel = "Prequel trilogy"
    case sequel = "Sequel trilogy"
    case standalone = "Standalone"
}

struct Movie: Identifiable {
    var id = UUID()
    var title: String
    var period: Period
}

struct ContentView: View {
    @State var movies = [
        Movie(title: "Episode IV - A New Hope", period: .original),
        Movie(title: "Episode V - The Empire Strikes", period: .original),
        Movie(title: "Episode VI - Return of the Jedi", period: .original),
        Movie(title: "Star Wars: The Clone Wars", period: .standalone),
        Movie(title: "Rogue One", period: .standalone),
        Movie(title: "Solo", period: .standalone),
        Movie(title: "The Mandalorian", period: .standalone)
    ]
    var body: some View {
        VStack {
            Text("Movies List")
                .font(.largeTitle)
            /*List(movies, id: \.id) { movie in
                Text(movie.title)
            }*/
            
            /*List {
                ForEach(movies, id:\.id){ movie in
                    Text(movie.title)
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        movies.remove(at: index)
                    }
                }
            }*/
            
            List {
                ForEach(Period.allCases, id: \.rawValue) { period in
                    Section(header: Text(period.rawValue)) {
                        ForEach(movies.filter { $0.period == period }) { movie in
                            VStack {
                                Text(movie.title)
                                Text(movie.period.rawValue)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
