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
                ScrollView{
                    
                    VStack(alignment: .center) {

                        

                        Spacer()

                        

                        TitleView()

                        

                        InformationContainerView()

                        

                        Spacer(minLength: 30)

                        

                        NavigationLink(destination: MarcasView()) {

                            Text("Continuar")

                                .customButton()

                                .padding(.horizontal)

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

                    .font(.largeTitle)

                    .padding()

                    .accessibility(hidden: true)


            }

            .padding(.top, UIScreen.main.bounds.height / 4)

            

            Text("Bem-vindo \nWebCarros")

                .customTitleText()

                .multilineTextAlignment(.center)

        }

    }

}



struct InformationContainerView: View {

    var body: some View {

        VStack(alignment: .leading) {

            InformationDetailView(title: "", subTitle: "Seu veiculo está aqui!", imageName: "car.side")

        }

        .padding(.horizontal)

    }

}



struct ButtonModifier: ViewModifier {

    func body(content: Content) -> some View {

        content

            .foregroundColor(.white)

            .font(.headline)

            .padding()

            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)

            .background(RoundedRectangle(cornerRadius: 15, style: .continuous)

                .fill())

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
