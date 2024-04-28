

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
  
import 'package:querys_firebase/itemForm.dart';
import 'package:querys_firebase/queryForm.dart';

// void main() {
//   runApp(const MainApp());
// }

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(children: [
            Container(child: AddRoute(), width: 1000, height: 700,)


          ],),
        ),
      ),
    );
  }
}


class AddRoute extends StatelessWidget{
  const AddRoute({super.key});
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      body: Column(  children: <Widget>[
         SizedBox(height: 200,), 
        Center(  child: ElevatedButton(   child: Text('Add Item'), onPressed: (){Navigator.of(context).push(

        MaterialPageRoute(builder : (context)=> const formData()));},)
        ),

     


         Center(child: ElevatedButton(child: Text('Query'), onPressed: (){Navigator.of(context).push(

        MaterialPageRoute(builder: (context)=> const QueryData()));},)
        ,),
      
      ],)
    );
  }
}