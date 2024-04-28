  import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:querys_firebase/updateForm.dart';

final ref = BooksRef;
class generic extends StatefulWidget {
  final Map<String,dynamic> data;
  const generic({super.key, required this.data});

  @override
  State<generic> createState() => _genericState();
}

class _genericState extends State<generic> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(height: 40,width: 70,child:  Center(child:Text("${widget.data["Name"].toString()}"))),
      SizedBox(height: 40,width: 70,child:  Center(child:Text("${widget.data["Salary"].toString()}"))),
      SizedBox(height: 40,width: 70,child:  Center(child:Text("${widget.data["Age"].toString()}"))),
      SizedBox(height: 40,width: 70,child:  Center(child:Text("${DateTime.parse(widget.data["data"]["date"].toDate().toString()).day}"+"/"+"${DateTime.parse(widget.data["data"]["date"].toDate().toString()).month}"+"/"+"${DateTime.parse(widget.data["data"]["date"].toDate().toString()).year}"+"HR:"+"${DateTime.parse(widget.data["data"]["date"].toDate().toString()).hour}" ))),
      IconButton(onPressed: (){
        ref.doc(widget.data["F_ID"]).delete();
      }, icon: Icon(Icons.delete)),
      
      IconButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder:(context)=> updateForm(data:widget.data)));

        //ref.doc(widget.data["F_ID"]).delete();
      }, icon: Icon(Icons.edit))
      
      // SizedBox(height: 40,width: 70,child:  Center(child:Text("${widget.data["data"]["ID"].toString()??"XD"}"))),
      
    ],);
  }
}




final  BooksRef =FirebaseFirestore.instance.collection('Books');

// final  booksCollection =    FirebaseFirestore.instance.collection('Books').withConverter<Book>(
//      fromFirestore: (snapshot, _) => Book.fromJson(snapshot.data()!),
     
//      toFirestore: (Book, _) => Book.toJson(),
//    );