//
//  DetailView.swift
//  CRUD_SwiftUI
//
//  Created by faisalalbarkah on 14/11/22.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.presentationMode) var presentationMode
    let item: PostModel
    @State var title = ""
    @State var post = ""
    var body: some View {
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
                .onAppear(perform: {
                    self.title = item.title
                    self.post = item.post
                })
        }
        .navigationBarTitle("Edit Post", displayMode: .inline)
        .navigationBarItems(trailing: trailing)
    }
    
    var trailing: some View {
        Button(action: {
            //Update post
            if title != nil && post != nil {
                let parameters: [String: Any] = ["id": item.id, "title": title, "post": post]
                viewModel.updatePosts(parameters: parameters)
                viewModel.fetchPosts()
                presentationMode.wrappedValue.dismiss()
            }
            
        }, label: {
            Text("Post")
        })
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
