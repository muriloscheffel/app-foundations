import SwiftUI

struct ModalidadeButton: View {
    
    var modalidade: WorkoutActivityType
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: modalidade.icon)
                .resizable()
                .scaledToFit()
                .frame(height: 25)
                .foregroundColor(.white)
                .padding(.leading, 16)
                .padding(.top, 16)
            
            Text(modalidade.nameEnglish)   // 👈 usa o enum, não estabelecimento
                .font(.system(size: 20))
                .foregroundColor(.white)
                .padding(.leading, 16)
                .padding(.bottom, 16)
        }
        .frame(width: 180, height: 80, alignment: .leading)
        .background(Color.accentColor)     // ou Color("Accent") se tiver no Assets
        .cornerRadius(16)
    }
}

#Preview {
    ModalidadeButton(modalidade: .swimming)
}
