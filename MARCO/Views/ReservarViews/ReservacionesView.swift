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
    @State private var name = String()
    @State private var opcion = 2
    @State private var showAlert = false
    @State private var selectorIndex = 0
    @State private var guias = ["Guia 1", "Guia 2", "Guia 3"]
    @State private var guia = String()
    @State private var horario = String()
    
    
    @EnvironmentObject private var reservaVM : ReservaViewModel
    
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

                                VStack(alignment: .leading){
                                    Button(action: {
                                        horario = "Horario 1"
                                    }, label: {
                                        Text("Horario 1")
                                    })
                                    Button(action: {
                                        horario = "Horario 2"
                                    }, label: {
                                        Text("Horario 2")
                                    })
                                
                                    VStack{
                                        ForEach(0..<guias.count) { index in
                                            Button(action: {
                                                guia = (self.guias[index])
                                            }, label: {
                                            Text(self.guias[index]).tag(index)
                                        })
                                        .foregroundColor(Color("Rose"))
                                        
                                        .frame(width: 100)
                    
                           
                                        } // for each
                                    } // vstack
                                } // vstack
                            
                            
                          
                            Text("Reservacion para \(personas) personas")
                                .bold()
                            Picker("", selection: $personas){
                                ForEach(1...10, id: \.self){
                                    Text("\($0)")
                                }
                                
                            }
                            
                            Text("Reservacion a nombre de: \(name) ")
                                    .bold()
                                TextField("Enter your name", text: $name)
                                            
                            
                            Button(action: {
                                // Get name of reservation
                                //let tmpUser = ""
                                
                                // Call to view model
                                /* reservaVM.reservarVisita(date: fecha, horario: horario, guia: guia, personas: personas, usuario: tmpUser)*/
                                
                                
                                // Confirmation alert
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
                                Alert(title: Text("Reservado"), message: Text("Reservacion a nombre de \(name) para \(personas) personas el \(fecha) en el \(horario) guiados por \(guia)"), dismissButton: .default(Text("Ok")))
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
