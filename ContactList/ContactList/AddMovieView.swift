//
//  AddMovieView.swift
//  ContactList
//
//  Created by Aslan  on 29.03.2025.
//

import SwiftUI

struct AddMovieView: View {
    @Binding var descriptions: [MovieDescriptions]
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var image = ""
    @State private var descriptionsText = ""
    @State private var rating = ""

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Информация о фильме")) {
                    TextField("Название", text: $name)
                    TextField("Название изображения", text: $image)
                    TextField("Описание", text: $descriptionsText)
                    TextField("Рейтинг (IMDb)", text: $rating)
                }
            }
            .navigationTitle("Добавить фильм")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Отмена") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Сохранить") {
                        addMovie()
                        dismiss()
                    }
                    .disabled(name.isEmpty || image.isEmpty || descriptionsText.isEmpty || rating.isEmpty)
                }
            }
        }
    }

    private func addMovie() {
        let newMovie = MovieDescriptions(name: name, image: image, descriptions: descriptionsText, rating: rating)
        descriptions.append(newMovie)
    }
}

