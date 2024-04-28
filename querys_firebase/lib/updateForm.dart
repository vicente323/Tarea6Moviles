import 'package:flutter/material.dart';
import 'package:querys_firebase/item.dart';

final ref = BooksRef;
class updateForm extends StatefulWidget {
  final Map<String,dynamic> data;
  const updateForm({super.key,  required this.data});

  @override
  State<updateForm> createState() => updateFormState();
}

class updateFormState extends State<updateForm> {
  @override
 final salaryController = TextEditingController();
 final nameController = TextEditingController();
 final statusController = TextEditingController();
 
  Widget build(BuildContext context) {
    var status = widget.data['data']['Status'];
    salaryController.text = widget.data["Salary"].toString();
    nameController.text = widget.data["Name"];
    return Scaffold(


      body:Column(children: [
        
        SizedBox(height: 50,),
        TextFormField(
                controller: salaryController,
                keyboardType: TextInputType.number,
                //initialValue: widget.data["Salary"].toString(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  
                  labelText: 'Salary',
                  hintText: 'Enter Your Salary',
                ),
                
              ),
        SizedBox(height: 10,),
        TextFormField(
                
                controller: nameController,
                keyboardType: TextInputType.text,
                //initialValue: widget.data["Salary"].toString(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  
                  labelText: 'Name',
                  
                ),
                
              ),
        SizedBox(height: 50,),

       DropdownMenu(dropdownMenuEntries: [
          DropdownMenuEntry(value: "Inactive", label: "Inactive"),
          DropdownMenuEntry(value: "Active", label: "Active")
       ],
       onSelected: (value){
          status = value;
       },
       ),
       SizedBox(height: 50),
       SizedBox(height: 80,width: 200,child: FloatingActionButton(
          onPressed:(){
                ref.doc(widget.data["F_ID"]).update({'Salary':int.parse(salaryController.text),'Name':nameController.text,'data.Status':status});
          },
          child: Text("Update"),
        
        )),
        
        
        ]
      )
    );
  }
}