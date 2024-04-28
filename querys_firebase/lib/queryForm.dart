

import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'item.dart';
import 'package:flutter/material.dart';





class QueryData extends StatefulWidget {
  const QueryData({Key? key}) : super(key: key);
 
  @override
  State<QueryData> createState() => _QueryDataState();
}

class _QueryDataState extends State<QueryData>{
  var ref =   BooksRef;
  var loader;
  var subset= BooksRef;
  String def = "Salary";
  var Name = TextEditingController();
  int  queryFlag =0;


  @override
  Widget build(BuildContext context){

    return Scaffold(

        appBar: AppBar(actions: <Widget>[
            IconButton(onPressed:()=>setState(() {
             

               queryFlag =666;
               

              
            }), icon:Icon(Icons.search)),
          SizedBox(
            width: 200,
            height: 25,
            
            child: TextField(
                
                controller: Name,
               
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(

                  contentPadding: EdgeInsets.all(4),
                  border: OutlineInputBorder(),
                
                  hintText: 'Enter Your Name',
                ),
              ),
          ),
          //Checkbox(value: false, onChanged: ),
          PopupMenuButton(
           
            onSelected: (value)=>setState(()=> queryFlag = value ),
            icon: const Icon(Icons.sort),
            itemBuilder: (BuildContext context){
              return const [
                PopupMenuItem(child: Text("Deffault"),value:0 ),
                PopupMenuItem(child: Text("Order By date"),value:1 ),
                PopupMenuItem(child: Text("Order By Salary"),value:2 ),


                // PopupMenuItem(child: Text(""),value:2 ),
              ];
            },


          )

        ],),
        body:  FirestoreListView(
              // .where("Name",isEqualTo: Name.text)
              query:queryCreator(), 

              itemBuilder:(BuildContext  context, QueryDocumentSnapshot<Map<String,dynamic>> doc){
                 var foo = doc.data();
                 foo["F_ID"]=doc.id; 
                return generic(data:foo);
        }
        
        ),




        
        );
          

  
  }

  Query<Map<String, dynamic>> queryCreator(){
    if(queryFlag==0){
      return ref;
    }
    if(queryFlag==1){
      return ref.orderBy('data.date');

    }
    if(queryFlag==2){
      return ref.orderBy('Salary');

    }
              
    return ref.where("Name",isEqualTo: Name.text);
  } 


  

}

  // class refreshList extends StatefulWidget {
  //   const refreshList({super.key});

  //   @override
  //   State<refreshList> createState() => _refreshListState();
  // }

  //   class _refreshListState extends State<refreshList> {
  //   @override
  //   Widget build(BuildContext context) {
  //     return Container(
  //       child: FirestoreListView(
              
  //             query:ref.where(context.def), 

  //             itemBuilder: (BuildContext context, QueryDocumentSnapshot<Map<String,dynamic>> doc){
  //               return generic(data: doc.data());
  //       }
        
  //       ),

  //     );
  //   }
  
  // }