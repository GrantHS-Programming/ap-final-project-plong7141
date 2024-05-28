//
//  ContentView.swift
//  app1
//
//  Created by Patchen Long on 3/19/24.
//

import SwiftUI

struct ContentView: View {
    
    // new variables here!
    @State var infoText: String = "Enter a time beow: "
    @State var hour: String = ""
    @State var time: String = ""
    @State var minute: String = ""
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
                        VStack{
                            Text(infoText)
                                .padding()
                                .background(Color.lightPink)
                            HStack{
                                TextField("Enter Hour", text: $hour)
                                    .background(Color.lightPink)
                                    .keyboardType(.decimalPad)
                                    .padding()
                                Spacer()
                                TextField("Enter Minute", text: $minute)
                                    .background(Color.lightPink)
                                    .keyboardType(.decimalPad)
                                    .padding()
                                
                            }
                            Button(action: {checking()})
                            {Text("Submit")}
                        }
                        
                        
                    }
                  
                }
                .padding()
                .background(Rectangle().foregroundColor(.newGreen).cornerRadius(15)
                    .shadow(radius: 15))
                .padding()
                // edit this for a time picker! make it look diffrent too!!
                VStack{
                    HStack{
                        VStack{
                            // make another info text
                            Text(infoText)
                                .padding()
                                .background(Color.lightPink)
                            HStack{
                                TextField("Enter a time", text: $time)
                                    .background(Color.lightPink)
                                    .keyboardType(.decimalPad)
                                    .padding()
                                
                                
                            }
                            Button(action: {checking()})
                            {Text("Submit")}
                        }
                        
                        
                    }
                  
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
    // put functions here!!
    func checking() {
        if Int(hour) == nil {
            infoText = "Please enter an hour"
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                infoText = "Enter a time below:"
            }
        }
        else if Int(minute) == nil {
            infoText = "Please enter a minute"
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                infoText = "Enter a time below:"
            }
        }
        else{
            infoText = "Data inputed"
        }
    }
}

#Preview {
    ContentView()
}
