import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_shop_app/db/product.dart';
import '../db/category.dart';
import '../db/brand.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  CategoryService _categoryService = CategoryService();
  BrandService _brandService = BrandService();
  ProductService productService = ProductService();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController productNameController = TextEditingController();
  TextEditingController quatityController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final priceController = TextEditingController();
  List<DocumentSnapshot> brands = <DocumentSnapshot>[];
  List<DocumentSnapshot> categories = <DocumentSnapshot>[];
  List<DropdownMenuItem<String>> categoriesDropDown =
      <DropdownMenuItem<String>>[];
  List<DropdownMenuItem<String>> brandsDropDown = <DropdownMenuItem<String>>[];
  String _currentCategory;
  String _currentBrand;
  Color white = Colors.white;
  Color black = Colors.black;
  Color grey = Colors.grey;
  Color red = Colors.red;
  Color purple = Colors.purple[800];
  List<String> selectedSizes = <String>[];
  File _image1;
  File _image2;
  File _image3;
  bool isLoading = false;

  @override
  void initState() {
    _getCategories();
    _getBrands();
  }

  List<DropdownMenuItem<String>> getCategoriesDropdown() {
    List<DropdownMenuItem<String>> items = new List();
    for (int i = 0; i < categories.length; i++) {
      setState(() {
        items.insert(
            0,
            DropdownMenuItem(
                child: Text(categories[i].data['category']),
                value: categories[i].data['category']));
      });
    }
    return items;
  }

  List<DropdownMenuItem<String>> getBrandosDropDown() {
    List<DropdownMenuItem<String>> items = new List();
    for (int i = 0; i < brands.length; i++) {
      setState(() {
        items.insert(
            0,
            DropdownMenuItem(
                child: Text(brands[i].data['brand']),
                value: brands[i].data['brand']));
      });
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: purple,
        leading: Icon(
          Icons.close,
          color: white,
        ),
        title: Text(
          "add product",
          style: TextStyle(color: white),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: isLoading
              ? CircularProgressIndicator()
              : Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OutlineButton(
                                borderSide: BorderSide(
                                    color: grey.withOpacity(0.5), width: 2.5),
                                onPressed: () {
                                  _selectImage(
                                      ImagePicker.pickImage(
                                          source: ImageSource.gallery),
                                      1);
                                },
                                child: _displayChild1()),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OutlineButton(
                                borderSide: BorderSide(
                                    color: grey.withOpacity(0.5), width: 2.5),
                                onPressed: () {
                                  _selectImage(
                                      ImagePicker.pickImage(
                                          source: ImageSource.gallery),
                                      2);
                                },
                                child: _displayChild2()),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OutlineButton(
                              borderSide: BorderSide(
                                  color: grey.withOpacity(0.5), width: 2.5),
                              onPressed: () {
                                _selectImage(
                                    ImagePicker.pickImage(
                                        source: ImageSource.gallery),
                                    3);
                              },
                              child: _displayChild3(),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'enter a product name with 10 characters at maximum',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: red, fontSize: 12),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                      child: TextFormField(
                        controller: productNameController,
                        decoration: InputDecoration(hintText: 'Product name'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'You must enter the product name';
                          } else if (value.length > 10) {
                            return 'Product name cant have more than 10 letters';
                          }
                        },
                      ),
                    ),

//              select category
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Category: ',
                            style: TextStyle(color: purple,fontWeight: FontWeight.bold),
                          ),
                        ),
                        DropdownButton(
                          items: categoriesDropDown,
                          onChanged: changeSelectedCategory,
                          value: _currentCategory,
                        ),

                      
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Brand: ',
                            style: TextStyle(color: purple, fontWeight: FontWeight.bold),
                          ),
                        ),
                        DropdownButton(
                          items: brandsDropDown,
                          onChanged: changeSelectedBrand,
                          value: _currentBrand,
                        ),
                      ],
                    ),

