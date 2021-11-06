import 'package:flutter/material.dart';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map data;
  CollectionReference collectionReference=FirebaseFirestore.instance.collection('data');
  String deneme(){
    String isim='Kemal';
    return isim;
  }
  fetchData(){
    CollectionReference collectionReference=FirebaseFirestore.instance.collection('data');
    collectionReference.snapshots().listen((snapshot) {
      setState(() {
        data=snapshot.docs[0].data();
        print(snapshot.docs[0].data().length);
        print(snapshot.docs[0].data());
        print(snapshot);
      });
    });
  }

  fetchData1() async{
   QuerySnapshot querySnapshot=await FirebaseFirestore.instance.collection('data').get();
   print(querySnapshot.docs.length);
   print(querySnapshot.docs[2].id);

  }

  addData(){
    //Map<String,dynamic> demoData={"name" : deneme(),
    Map<String,dynamic> demoData={"name" : '6',
      "motto" : "demir6"};

    CollectionReference collectionReference=FirebaseFirestore.instance.collection('data');
    collectionReference.add(demoData);
  }

  deleteData() async{
    FirebaseFirestore.instance.collection('data')
        .doc('S5xW6piAIJBoMKZf4lDa')
        .delete().then((_){
      print('success');
    });
    //querySnapshot.docs.length.toString();
    //print(querySnapshot.docs.length);
  }

  updateData() async{
    QuerySnapshot querySnapshot=await FirebaseFirestore.instance.collection('data').get();
    querySnapshot.docs.forEach((document) {
      print(document.id);
    });
  }
  void snapShot5() async{
    QuerySnapshot querySnapshot=await FirebaseFirestore.instance.collection('data').get();
    print(querySnapshot.docs[2].id);
  }

  void updateData5() async{
    CollectionReference collectionReference=await FirebaseFirestore.instance.collection('data')
        .doc('JfnvLiynoz2Dm2qkwqCz')
        .update({'name':'deneme35'}).then((_){
      print('success');
    });
  }
  void _onPressed() {
    FirebaseFirestore.instance.collection("data").add(
        {
          "name" : "john1",
          "motto":"deneme"
        }).then((value){
      print(value.toString());
      print(value.id);
      print(value.parent);
    });
  }

  void retrieving() async{
    QuerySnapshot querySnapshot=await FirebaseFirestore.instance.collection('data2').get();
    querySnapshot.docs.forEach((element) {
      print(element.data());
    });
  }

  void setData() async{
    CollectionReference collectionReference=await FirebaseFirestore.instance.collection('data3')
        .doc('3')
        .set({'name':'deneme3'}).then((_){
      print('success3');
    });
  }

  addSetData(){
    //Map<String,dynamic> demoData={"name" : deneme(),
    Map<String,dynamic> demoData={"name" : '6',
      "motto" : "demir6"};

    CollectionReference collectionReference=FirebaseFirestore.instance.collection('data5');
    collectionReference.doc('demoData').set(demoData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("xxx"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            //padding: EdgeInsets.all(5),
            alignment: Alignment.centerLeft,
            child: RaisedButton(
              color: Colors.green,
              child: Text('addSet Data',style: TextStyle(fontSize: 25.0),
              ),
              onPressed: addSetData,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: RaisedButton(
              color: Colors.green,
              child: Text('Set Data',style: TextStyle(fontSize: 25.0),
              ),
              onPressed: setData,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: RaisedButton(
              color: Colors.green,
              child: Text('Fetch Data',style: TextStyle(fontSize: 25.0),
              ),
              onPressed: fetchData,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: RaisedButton(
              color: Colors.green,
              child: Text('Fetch 1 Data',style: TextStyle(fontSize: 25.0),
              ),
              onPressed: fetchData1,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: RaisedButton(
              color: Colors.green,
              child: Text('Add Data',style: TextStyle(fontSize: 25.0),
              ),
              onPressed: addData,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: RaisedButton(
              color: Colors.green,
              child: Text('documentsList',style: TextStyle(fontSize: 25.0),
              ),
              onPressed: updateData,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: RaisedButton(
              color: Colors.green,
              child: Text('Delete Data',style: TextStyle(fontSize: 25.0),
              ),
              onPressed: deleteData,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: RaisedButton(
              color: Colors.green,
              child: Text('tek documentList',style: TextStyle(fontSize: 25.0),
              ),
              onPressed: snapShot5,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: RaisedButton(
              color: Colors.green,
              child: Text('updateData5',style: TextStyle(fontSize: 25.0),
              ),
              onPressed: updateData5,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: RaisedButton(
              color: Colors.green,
              child: Text('onPressed',style: TextStyle(fontSize: 25.0),
              ),
              onPressed: _onPressed,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: RaisedButton(
              color: Colors.green,
              child: Text('retrieving',style: TextStyle(fontSize: 25.0),
              ),
              onPressed: retrieving,
            ),
          ),
        ],
      ),
    );
  }
}
