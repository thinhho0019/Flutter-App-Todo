import 'package:flutter/material.dart';
import 'package:note/model/note.dart';
import 'widget/cardBody.dart';
import 'widget/cartModelBottom.dart';
void main() {
  runApp( MaterialApp(
     debugShowCheckedModeBanner: false,
     home : MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<NoteData> notes=[];

  void _handleAddTask(String name){
     final newItems = NoteData(DateTime.now().toString(),name );
     
     setState(() {
       notes.add(newItems);
     });
  }
  void _handleDeleteNotes(String id){
    
    setState(() {
       notes.removeWhere((element) => id==element.id);
    });
   
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text("ToDoList",style: TextStyle(fontSize: 20),),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children:  notes.map((item) => cartBody(item:item,itemD:_handleDeleteNotes,index:notes.indexOf(item))).toList()
          )
          ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add,size:40,),
          onPressed: (){
            showModalBottomSheet(shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top:Radius.circular(20))),
            isScrollControlled: true,
            context: context,
             builder: (context) {
              return modelBottom(addTask:_handleAddTask);
            },);
          }
          ),
    );

  }
}





 
 