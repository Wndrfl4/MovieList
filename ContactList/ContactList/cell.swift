import SwiftUI

struct cell: View {
    var movies: MovieDescriptions
    
    var body: some View {
        HStack {
            Image(movies.image)
                .resizable()
                .frame(width: 90, height: 120)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(movies.name)
                    .font(.headline)
                Text(movies.descriptions) 
                    .font(.subheadline)
                    .lineLimit(2)
            }
            
            Spacer()
        }
        .padding(5)
    }
}
