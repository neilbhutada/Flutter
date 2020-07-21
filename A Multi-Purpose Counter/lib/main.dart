import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() {
  List items = ["BS Computer Science","BA Computer Science","BA Data Science","BS Data Science"];
  runApp(MaterialApp(
      home : LandingScreen()
  )
  );
}




class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  List <String> items = List();
  List <int> count = List();
  var _userAdded = TextEditingController();
  var _forCounter = TextEditingController();
  insert(String item, int count){
    DocumentReference insert = Firestore.instance.collection("First").document('$item');
    insert.setData({
      'item' : '$item',
      'count' : count
    });

  }
  delete(String item){
    DocumentReference del = Firestore.instance.collection("First").document('$item');
    del.delete();

  }
  update(String item, int count){
    DocumentReference del = Firestore.instance.collection("First").document('$item');
    del.updateData({
      'count' : count
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance.collection("First").snapshots(),
        builder: (context, snapshots) {
                 return Scaffold(
                   appBar: AppBar(title: Text("Counter"),
                     centerTitle: true,),
                   body: ListView.builder(
                       shrinkWrap: true,
                       itemCount: snapshots.data.documents.length,
                       itemBuilder: (context,index){
                         DocumentSnapshot ds = snapshots.data.documents[index];
                         return Card(
                           child: Dismissible(
                             key: Key(ds['item']),
                             child: ListTile(
                               title: Text(ds['item']),
                               subtitle: Text(ds['count'].toString()),
                               onTap: (){
                                 setState(() {
                                   count[index]++;
                                   update(ds['item'],count[index]);
                                 });
                               },
                               trailing: IconButton(icon: Icon(Icons.refresh),
                                 onPressed: (){
                                   showDialog(context: context,
                                       builder: (context){
                                         return AlertDialog(
                                           title: Text("Reset Counter to"),
                                           content: TextField(
                                             controller: _forCounter,
                                           ),
                                           actions: [FlatButton(
                                             child: Text("OK"),
                                             onPressed: (){
                                               setState(() {
                                                 count[index] = int.parse(_forCounter.text);
                                                 update(ds['item'],count[index]);
                                               });
                                               Navigator.pop(context);
                                             },
                                           )],
                                         );
                                       });
                                 },
                                 color: Colors.blue,),


                             ),
                             onDismissed: (direction){
                               delete(ds['item']);
                               setState(() {
                                 count.removeAt(index);
                                 items.removeAt(index);
                               });

                             },
                             background: Container(color: Colors.red,),
                           ),
                         );
                       }),
                   floatingActionButton: FloatingActionButton(
                     child: Icon(Icons.add),
                     onPressed: (){
                       showDialog(
                           context: context,
                           builder: (context) {
                             return AlertDialog(
                               title: Text("Enter Item"),
                               content: TextField(
                                 decoration: InputDecoration(
                                   //labelText: "Enter Item",
                                 ),
                                 controller: _userAdded,
                               ),
                               actions: [FlatButton(
                                 child: Text("ADD",
                                   style: TextStyle(color: Colors.blue),),
                                 onPressed: (){
                                   setState(() {
                                     items.add(_userAdded.text);
                                     count.add(0);
                                      insert(_userAdded.text,0);
                                     _userAdded.text = "";
                                   });

                                   Navigator.pop(context);
                                 },
                               )],
                             );
                           });


                     },
                   ),
                 );
        }

    );
  }
}


