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
                Text("Title to come!")
                    .font(.title).fontWeight(.bold).foregroundColor(Color("AccentColor")).dynamicTypeSize(/*@START_MENU_TOKEN@*/.xLarge/*@END_MENU_TOKEN@*/)
                Text("Discription/ info on how to use app/ what to do!! This is to check formating :)")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("LightPink"))
                    .multilineTextAlignment(.center)
                VStack{
                    HStack{
                        DatePicker(selection:  .constant(Date()),
                                   label: { Text("Time") })
                        
                        Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/,
                               label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                            /*@START_MENU_TOKEN@*/Text("1").tag(1)/*@END_MENU_TOKEN@*/
                            /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/
                        }
                        
                    }
                    Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                    }
                    .padding()
                }
                .padding()
                .background(Rectangle().foregroundColor(.newGreen).cornerRadius(15)
                    .shadow(radius: 15))
                .padding()
                VStack{
                    Text("Label to come!")
                    ProgressView(value: 0.5)
                }
                .padding()
                .background(Rectangle()
                    .foregroundColor(.lightPink)
                    .cornerRadius(15))
                .padding()
            }
            
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
