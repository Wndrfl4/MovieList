import SwiftUI

struct descriptionsView: View {
    var movie: MovieDescriptions
    
    var body: some View {
        VStack {
            Image(movie.image)
                .resizable()
                .frame(width: 200, height: 300)
                .cornerRadius(10)
            
            Text(movie.name)
                .font(.largeTitle)
                .bold()
            
            Text(movie.descriptions) 
                .font(.body)
                .padding()
            
            Text(movie.rating)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding()
        .navigationTitle(movie.name)
    }
}
