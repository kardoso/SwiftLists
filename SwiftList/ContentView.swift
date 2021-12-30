//
//  ContentView.swift
//  SwiftList
//
//  Created by Samuel Cardoso on 30/12/21.
//

import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    var title: String
}

struct ContentView: View {
    @State var movies = [
        Movie(title: "Episode IV - A New Hope"),
        Movie(title: "Episode V - The Empire Strikes"),
        Movie(title: "Episode VI - Return of the Jedi"),
        Movie(title: "Spider-Man: No Way Home")
    ]
    var body: some View {
        VStack {
            Text("Movies List")
                .font(.largeTitle)
            List(movies, id: \.id) { movie in
                Text(movie.title)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
