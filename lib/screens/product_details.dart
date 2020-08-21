import'package:flutter/material.dart';
//import'package:/shop_app/main.dart';

import 'home.dart';	

class ProductDetails extends StatefulWidget{
  final product_detail_name;
  final product_detail_picture;
  final product_detail_old_price;
  final product_detail_price;
  
  ProductDetails({
    this.product_detail_name,
    this.product_detail_picture,
    this.product_detail_old_price,
    this.product_detail_price,
  });
  
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}


class _ProductDetailsState extends State<ProductDetails>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
    appBar: new AppBar(
        elevation: 0.1,
        backgroundColor:Colors.purple[800],
        title:InkWell(
          onTap:(){Navigator.push(context, MaterialPageRoute(builder:(context)=> new Home_Page()));},
          child:Text('Pet Love'),),
        actions:<Widget>[
          new IconButton(icon: Icon(Icons.search,color:Colors.white,),onPressed:(){}),
         
        ],
      ),
      
      body:new ListView(
        children:<Widget>[
            new Container(
              height:300.0,
              child:GridTile(
                child:Container(
                  color:Colors.white,
                  child:Image.asset(widget.product_detail_picture),
                ),
              footer:new Container(
                color:Colors.white70,
                child:ListTile(
                  leading:new Text(widget.product_detail_name ,style:TextStyle(fontWeight:FontWeight.bold,fontSize:16.0),),
                  title: new Row(
                    children:<Widget>[
                      Expanded(
                        child: new Text("${widget.product_detail_old_price}",
                        style:TextStyle(
                          color:Colors.grey,
                          decoration:TextDecoration.lineThrough,),),
                      ),
                       Expanded(
                        child: new Text("${widget.product_detail_price}",
                                   style:TextStyle(
                                   fontWeight:FontWeight.bold,
                                   color:Colors.red)),
                      ),
                    ],
                  ),
                ),
              ),
              )
            ),
          //====first button =====
            Row(
              children:<Widget>[
               // =====size button====
                Expanded(
                child:MaterialButton(
                  onPressed:(){
                    showDialog(context:context,
                    builder:(context){
                      return new AlertDialog(
                        title: new Text("Size"),
                        content:new Text("Choose the size"),
                        actions:<Widget>[
                          new MaterialButton(onPressed:(){
                            Navigator.of(context).pop(context);
                          },
                          child:new Text("close"),
                          )
                        ],
                      );
                    }); 
                },
                color:Colors.white,
                textColor:Colors.grey,
                  elevation:0.2,
                child:Row(
                  children:<Widget>[
                    Expanded(
                      child:new Text("Size")
                    ),
                    

                    Expanded(
                      child:new Icon(Icons.arrow_drop_down),
                    ),   
                  ],
                ),
                 ),
                ),
              
              // ====quantity button====
                Expanded(
                child:MaterialButton(
                  onPressed:(){
                    showDialog(context:context,
                    builder:(context){
                      return new AlertDialog(
                        title: new Text("Quantity"),
                        content:new Text("Choose the Quantity"),
                        actions:<Widget>[
                        
                          new MaterialButton(onPressed:(){
                            Navigator.of(context).pop(context);
                          },
                          child:new Text("close"),),

                          
                        ],
                      );
                    }); 
                },
                color:Colors.white,
                textColor:Colors.grey,
                  elevation:0.2,
                child:Row(
                  children:<Widget>[
                    Expanded(
                      child:new Text("Quantity")
                    ),
                    
                    Expanded(
                      child:new Icon(Icons.arrow_drop_down),
                    ),   
                  ],
                ),
                 ),
                ),








              ],
            ),
            
            //====second button =====
            Row(
              children:<Widget>[
               // =====buy now button====
                Expanded(
                child:MaterialButton(onPressed:(){},
                color:Colors.red,
                textColor:Colors.white,
                  elevation:0.2,
                 child:new Text("Buy now"),
                 ),
                ),
              ],
            ),
          
          //====third button====
          Row(
              children:<Widget>[
               // =====add to cart====
                Expanded(
                child:MaterialButton(onPressed:(){},
                color:Colors.red,
                  elevation:0.2,
                 child:new IconButton(
                  icon: Icon(Icons.add_shopping_cart,
                             color:Colors.white,),onPressed:(){}
                  ),
                 ),
                ),
              
                /*Padding(
                  child: Expanded(
                child:MaterialButton(onPressed:(){},
                color:Colors.red,
                  elevation:0.2,
                 child:new IconButton(
                  icon: Icon(Icons.favorite_border,
                             color:Colors.white,),onPressed:(){}
                  ),
                 ),
                ), padding: const EdgeInsets.only(left:50),),  */ 
              ],
            ),
          Divider(),
          new ListTile(
            title: new Text("Product Details"),
            subtitle: new Text("dfxdsghxdswedrftgyhj kl;kmnjbhgvfdsertyuijkmnbvcfdxswertyuijknhbgvfcdesrtyuhjkmnjhbgv ertyuhjknbvgfrtyujiklmnjbhgvfgftyhujkm gdftyguijkl,mnbvgvhjkl"),
          ),
          Divider(),
          new Row(
            children:<Widget>[
              Padding(padding:const EdgeInsets.fromLTRB(12.0,5.0,5.0,5.0),
              child:new Text(
                  "Product name etc", style:TextStyle(color:Colors.grey),),),
              Padding(padding:EdgeInsets.all(5.0),
              child:new Text (widget.product_detail_name),),
            ],
          ),
          
          Divider(),
          Padding(
            padding:const EdgeInsets.all(8.0),  
          child:new Text("Similar Products"),),
          
          //similar products section
          Container(
            height:340.0,
            child:Similar_products(),
          ),
          
        ],
      ),

    );
  }
}

