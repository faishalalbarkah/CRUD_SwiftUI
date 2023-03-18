//
//  NewPostView.swift
//  CRUD_SwiftUI
//
//  Created by faisalalbarkah on 14/11/22.
//

import SwiftUI

struct NewPostView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Binding var isPresented: Bool
    @Binding var title: String
    @Binding var post: String
    @State var isAlert =  false
    var body: some View {
        NavigationView{
            ZStack{
                Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
                VStack(alignment:.leading)
                {
                    Text("Hello, World!")
                        .font(Font.system(size: 16, weight: .bold))
                    
                    TextField("Title", text: $title)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(6)
                        .padding(.bottom)
                    
                    TextField("Write somenthing...", text: $post)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(6)
                        .padding(.bottom)
                    
                    Spacer()
                }.padding()
                    .alert(isPresented: $isAlert, content: {
                        let title = Text("No Data")
                        let message = Text("Please fill you title and post!")
                        return Alert(title: title, message: message)
                    })
            }
            .navigationBarTitle("New Post", displayMode: .inline)
            .navigationBarItems(leading: leading, trailing: trailing)
        }
    }
    
    var leading: some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            Text("Cancel")
        })
    }
    
    var trailing: some View {
        Button(action: {
            if title != nil && post != nil {
                let parameters: [String: Any] = ["title": title, "post": post]
                viewModel.createPosts(parameters:  parameters )
                viewModel.fetchPosts()
                
                isPresented.toggle()
            } else {
                isAlert.toggle()
            }
        }, label: {
            Text("Post")
        })
    }
}

//struct NewPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPostView()
//    }
//}
