// SwiftLint導入開始

import SwiftUI

struct ContentView: View {
    @State var noTaxPrice: String = ""
    @State var tax: String = ""
    @State var result: Int = 0
    var body: some View {
        HStack {
            Spacer(minLength: 70)
            Text("税抜金額")
            Spacer(minLength: 10)
            TextField("", text: $noTaxPrice)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
            Spacer(minLength: 5)
            Text("円")
            Spacer(minLength: 70)
        }
        HStack {
            Spacer(minLength: 70)
            Text("消費税率")
            Spacer(minLength: 10)
            TextField("", text: $tax)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
            Spacer(minLength: 5)
            Text("%")
            Spacer(minLength: 70)
        }
        Button("計算") {
            let price = Double(noTaxPrice) ?? 0
            let taxRate = ((Double(tax) ?? 0) / 100) + 1
            UserDefaults.standard.set(self.tax, forKey: "myKey")
            result = Int(price * taxRate)
        }
        .padding(EdgeInsets(top: 5, leading: 0, bottom: 30, trailing: 0))
        HStack {
            Spacer()
            Text("税込金額")
            Spacer(minLength: 160)
            Text("\(result)円")
            Spacer()
        }
        .onAppear {
            let savedTax = UserDefaults.standard.string(forKey: "myKey")
            tax = savedTax ?? ""
        }
        Spacer()
    }
}

#Preview {
    ContentView()
}
