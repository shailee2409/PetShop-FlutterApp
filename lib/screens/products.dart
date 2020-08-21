import 'package:flutter/material.dart';
import'package:pet_shop_app/screens/product_details.dart';

class Products extends StatefulWidget{
  @override
  _ProductsState createState()=>_ProductsState();
}

class _ProductsState extends State<Products>{
  var product_list=[
    {
      "name":"Aquarim",
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
   
  ];
  @override
  Widget build (BuildContext context){
    return GridView.builder(
      itemCount:product_list.length,
      gridDelegate:new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2), 
      shrinkWrap: true,
      itemBuilder:(BuildContext context,int index){
        return Padding(
        padding: const EdgeInsets.all(4.0),
        child:Single_prod(
        	prod_name:product_list[index]['name'],
        	prod_picture:product_list[index]['picture'],
        	prod_old_price:product_list[index]['old_price'],
        	prod_price:product_list[index]['price'],
        ),);
        }, 
        );

  }
  
}


class Single_prod extends StatelessWidget{
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;
  
  Single_prod({
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
            ))),//when clicked gives another page
                          
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
