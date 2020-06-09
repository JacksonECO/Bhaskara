import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController aControle = TextEditingController();
  TextEditingController bControle = TextEditingController();
  TextEditingController cControle = TextEditingController();
  String _infoText="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bhaskara"),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                aControle.text="";
                bControle.text="";
                cControle.text="";
                setState(() {
                  _infoText="";
                });
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                "images/ima.png",
                fit: BoxFit.fitHeight,
                height: 120,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "a(x^2):",
                    labelStyle: TextStyle(color: Colors.deepOrange)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepOrange, fontSize: 25),
                controller: aControle,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "b(x):",
                    labelStyle: TextStyle(color: Colors.deepOrange)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepOrange, fontSize: 25),
                controller: bControle,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "c:",
                    labelStyle: TextStyle(color: Colors.deepOrange)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepOrange, fontSize: 25),
                controller: cControle,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                child: RaisedButton(
                  onPressed: () {

                    if(aControle.text == ""){
                      aControle.text="0";
                    }
                    if(bControle.text == ""){
                      bControle.text="0";
                    }
                    if(cControle.text == ""){
                      cControle.text="0";
                    }

                    double a= double.parse(aControle.text);
                    double b= double.parse(bControle.text);
                    double c= double.parse(cControle.text);

                    double delta = b*b-4*a*c;
                    double x1 = (-b+sqrt(delta))/2*a;
                    double x2 = (-b-sqrt(delta))/2*a;
                    double xv = (-b/(2*a));
                    double yv = (-delta/(4*a));


                    setState(() {
                      if(delta<0){
                        _infoText="\nNão existe raiz Real";
                      }
                      if(delta==0){
                        _infoText="\nPossue raiz unica de valor: $x1";
                      }
                      if(delta>0){
                        _infoText="\nPossue duas raizes de valores iguais a: $x1 e $x2";
                      }

                      _infoText+="\n\nCoordenadas do vertice:\nXv: $xv\nYv: $yv";



                    });
                  },
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  color: Colors.deepOrange,
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepOrange, fontSize: 25.0),
              )
            ],
          ),
        ));
  }
}