//
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                      child: TextFormField(
                        controller: quatityController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Quantity',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'You must enter the product name';
                          }
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(12,5, 12, 5),
                      child: TextFormField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Price',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'You must enter the product name';
                          }
                        },
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.fromLTRB(12,5, 12, 5),
                      child: TextFormField(
                        controller: descriptionController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Decription',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'You must enter the description of the product ';
                          }
                        },
                      ),
                    ),
                    Text('Available Sizes',style: TextStyle(color: purple,fontWeight: FontWeight.bold),),

                    Row(
                      children: <Widget>[
                        Checkbox(
                            value: selectedSizes.contains('S'),
                            onChanged: (value) => changeSelectedSize('S')),
                        Text('S'),
                        Checkbox(
                            value: selectedSizes.contains('M'),
                            onChanged: (value) => changeSelectedSize('M')),
                        Text('M'),
                        Checkbox(
                            value: selectedSizes.contains('L'),
                            onChanged: (value) => changeSelectedSize('L')),
                        Text('L'),
                        Checkbox(
                            value: selectedSizes.contains('XL'),
                            onChanged: (value) => changeSelectedSize('XL')),
                        Text('XL'),
                        
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        Checkbox(
                            value: selectedSizes.contains('1kg'),
                            onChanged: (value) => changeSelectedSize('1kg')),
                        Text('1kg'),
                        Checkbox(
                            value: selectedSizes.contains('1.5kg'),
                            onChanged: (value) => changeSelectedSize('1.5kg')),
                        Text('1.5kg'),
                        Checkbox(
                            value: selectedSizes.contains('2kg'),
                            onChanged: (value) => changeSelectedSize('2kg')),
                        Text('2kg'),
                        Checkbox(
                            value: selectedSizes.contains('2.5kg'),
                            onChanged: (value) => changeSelectedSize('2.5kg')),
                        Text('2.5kg'),
                        Checkbox(
                            value: selectedSizes.contains('5kg'),
                            onChanged: (value) => changeSelectedSize('5kg')),
                        Text('5kg'), 
                      ],
                    ),

                   
                    FlatButton(
                      color: Colors.purple[800],
                      textColor: white,
                      child: Text('add product'),
                      onPressed: () {
                        validateAndUpload();
                      },
                    )
                  ],
                ),
        ),
      ),
    );
  }

  _getCategories() async {
    List<DocumentSnapshot> data = await _categoryService.getCategories();
    print(data.length);
    setState(() {
      categories = data;
      categoriesDropDown = getCategoriesDropdown();
      _currentCategory = categories[0].data['category'];
    });
  }

  _getBrands() async {
    List<DocumentSnapshot> data = await _brandService.getBrands();
    print(data.length);
    setState(() {
      brands = data;
      brandsDropDown = getBrandosDropDown();
      _currentBrand = brands[0].data['brand'];
    });
  }

  changeSelectedCategory(String selectedCategory) {
    setState(() => _currentCategory = selectedCategory);
  }

  changeSelectedBrand(String selectedBrand) {
    setState(() => _currentCategory = selectedBrand);
  }

  void changeSelectedSize(String size) {
    if (selectedSizes.contains(size)) {
      setState(() {
        selectedSizes.remove(size);
      });
    } else {
      setState(() {
        selectedSizes.insert(0, size);
      });
    }
  }

  void _selectImage(Future<File> pickImage, int imageNumber) async {
    File tempImg = await pickImage;
    switch (imageNumber) {
      case 1:
        setState(() => _image1 = tempImg);
        break;
      case 2:
        setState(() => _image2 = tempImg);
        break;
      case 3:
        setState(() => _image3 = tempImg);
        break;
    }
  }

  Widget _displayChild1() {
    if (_image1 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: new Icon(
          Icons.add,
          color: grey,
        ),
      );
    } else {
      return Image.file(
        _image1,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _displayChild2() {
    if (_image2 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: new Icon(
          Icons.add,
          color: grey,
        ),
      );
    } else {
      return Image.file(
        _image2,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _displayChild3() {
    if (_image3 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: new Icon(
          Icons.add,
          color: grey,
        ),
      );
    } else {
      return Image.file(
        _image3,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  void validateAndUpload() async {
    if (_formKey.currentState.validate()) {
      setState(() => isLoading = true);
      if (_image1 != null && _image2 != null && _image3 != null) {
        if (selectedSizes.isNotEmpty) {
          String imageUrl1;
          String imageUrl2;
          String imageUrl3;

          final FirebaseStorage storage = FirebaseStorage.instance;
          final String picture1 =
              "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task1 =
              storage.ref().child(picture1).putFile(_image1);
          final String picture2 =
              "2${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task2 =
              storage.ref().child(picture2).putFile(_image2);
          final String picture3 =
              "3${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task3 =
              storage.ref().child(picture3).putFile(_image3);

          StorageTaskSnapshot snapshot1 =
              await task1.onComplete.then((snapshot) => snapshot);
          StorageTaskSnapshot snapshot2 =
              await task2.onComplete.then((snapshot) => snapshot);

          task3.onComplete.then((snapshot3) async {
            imageUrl1 = await snapshot1.ref.getDownloadURL();
            imageUrl2 = await snapshot2.ref.getDownloadURL();
            imageUrl3 = await snapshot3.ref.getDownloadURL();
            List<String> imageList = [imageUrl1, imageUrl2, imageUrl3];

            productService.uploadProduct({
              "name":productNameController.text,
              "price":double.parse(priceController.text),
              "sizes":selectedSizes,
              "images":imageList,
              "quantity":int.parse(quatityController.text),
              "brand":_currentBrand,
              "category":_currentCategory
            });
            _formKey.currentState.reset();
            setState(() => isLoading = false);
//            Fluttertoast.showToast(msg: 'Product added');
            Navigator.pop(context);
          });
        } else {
          setState(() => isLoading = false);

//          Fluttertoast.showToast(msg: 'select atleast one size');
        }
      } else {
        setState(() => isLoading = false);

//        Fluttertoast.showToast(msg: 'all the images must be provided');
      }
    }
  }
}
