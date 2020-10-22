import 'package:flutter/material.dart';

import 'beranda.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Login';

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final String nama = "tif1a", sandi = "politeknikkampar";
  final namaController = TextEditingController();
  final sandiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //yang ini untuk nama
Center(
  child: Padding(
padding: EdgeInsets.only(left: 20.0, right: 20.0),
child: Column(
        // mainAxisAlignment: MainAxisAligment.center,
        children: <Widget>[
          TextFormField(
            controller: namaController,
            decoration: InputDecoration(hintText: 'UserName'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Masukkan UserName';
              }
              return null;
            },
          ),
        ]
  )
)
),

          //Yang ini untuk sandi
          
Center(
  child: Padding(
  padding: EdgeInsets.only(left: 20.0, right: 20.0),
child: Column(
        // mainAxisAlignment: MainAxisAligment.center,
        children: <Widget>[
          TextFormField(
            controller: sandiController,
            obscureText: true,
            decoration: InputDecoration(hintText: "Password"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Masukkan Password';
              }
              return null;
            },
          ),
        ]))),

          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: RaisedButton(
              onPressed: () {
                if (namaController.text.trim() == nama &&
                    sandiController.text.trim() == sandi) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content:
                        Text('Maaf UserName atau Password Salah'),
                    action: SnackBarAction(
                      label: 'Selesai',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  ));
                }
              },
              child: Text('Login'),
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
