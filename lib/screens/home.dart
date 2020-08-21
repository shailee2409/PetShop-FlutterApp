import 'package:flutter/material.dart';
import'package:carousel_pro/carousel_pro.dart';


import 'package:pet_shop_app/screens/products.dart';

import 'package:pet_shop_app/screens/cart.dart';
import 'package:pet_shop_app/screens/horizontal_listview.dart';




class Home_Page extends StatefulWidget{
  @override
  _HomePageState createState()=>_HomePageState();
}

class _HomePageState extends State<Home_Page>{
  @override
  Widget build (BuildContext context){
  Widget image_carousel=new Container(
    height:280.0,
    child: new Carousel(
      boxFit:BoxFit.cover,
      images:[
        AssetImage('images/dogcat_ad.jpg'),
        AssetImage('images/fish_ad2.jpg'),
        AssetImage('images/dog_ad1.jpg'),
        AssetImage('images/horse_ad1.jpg'),
        AssetImage('images/cat_ad1.jpg'),
        AssetImage('images/birds_ad1.jpg'),
      ],
      autoplay:true,
      animationCurve:Curves.fastOutSlowIn,
      animationDuration:Duration(milliseconds:1000),
      dotSize:4.0,
      indicatorBgPadding:2.0,
      dotBgColor:Colors.transparent,
    ),
  );
    
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor:Colors.purple[800],
        title:Text('Pet Love'),
        actions:<Widget>[
          new IconButton(icon: Icon(Icons.search,color:Colors.white,),onPressed:(){}),
          new IconButton(icon: Icon(Icons.shopping_cart ,color:Colors.white,),onPressed:(){
Navigator.push(context, MaterialPageRoute (builder:(context)=> new Cart()));})
        ],
      ),	
      drawer:new Drawer(
        child:new ListView(
          children:<Widget>[
              //header
            new UserAccountsDrawerHeader(
              accountName:Text('Shailee Sheth'),
              accountEmail:Text('shethshailee147@gmail.com'),
            currentAccountPicture:GestureDetector(
              child:new CircleAvatar(
                backgroundColor:Colors.grey,
                child:Icon(Icons.person,color:Colors.white,),
              ),
            ),
            decoration:new BoxDecoration(
              color:Colors.purple[800]
            ),
            ),
            //body
            InkWell(
              onTap:(){},
              child: ListTile(
                title:Text('Home Page'),
                leading:Icon(Icons.home),
            ),
           ),
            InkWell(
              onTap:(){},
              child: ListTile(
                title:Text('My account'),
                leading:Icon(Icons.person),
            ),
           ),
            InkWell(
              onTap:(){},
              child: ListTile(
                title:Text('My Orders'),
                leading:Icon(Icons.shopping_basket),
            ),
           ),
            InkWell(
              onTap:(){
Navigator.push(context, MaterialPageRoute(builder:(context) => new Cart() ));
            },
              child: ListTile(
                title:Text('Shopping cart'),
                leading:Icon(Icons.shopping_cart, color:Colors.red,),
            ),
           ),
            InkWell(
              onTap:(){},
              child: ListTile(
                title:Text('Favourites'),
                leading:Icon(Icons.favorite),
            ),
           ),
            Divider(),
            
            InkWell(
              onTap:(){},
              child: ListTile(
                title:Text('Settings'),
                leading:Icon(Icons.settings,color:Colors.blue,),
            ),
           ),
            InkWell(
              onTap:(){},
              child: ListTile(
                title:Text('About'),
                leading:Icon(Icons.help, color:Colors.green,),
            ),
           ),
          ],
        ),
      ),
      body:new ListView(
        children:<Widget>[
          image_carousel,
          new Padding(padding:const EdgeInsets.all(8.0),
          child:new Text('Categories',style:TextStyle(color:Colors.red[600],fontWeight:FontWeight.bold,fontSize:18.0),),),//padding
          
          //Horizontal list view
          HorizontalList(),

          new Padding(padding:const EdgeInsets.all(20.0),
          child:new Text('Recent Products', style:TextStyle(color:Colors.red[600],fontWeight:FontWeight.bold,fontSize:18.0)),),//padding
          
          Container(
            child:Products(),
          ),

        ],
      ),
    ); 
  }
}
