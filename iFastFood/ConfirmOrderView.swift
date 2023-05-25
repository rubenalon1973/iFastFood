//
//  ConfirmOrderView.swift
//  iFastFood
//
//  Created by Ruben Alonso on 21/5/23.
//

import SwiftUI


struct ConfirmOrderView: View {
    @EnvironmentObject var orderVM: OrderViewModel
    
    @State var paymentType = "Cash"
    @State var fastfoodCard = false
    @State var fastfoodID = ""
    @State var tipAmount = 10
    @State var showAlert = false
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay", selection: $orderVM.paymentType) {
                    ForEach(PaymentTypes.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                
                Toggle("Add Fast Food Card", isOn: $fastfoodCard.animation())
                
                if fastfoodCard {
                    TextField("Enter your fastfood ID", text: $fastfoodID)
                }
            }
            
            Section("Add a tip?") {
                Picker("Percentage", selection: $tipAmount) {
                    ForEach(orderVM.tipAmounts, id: \.self) { amount in
                        Text("\(amount)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Total to pay: \(orderVM.totalPay(percentage: tipAmount))") {
                Button {
                    showAlert.toggle()
                } label: {
                    Text("Confirm Payment")
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .buttonStyle(.bordered)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .listRowBackground(Color.clear)
        }
        .alert("Payment confirmed!", isPresented: $showAlert) {
            
        } message: {
            VStack {
                Text("Your total was \(orderVM.totalPay(percentage: tipAmount))€ - Thank you")
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ConfirmOrderView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmOrderView()
            .environmentObject(OrderViewModel())
    }
}
