import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tes12345/controller/tes_controller.dart';
import 'package:tes12345/telepon.dart';

class HelloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello World",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HelloPage(title: 'Hello World'),
    );
  }
}

class HelloPage extends StatefulWidget {
  HelloPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HelloPage createState() => _HelloPage();
}

class _HelloPage extends State<HelloPage> {
  List<Telepon> _telepon = <Telepon>[];
  // List<String> _dinamis = <String>[];
  final TextEditingController _nameCon = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // _dinamis[0] = "nandi";
    _looping();
    // TODO: implement initState
    super.initState();
  }

  //kalau ada await harus ada async setelah nama fungsi
  void _looping() async {
    //fungsi await digunakan untk menunggu data Future didapat
    // var res = await TesController().getData();
    var res = [];
    for (var i = 0; i < res.length; i++) {
      // Telepon tempData = new Telepon();
      // tempData.setNama(res[i]['first_name']);
      // tempData.setNomor(res[i]['email']);

      Telepon tempData = new Telepon()
        ..setNama(res[i]['first_name'])
        ..setNomor(res[i]['email']);
      _telepon.add(tempData);
    }

    setState(() {
      // _telepon = _telepon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              controller: _nameCon,
              validator: (String s) {
                if (s != "") {
                  return "Nama tidak boleh kosong";
                }
                return null;
              },
            ),
            FlatButton(
              child: Text("Submit"),
              onPressed: (){
                if (_formKey.currentState.validate()) {
                  TesController().getData(name: _nameCon.text);
                }
              },
            )
          ]),
        )
        // body: ListView.builder(
        //   itemCount: _telepon.length,
        //   itemBuilder: (context, i) {
        //     return ListTile(
        //       title: Text(_telepon[i].getNama),
        //       subtitle: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: <Widget>[
        //           Text(_telepon[i].getNomor, textAlign: TextAlign.left,),
        //           Text("alamat", textAlign: TextAlign.right,),
        //         ],
        //       ),
        //     );
        //   },
        // ),
        );
  }
}
