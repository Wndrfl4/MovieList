//
//  NewView.swift
//  ContactList
//
//  Created by Aslan  on 28.03.2025.
//

import SwiftUI

struct NewView: View {
    var movies: MovieList
    var body: some View {
        HStack{
            Image(movies.image)
                .resizable()
                .frame(width: 90, height: 120)
            VStack(alignment: .leading, spacing: 7){
                Text(movies.name)
                    .font(.title)
                HStack {
                    Text(movies.description)
                        .font(.subheadline)
                    Spacer()
                    Image(systemName: "heart.fill")
                    Text("86%")
                        .font(.subheadline)
                }
            }
        }
    }
}

