

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
  
class formData extends StatefulWidget {
  const formData({Key? key}) : super(key: key);
 
  @override
  State<formData> createState() => _formDataState();
}


class  _formDataState extends State<formData> {
  
  final  userNameController = TextEditingController();
  final  userAgeController= TextEditingController();
  final  userSalaryController =TextEditingController();

 

  
 @override
  Widget build(BuildContext context) {
    final Ref = FirebaseFirestore.instance.collection("Books");
    Map<String,dynamic> Metadata= {'date':DateTime.now(),'Status':'Inactive','ID': Random().nextInt(100) + 50};
    addData(data){
      Ref.add({
        'Age':int.parse(data['age']),
        'Name':data['name'],
        'Salary':int.parse(data['salary']),
        'data':Metadata
        
        }
      ).then((value) => print("user Added")).catchError((error)=>print("Error"));
      
    }
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Inserting data'),
      ),
      body: Center(
        
        child: 
          
          
          Column(
            children: [
              const SizedBox(
                height: 50,
                width: 50,
              ),
              const Text(
                'Inserting data in Firebase Realtime Database',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
            
              TextField(
                controller: userNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter Your Name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: userAgeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Age',
                  hintText: 'Enter Your Age',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: userSalaryController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Salary',
                  hintText: 'Enter Your Salary',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  Map<String, String> students = {
                    'name': userNameController.text,
                    'age': userAgeController.text,
                    'salary': userSalaryController.text
                  };
 
                     addData(students);

 
                },
                child: const Text('Insert Data'),
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: 300,
                height: 0,
              ),
            ],
          ),
        
      ),
    );
  }
}