class Similar_products extends StatefulWidget{
  @override
  _Similar_productsState createState()=> _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products>{
    var product_list=[
    {
      "name":"Aquarium",
      "picture":"images/fish_ad_aq.jpg",
      "old_price":120,
      "price":85,
    },
     {
      "name":"Rabbit home",
      "picture":"images/rabbit_ad.jpg",
      "old_price":100,
      "price":65,
    },
    {
      "name":"3",
      "picture":"images/dog_belt.jpg",
      "old_price":100,
      "price":65,
    },
    {
      "name":"4",
      "picture":"images/cat_food.jpg",
      "old_price":100,
      "price":65,
    },
  ];
  @override
  Widget build (BuildContext context){
    return GridView.builder(
      itemCount:product_list.length,
      gridDelegate:new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:2), 
      itemBuilder:(BuildContext context,int index){
        return Similar_Single_prod(
        prod_name:product_list[index]['name'],
        prod_picture:product_list[index]['picture'],
        prod_old_price:product_list[index]['old_price'],
        prod_price:product_list[index]['price'],
        );
      });
  }
}


class Similar_Single_prod extends StatelessWidget{
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;
  
  Similar_Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
  });
    @override
    Widget build(BuildContext context){
      return Card(
        child:Hero(
          tag:new Text("hero 1"),
          child:Material(
            child:InkWell(onTap:()=>Navigator.of(context).push(new MaterialPageRoute(
	//passing the values of the product to the product detail page
                builder:(context) => new ProductDetails(
product_detail_name: prod_name,
product_detail_picture: prod_picture,
product_detail_price: prod_price,
product_detail_old_price: prod_old_price,
),),),//when clicked gives another page
                          
            child:GridTile(
              footer:Container(
                color:Colors.white70,
                child:new Row(children:<Widget>[
                  Expanded(
                    child:Text(prod_name,style:TextStyle(fontWeight:FontWeight.bold,fontSize:10.0)),
                  ),
                  
                  new Text("\$${prod_price}",style:TextStyle(color:Colors.red),)
                ],),
              ),
              child:Image.asset(
                prod_picture,
                fit:BoxFit.cover),),
           ),
          ),
        ),
     	
      );	
    }
  
}




