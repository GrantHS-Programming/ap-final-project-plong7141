//
//  ContentView.swift
//  app1
//
//  Created by Patchen Long on 3/19/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.lightBlue
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                DatePicker(selection: .constant(Date()), label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*/Text("1").tag(1)/*@END_MENU_TOKEN@*/
                    /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/
                }
                Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                }
                .padding()
                Label(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
                ProgressView(value: 0.5)
                
            }
            
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
