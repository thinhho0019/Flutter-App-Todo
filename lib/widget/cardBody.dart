import 'package:flutter/material.dart';
import 'package:note/model/note.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
class cartBody extends StatelessWidget {
  cartBody({
    Key? key,
    required this.item,
    required this.itemD,
    required this.index
  }) : super(key: key);
  var item;
  var index;
  final Function itemD;
  @override
  Widget build(BuildContext context) {
    return Container(
                  // Another fixed-height child.
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: index%2==0? Colors.amber:Colors.blue, 
                    borderRadius: BorderRadius.circular(20)),
                  // Green
                  height: 74,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text((item as NoteData).name,
                        style: TextStyle(color: Colors.white,
                        fontSize: 16),
                        
                        ),
                        InkWell(
                          onTap: () async{
                            if (await confirm(
                          context,
                          title: const Text('Confirm'),
                          content: const Text('Would you like to remove?'),
                          textOK: const Text('Yes'),
                          textCancel: const Text('No'),
                       )) {
                        return itemD(item.id);
                           }
                        return print("huy");
                          },
                          child: Icon(Icons.delete,color: Colors.white),
                        )
                      ],
                    ),
                  ),
                );
  }
}
