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
    @State var infoText2: String = "Enter an amount of time below (in hours): "
    @State var hour: String = ""
    @State var time: String = ""
    @State var minute: String = ""
    @State var countDownTimer: Int = 0
    @State var countDownTimerH: Int = 0
    @State var countDownTimerM: Int = 0
    @State var timerRunning = false
    @State var timerRunningH = false
    @State var timerRunningM = false
    @State var run = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let timerH = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let timerM = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
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
                                .multilineTextAlignment(.center)
                                .cornerRadius(10)
                            HStack{
                                TextField("Enter Hour", text: $hour)
                                    .background(Color.lightPink)
                                    .keyboardType(.decimalPad)
                                    .cornerRadius(10)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                Spacer()
                                TextField("Enter Minute", text: $minute)
                                    .background(Color.lightPink)
                                    .keyboardType(.decimalPad)
                                    .cornerRadius(10)
                                    .multilineTextAlignment(.center)
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
                            Text(infoText2)
                                .padding()
                                .background(Color.newGreen)
                                .multilineTextAlignment(.center)
                                .cornerRadius(10)
                            HStack{
                                TextField("Enter a time", text: $time)
                                    .background(Color.newGreen)
                                    .keyboardType(.decimalPad)
                                    .multilineTextAlignment(.center)
                                    .cornerRadius(10)
                                
                                    .padding()
                                
                                
                            }
                            Button(action: {checkingTime()})
                            {Text("Submit")}
                        }
                        
                        
                    }
                  
                }
                
                .padding()
                .background(Rectangle().foregroundColor(.lightPink).cornerRadius(15)
                    .shadow(radius: 15))
                .padding()
                VStack{
                    HStack{
                        // Hours
                        VStack{
                            Text("\(countDownTimerH)")
                                .onReceive(timerH) {_ in
                                    if countDownTimerH > 0 && timerRunningH{
                                        countDownTimerH -= 1
                                    }
                                    else{
                                        timerRunningH = false
                                    }
                                }
                                .font(.system(size: 50, weight: .bold))
                                .opacity(0.8)
                            HStack(spacing: 30){
                                Button("+1 Hour"){
                                    countDownTimerH = countDownTimerH + 3600
                                }
                            }
                        }
                        .padding()
                        .background(Rectangle()
                            .foregroundColor(.lightOrange)
                            .cornerRadius(15))
                        .padding()
                        Text(":")
                            .font(.system(size: 50, weight: .bold))
                            .opacity(0.8)
                        // minutes
                        VStack{
                            Text("\(countDownTimerM)")
                                .onReceive(timerM) {_ in
                                    if countDownTimerM > 0 && timerRunningM{
                                        countDownTimerM -= 1
                                    }
                                    else if countDownTimerM <= 0 && run{
                                        timerRunningM = false
                                        timerRunningH = true
                                    }
                                }
                                .font(.system(size: 50, weight: .bold))
                                .opacity(0.8)
                            HStack(spacing: 30){
                                Button("+1 Min"){
                                    countDownTimerM = countDownTimerM + 60
                                }
                            }
                        }
                        .padding()
                        .background(Rectangle()
                            .foregroundColor(.lightOrange)
                            .cornerRadius(15))
                        .padding()
                        Text(":")
                            .font(.system(size: 50, weight: .bold))
                            .opacity(0.8)
                        // seconds
                        VStack{
                            Text("\(countDownTimer)")
                                .onReceive(timer) {_ in
                                    if countDownTimer > 0 && timerRunning{
                                        countDownTimer -= 1
                                    }
                                    else if countDownTimer <= 0 && run{
                                        timerRunning = false
                                        timerRunningM = true
                                    }
                                }
                                .font(.system(size: 50, weight: .bold))
                                .opacity(0.8)
                            HStack(spacing: 30){
                                Button("+1 Sec"){
                                    countDownTimer = countDownTimer + 1
                                }
                            }
                        }
                        .padding()
                        .background(Rectangle()
                            .foregroundColor(.lightOrange)
                            .cornerRadius(15))
                        .padding()
                        
                    }
                    Button("Start"){
                        timerRunning = true
                        run = true
                    }
                }
                
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
            infoText = "Data inputed!!"
        }
    }
    func checkingTime() {
        if Int(time) == nil {
            infoText2 = "Please enter a time"
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                infoText2 = "Enter an amount of time below (in hours):"
            }
        }
    }
}

#Preview {
    ContentView()
}
