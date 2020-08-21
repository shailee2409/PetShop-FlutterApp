import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      height:80.0,
      child:ListView(
        scrollDirection:Axis.horizontal,
        children:<Widget>[
        Category(
          image_location:'images/dog.jpg',
          image_caption:'dog',
        ),
        Category(
          image_location:'images/cat.jpg',
          image_caption:'cat',
        ),
        Category(
          image_location:'images/birds.jpg',
          image_caption:'birds',
        ),
        Category(
          image_location:'images/rabbit.jpg',
          image_caption:'rabbit',
        ),
        Category(
          image_location:'images/fish.jpg',
          image_caption:'fish',
        ),
        Category(
          image_location:'images/tortoise.jpg',
          image_caption:'tortoise',
        ),
        Category(
          image_location:'images/horse.jpg',
          image_caption:'horse',
        ),
        ],//<Widget>
      ),//ListView
    );//Container
  }
}

class Category extends StatelessWidget{
  final String image_location;
  final String image_caption;
  
  Category({ this.image_location,this.image_caption});
  @override
  Widget build(BuildContext context){
    return Padding(padding:const EdgeInsets.all(2.0),
    child:InkWell(onTap:(){},
    child:Container(
      width:100.0,
      child:ListTile(
        title:Image.asset(image_location,
        width:100.0,
        height:50.0,),
        subtitle:Container(
          alignment:Alignment.topCenter,
          child:Text(image_caption,style:new TextStyle(fontSize:14.0),),
        ),//Container
      ),//ListTile
    ),//Container
    ),);//InkWell//padding
  }
}

