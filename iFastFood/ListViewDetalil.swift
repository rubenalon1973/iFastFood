//
//  ListViewDetalil.swift
//  iFastFood
//
//  Created by Ruben Alonso on 16/5/23.
//

import SwiftUI

struct ListViewDetalil: View {
    @EnvironmentObject var vmOrder: OrderViewModel
    
    let dish: MenuDishes //para acceder a prop. de menudishes
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(dish.mainImage)
                    .resizable()
                    .scaledToFit()
                
                Text("PHoto: \(dish.photoCredit)")
                    .padding(4)
                    .background( .black)
                    .font( .caption)
                    .foregroundColor( .white)
                    .offset(x: -5, y: -5)
            }
            
            Text(dish.description)
                .padding()
            
            Button {
                vmOrder.addDishToOrder(dish: dish)
            } label: {
                Text("Order This")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .navigationTitle(dish.name)
        .navigationBarTitleDisplayMode( .inline)
    }
}

struct ListViewDetalil_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListViewDetalil(dish: .previewDish)
                .environmentObject(OrderViewModel())
        }
    }
}
