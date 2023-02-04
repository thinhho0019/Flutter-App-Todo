import 'package:flutter/material.dart';

TextEditingController textControler = TextEditingController();

class modelBottom extends StatelessWidget {
  const modelBottom({
    Key? key,
    required this.addTask
  }) : super(key: key);
  final Function addTask;
  void handleOnCLick(BuildContext context){
    final name = textControler.text;
    if(name.isEmpty){
      return;
    }else{
      addTask(name);
      Navigator.pop(context);
    }
   
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        
        padding: EdgeInsets.only(top: 30,left: 20,right: 20),
        child: Column(
          
          children: [
            
            TextField(
              controller: textControler,
              decoration: InputDecoration(
              labelText: "nhập nhiệm vụ",
              
              border: OutlineInputBorder(),
        ),
            ),
            SizedBox(height: 20),
            SizedBox(
              
              height: 50,
              width: double.infinity,
              child: ElevatedButton(onPressed:()=>handleOnCLick(context), child: Text("lưu")))
          ],
        ),
      ),
    );
  }
}