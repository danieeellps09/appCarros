//
//  OpenView.swift
//  irede-projeto1
//
//  Created by Daniel Lopes da Silva on 26/06/24.
//

import Foundation
import SwiftUI



struct OpenView: View {

    var body: some View {

        NavigationStack {
            
            ZStack{
                
                ImageBackgroundView()
//                    .ignoresSafeArea()
                ScrollView{
                    
                    VStack(alignment: .center) {
                        
                        

                        Spacer()

                        

                        TitleView()

                        

                        InformationContainerView()

                        

                        Spacer(minLength: 30)

                        

                        NavigationLink(destination: MarcasView()) {

                            Text("Continuar")
//                                .background(.black)
                                .padding(.horizontal, 30)
                                .foregroundColor(.black)
                                .font(.headline)
                                .background(.gray)
                                .cornerRadius(3)
                                .padding(.vertical,114)
//                                .frame(minWidth: 10, maxWidth: .infinity, alignment: .center)
                                
                            
                            
                            

                        }

                       

                    }

                }
                
            }

             

        }
    

    }

}



struct InformationDetailView: View {

    var title: String = "title"

    var subTitle: String = "subTitle"

    var imageName: String = "car"

    

    var body: some View {

        HStack(alignment: .center) {

            VStack(alignment: .leading) {

                Text(title)

                    .font(.headline)

                    .accessibility(addTraits: .isHeader)

                

                Text(subTitle)

                    .font(.body)

                    .fixedSize(horizontal: false, vertical: true)

            }

        }

        .padding(.top)

    }

}



#Preview {

    OpenView()

}





struct TitleView: View {

    var body: some View {

        VStack {

            HStack {

                Image(systemName: "car.side.fill")
//                    .foregroundColor(.black.opacity(0.8))

                    .font(.largeTitle)

                    .padding()

                    .accessibility(hidden: true)


            }

            .padding(.top, UIScreen.main.bounds.height / 7)

            

            Text("Bem-vindo \nWebCarros")
//                .foregroundStyle(.black.opacity(0.7))

                .customTitleText()

//                .multilineTextAlignment(.center)

        }
            
    }

}



struct InformationContainerView: View {

    var body: some View {

        VStack(alignment: .leading) {

//            InformationDetailView(title: "", subTitle: "Seu veiculo está aqui!", imageName: "car.side")

        }

        .padding(.horizontal)

    }

}



struct ButtonModifier: ViewModifier {
    
    

    func body(content: Content) -> some View {

        content
        
            .shadow(color: .red, radius: 100)
        
//            .colorInvert()
        

            .foregroundColor(.white)

            .font(.headline)

//            .padding()

            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)

            .background(RoundedRectangle(cornerRadius: 5, style: .continuous)

                .fill())
            .safeAreaPadding(110)
            .padding(.bottom)
            
            

           

    }

}



extension View {

    func customButton() -> ModifiedContent<Self, ButtonModifier> {

        return modifier(ButtonModifier())
        
        

    }

}



extension Text {

    func customTitleText() -> Text {

        self

            .fontWeight(.black)

            .font(.system(size: 36))

    }

}



extension Color {

    static var mainColor = Color(UIColor.systemIndigo)

}
