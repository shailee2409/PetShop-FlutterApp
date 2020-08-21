import 'package:flutter/material.dart';
import 'package:pet_shop_app/screens/admin.dart';
import 'package:pet_shop_app/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:pet_shop_app/screens/home.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _textEditingController = TextEditingController();
  StreamSubscription<Event> _onTodoAddedSubscription;
  StreamSubscription<Event> _onTodoChangedSubscription;

  Query _todoQuery;

  

  @override
  void initState() {
    super.initState();

    

   
  }





  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  

 

 

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.purple[800],
          title: new Text('Pet Love'),
          actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: signOut)
          ],
        ),
        body: Center(child:Column(children: <Widget>[
        

          Container(
          
          padding: const EdgeInsets.fromLTRB(5, 150, 5, 5),
          
          child: RaisedButton (onPressed: (){

            Navigator.push(context, MaterialPageRoute (builder:(context)=> new Home_Page()));},
            child: Text('Customer',style: TextStyle(
                      fontSize:22.0,
                      fontWeight:FontWeight.bold,
                      color:Colors.white),),
                      color: Colors.purple[800],
                      ),
                      
        ),
       
        Container(
          padding: const EdgeInsets.fromLTRB(5, 50, 5, 5),
          child: RaisedButton (onPressed: (){

            Navigator.push(context, MaterialPageRoute (builder:(context)=> new Admin()));},
            child: Text('Administrator',style: TextStyle(
                      fontSize:22.0,
                      fontWeight:FontWeight.bold,
                      color:Colors.white),),
            color: Colors.purple[800],
            ),
        ),
        ],),
        
        ),
        
      
        );
  }
}
