//
//  MainListCellView.swift
//  iFastFood
//
//  Created by Ruben Alonso on 14/5/23.
//

import SwiftUI

struct MainListCellView: View {
    let menuDish: MenuDishes
    
    let restrictionColors: [String: Color] = ["D": .purple,
                                              "G": .black,
                                              "N": .red,
                                              "V": .green]
    
    var body: some View {
        HStack {
            Image(menuDish.thumbnailImage)
            //                .clipShape(Circle())
                .cornerRadius(50)
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))// aro resaltado
            VStack(alignment: .leading) {
                Text(menuDish.name)
                Text("$\(menuDish.price)")
            }
            Spacer()
            //            .self pq no podemos conformarlo a identifiable
            ForEach(menuDish.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(restrictionColors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
}

struct MainListCellView_Previews: PreviewProvider {
    static var previews: some View {
        MainListCellView(menuDish: .previewDish)
            .padding()
    }
}
