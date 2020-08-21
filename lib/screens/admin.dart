import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:pet_shop_app/screens/add_product.dart';
import '../db/category.dart';
import '../db/brand.dart';

enum Page { dashboard, manage }

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Page _selectedPage = Page.dashboard;
  MaterialColor active = Colors.red;
  MaterialColor notActive = Colors.grey;
  TextEditingController categoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  GlobalKey<FormState> _categoryFormKey = GlobalKey();
  GlobalKey<FormState> _brandFormKey = GlobalKey();
  BrandService _brandService = BrandService();
  CategoryService _categoryService = CategoryService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Expanded(
                  child: FlatButton.icon(
                      onPressed: () {
                        setState(() => _selectedPage = Page.dashboard);
                      },
                      icon: Icon(
                        Icons.dashboard,
                        color: _selectedPage == Page.dashboard
                            ? active
                            : notActive,
                      ),
                      label: Text('Dashboard',style: TextStyle(color:Colors.white,)))),
              Expanded(
                  child: FlatButton.icon(
                      onPressed: () {
                        setState(() => _selectedPage = Page.manage);
                      },
                      icon: Icon(
                        Icons.sort,
                        color:
                            _selectedPage == Page.manage ? active : notActive,
                      ),
                      label: Text('Manage',style: TextStyle(color:Colors.white,) ))),
            ],
          ),
          elevation: 0.0,
          backgroundColor: Colors.purple,
        ),
        body: _loadScreen());
  }

  Widget _loadScreen() {
    switch (_selectedPage) {
      case Page.dashboard:
        return Column(
          children: <Widget>[
            ListTile(
              subtitle: FlatButton.icon(
                onPressed: null,
                icon: Icon(
                  Icons.attach_money,
                  size: 25.0,
                  color: Colors.green,
                ),
                label: Text('12,000',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25.0, color: Colors.green)),
              ),
              title: Text(
                'Revenue',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
            ),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.people_outline, color: Colors.purple[800],),
                              label: Text("Users", style: TextStyle(color:Colors.purple[800],),)),
                          subtitle: Text(
                            '7',
                            textAlign: TextAlign.center,
                            style: TextStyle(color:Colors.purple[800], fontSize: 50.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.category, color: Colors.purple[800],),
                              label: Text("Categories",style: TextStyle(color:Colors.purple[800],),)),
                          subtitle: Text(
                            '23',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.purple[800], fontSize: 50.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.track_changes, color: Colors.purple[800],),
                              label: Text("Producs",style: TextStyle(color:Colors.purple[800],),)),
                          subtitle: Text(
                            '120',
                            textAlign: TextAlign.center,
                            style: TextStyle( color: Colors.purple[800], fontSize: 50.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.tag_faces, color: Colors.purple[800],),
                              label: Text("Sold",style: TextStyle(color:Colors.purple[800],))),
                          subtitle: Text(
                            '13',
                            textAlign: TextAlign.center,
                            style: TextStyle( color: Colors.purple[800],fontSize: 50.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.shopping_cart, color: Colors.purple[800],),
                              label: Text("Orders",style: TextStyle(color:Colors.purple[800],))),
                          subtitle: Text(
                            '5',
                            textAlign: TextAlign.center,
                            style: TextStyle( color: Colors.purple[800], fontSize: 50.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.close, color: Colors.purple[800],),
                              label: Text("Return",style: TextStyle(color:Colors.purple[800],))),
                          subtitle: Text(
                            '0',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.purple[800],fontSize: 50.0),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
        break;
      case Page.manage:
        return ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.add, color: Colors.purple[800],),
              title: Text("Add product",style: TextStyle(color: Colors.purple[800],fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => AddProduct()));
              },
            ),
            /*Divider(),
            ListTile(
              leading: Icon(Icons.change_history, color: Colors.purple[800],),
              title: Text("Products list",style: TextStyle(color: Colors.purple[800],fontWeight: FontWeight.bold),),
              onTap: () {
                
              },
            ),*/
            Divider(),
            ListTile(
              leading: Icon(Icons.add_circle, color: Colors.purple[800],),
              title: Text("Add category",style: TextStyle(color: Colors.purple[800],fontWeight: FontWeight.bold),),
              onTap: () {
                _categoryAlert();
              },
            ),
            /*Divider(),
            ListTile(
              leading: Icon(Icons.category, color: Colors.purple[800],),
              title: Text("Category list",style: TextStyle(color: Colors.purple[800],fontWeight: FontWeight.bold),),
              onTap: () {},
            ),*/
            Divider(),
            ListTile(
              leading: Icon(Icons.add_circle_outline, color: Colors.purple[800],),
              title: Text("Add brand",style: TextStyle(color: Colors.purple[800],fontWeight: FontWeight.bold),),
              onTap: () {
                _brandAlert();
              },
            ),
            /*Divider(),
            ListTile(
              leading: Icon(Icons.library_books, color: Colors.purple[800],),
              title: Text("brand list",style: TextStyle(color: Colors.purple[800],fontWeight: FontWeight.bold),),
              onTap: () {
                _brandService.getBrands();
              },
            ),*/
            Divider(),
          ],
        );
        break;
      default:
        return Container();
    }
  }

  void _categoryAlert() {
    var alert = new AlertDialog(
      content: Form(
        key: _categoryFormKey,
        child: TextFormField(
          controller: categoryController,
          validator: (value){
            if(value.isEmpty){
              return 'category cannot be empty';
            }
          },
          decoration: InputDecoration(
            hintText: "add category"
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(onPressed: (){
          if(categoryController.text != null){
            _categoryService.createCategory(categoryController.text);
          }
//          Fluttertoast.showToast(msg: 'category created');
          Navigator.pop(context);
        }, child: Text('ADD')),
        FlatButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('CANCEL')),

      ],
    );

    showDialog(context: context, builder: (_) => alert);
  }

  void _brandAlert() {
    var alert = new AlertDialog(
      content: Form(
        key: _brandFormKey,
        child: TextFormField(
          controller: brandController,
          validator: (value){
            if(value.isEmpty){
              return 'category cannot be empty';
            }
          },
          decoration: InputDecoration(
              hintText: "add brand"
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(onPressed: (){
          if(brandController.text != null){
            _brandService.createBrand(brandController.text);
          }
//          Fluttertoast.showToast(msg: 'brand added');
          Navigator.pop(context);
        }, child: Text('ADD')),
        FlatButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('CANCEL')),

      ],
    );

    showDialog(context: context, builder: (_) => alert);
  }


  
}


