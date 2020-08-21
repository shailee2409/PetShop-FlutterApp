import 'package:flutter/cupertino.dart';

import'package:flutter/material.dart';
    
class Cart_products extends StatefulWidget{
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products>{
  var Products_on_the_cart=[
    {
      "name":"Aquarium",
      "picture":"images/fish_ad_aq.jpg",
      "price":85,
      "size":"L",
    },
     {
      "name":"Rabbit home",
      "picture":"images/rabbit_ad.jpg",
      "price":65,
       "size":"M",
    },
  ];
  
  @override
  Widget build(BuildContext context){
    return new ListView.builder(
      itemCount:2,
      itemBuilder:(context, index){
        return Single_cart_product(
        
        cart_prod_name:Products_on_the_cart[index]["name"],
        cart_prod_size:Products_on_the_cart[index]["size"],
        cart_prod_price:Products_on_the_cart[index]["price"],
        cart_prod_picture:Products_on_the_cart[index]["picture"],
        );
        
      }
    
    );
  }
}
    
class Single_cart_product extends StatelessWidget{
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  
  Single_cart_product({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_size,
       
  });
  
  
  @override
  Widget build(BuildContext context){
    return Card(
      child:ListTile(
        leading: new Image.asset(cart_prod_picture, width:80.0, height:80.0,),
        title: new Text(cart_prod_name),
        subtitle: new Column(
          children:<Widget>[
            new Row(
              children:<Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child:new Text("size"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child:new Text(cart_prod_size, style:TextStyle(color:Colors.red)),
                ),
                /*new Padding(padding:const EdgeInsets.fromTRB(20.0,8.0,8.0,8.0),
                  child: new Text("color"),),
                
                  Padding(
                  padding: const EdgeInsets.all(4.0),
                  child:new Text(cart_prod_color),
                ),*/
              
                new Container(
                  alignment:Alignment.topLeft,
                  child:new Text(
                    "\$${cart_prod_price}", 
                    style:TextStyle(
                      fontSize:17.0,
                      fontWeight:FontWeight.bold,
                      color:Colors.red),),
                
                ),
              ],
            
            ),
            
          ],
        
        ),
        /*trailing: new Column(
          children:<Widget>[
            new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed:(){}),
            new Text("$cart_prod_qty"),
            new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed:(){}),
            
          ],
        ),*/
        
      ),
       
    );
       
       
  }
  
 
}
   
