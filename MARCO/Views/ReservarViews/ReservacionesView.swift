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
    @State private var horariosDisponibles = [HorarioModel]()
    @State private var guia = String()
    @State private var horario = String()
    
    @EnvironmentObject private var reservaVM : ReservaViewModel
    
    private var dateProxy:Binding<Date> {  //EIRH, en lugar de este proxy, utilice el modifier onChange
        
        Binding<Date>(get: {self.fecha }, set: {
            self.fecha = $0
            print(fecha)
            
            /*reservaVM.getHorariosDisponibles(date: fecha)
            DispatchQueue.main.async {
                
                
                self.horariosDisponibles = reservaVM.horariosDisponibles
            }*/
            
        })
    }
    
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: Date())!
        return min...max
    }
    
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
                                        Image(systemName: "ticket.fill")
                                            .foregroundColor(.black)
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
                            // Calendario
                            Text("Reserva una visita guiada")
                                .font(.title2)
                                .padding(.top, 15)
                                .padding(.bottom, 15)
                                .foregroundColor(Color("Rose"))

                            DatePicker("Reservaciones", selection: $fecha, in: dateClosedRange, displayedComponents: [.date])
                                 .datePickerStyle(GraphicalDatePickerStyle())
                                 .accentColor(Color("Rose"))
                                 .environment(\.locale, Locale.init(identifier: "es"))
                                 .onChange(of: fecha, perform: { value in
                                    //Modifique la funcion para que regrese los horarios en cuanto termine la función
                                    reservaVM.getHorariosDisponibles(date: fecha) { (horarios) in
                                        DispatchQueue.main.async {
                                            self.horariosDisponibles = horarios
                                        }

                                    }
                                    
                                })

                            // FECHAS CON HORARIOS
                            // 21 de octubre y 2 de noviembre
                            // Botones de horarios
                            Text("Horarios disponibles")
                                .bold()
                                
                            VStack(alignment: .leading){
                                ForEach(horariosDisponibles) { item in
                                    Button(action: {
                                        horario = item.hora
                                    }, label: {
                                        Text(item.hora)
                                            .foregroundColor(Color("Rose"))
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 12)
                                                    .stroke(Color("Rose"), lineWidth: 4)
                                            )
                                    }) // button
                                } // foreach
                                    
                                // botones de guias
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
                                .padding(.bottom)
                            } // vstack
                            
                            
                            // Picker para numero de personas en la reserva
                            Text("Reservacion para \(personas) personas")
                                .bold()
                            Picker("", selection: $personas){
                                ForEach(1...10, id: \.self){
                                    Text("\($0)")
                                }
                            }
                            
                            // Textfield para recibir nombre de la persona de la reserva
                            Text("Reservacion a nombre de: \(name) ")
                                .bold()
                            TextField("Enter your name", text: $name)
                                         
                                
                            // boton para concluir la reserva
                            Button(action: {
                                // Call to view model
                                 reservaVM.reservarVisita(date: fecha, horario: horario, guia: guia, personas: personas, usuario: name)
                                
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
