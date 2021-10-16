//
//  ReservacionesView.swift
//  MARCO
//
//  Created by Valeria Conde on 10/15/21.
//
//

import SwiftUI
import UIKit


struct ReservacionesView: View {
    
    @State private var fecha = Date()
    @State private var personas = 0
    @State private var opcion = 2
    @State private var showAlert = false
    
    var body: some View {
        NavigationView{
        ZStack{
            Color("White")
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack{
                    VStack{
                    Head(title: "#Reservaciones")
                        .padding(.bottom, 50)
                        ZStack{
                            HStack{
                                Link(destination: URL(string: "https://www.marco.org.mx//boletos/")!){
                                    VStack{
                                        Image(systemName: "ticket.fill").foregroundColor(.black)
                                        .font(.largeTitle)
                                            .padding(.bottom, -3)
                                            Text("Compra boletos").foregroundColor(Color("Rose"))
                                        }
                                    }
                                        .padding(.horizontal, 30)
                                    
                                    Link(destination: URL(string: "https://www.marco.org.mx/restaurante/")!){
                                        VStack{
                                            Image("icono_restaurante").foregroundColor(Color("Rose"))
                                            Text("Restaurantes").foregroundColor(Color("Rose"))
                                        }
                                    } // link
                                    .padding(.horizontal, 30)
                                    
                                    
                                    } //hstack
                            } // zstack
                    
            
                            VStack(alignment: .leading){
                                Text("Reserva una visita guiada")
                                    .font(.title2)
                                    .padding(.top, 15)
                                    .padding(.bottom, 15)
                                    .foregroundColor(Color("Rose"))

                                DatePicker("Reservaciones", selection: $fecha, in: Date()..., displayedComponents: [.date])
                                    .datePickerStyle(GraphicalDatePickerStyle())
                                    .accentColor(Color("Rose"))
                                    .environment(\.locale, Locale.init(identifier: "es"))

                                Text("Horarios disponibles")
                                        .bold()

                                /*Text(fecha,style:.date)
                                    .environment(\.locale, Locale.init(identifier: "es"))*/
                            VStack(){
                                Button(action: {
                                    print("Si jala 1")
                                }, label: {
                                    Text("Horario 1")
                                })
                                Button(action: {
                                    print("Si jala 2")
                                }, label: {
                                    Text("Horario 2")
                                })
                                .padding(.bottom,10)
                            }
                            
                            Text("Reservacion para \(personas) personas")
                                .bold()
                            Picker("", selection: $personas){
                                ForEach(1...10, id: \.self){
                                    Text("\($0)")
                                }
                                
                            }
                
                                
                                
                                
                            Button(action: {
                                showAlert = true

                            }) {
                                Text("Reservar")
                                    .frame(width: 200 , height: 50, alignment: .center)
                            }
                            .foregroundColor(.white)
                            .background(Color("Rose"))
                            .frame(width: 100)
                            .position(x: 185, y: 50)
                            .alert(isPresented: $showAlert) {
                                Alert(title: Text("Reservado"), message: Text("Para \(personas) personas el \(fecha) con el guia X"), dismissButton: .default(Text("Ok")))
                            }
                                
                               
                        } // vstack
                        .padding(28)
                        } // vstack
                    } // vstack
                } // scrollview
            } // zstack
        } // navigation view
    } // body
} // struct

struct ReservacionesView_Previews: PreviewProvider {
    static var previews: some View {
        ReservacionesView()
    }
}
