//
//  OrdeListView.swift
//  iFastFood
//
//  Created by Ruben Alonso on 21/5/23.
//

import SwiftUI

struct OrderListView: View {
    @EnvironmentObject var vm: OrderViewModel
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(vm.orderedDishes) { dish in
                        HStack {
                            Text(dish.name)
                            Spacer()
                            Text("\(dish.price)€")
                        }
                    }
                    .onDelete { vm.orderedDishes.remove(atOffsets: $0) }
                }
                
                Section {
                    NavigationLink(destination: ConfirmOrderView()) {
                        Text("Confirm Order")
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .buttonStyle(.bordered)
                    .listRowBackground(Color.clear)
                    .disabled(vm.orderedDishes.isEmpty)
                }
            }
            .navigationTitle("Order")
        }
    }
}

struct OrdeListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
            .environmentObject(OrderViewModel())
    }
}
