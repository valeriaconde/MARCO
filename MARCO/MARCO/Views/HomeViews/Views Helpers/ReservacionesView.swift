//
//  ReservacionesView.swift
//  MARCO
//
//  Created by Diego Rodriguez on 13/10/21.
//

import SwiftUI



struct ReservacionesView: View {
    
    @State private var fecha = Date()
    @State private var personas = 0
    @State private var opcion = 2
    
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
                        }
                        .padding(.horizontal, 30)
                        
                        
                        }
                }

                VStack(alignment: .leading){
                    Text("Selecciona una opcion")
                        .font(.title3)
                    DatePicker("Reservaciones", selection: $fecha, in: Date()..., displayedComponents: [.date])
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .accentColor(Color("Rose"))
                    Text("Reservacion para \(personas) personas")
                        .bold()
                    Picker("", selection: $personas){
                        ForEach(1...10, id: \.self){
                            Text("\($0)")
                        }
                        
                    }
                }
                .padding(28)
                }
                    }
                }
            }
        }
    }
}

struct ReservacionesView_Previews: PreviewProvider {
    static var previews: some View {
        ReservacionesView()
    }
}
