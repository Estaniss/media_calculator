import 'package:flutter/material.dart';

class MediaCalculator extends StatefulWidget {
  @override
  State createState() => MediaCalculatorState();
  }

class MediaCalculatorState extends State<MediaCalculator>{

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController noteOne = TextEditingController();
  TextEditingController noteTwo = TextEditingController();
  TextEditingController noteThree = TextEditingController();

  String totalMedia = "";

  String calcNote() {
      double firstNote = double.tryParse(noteOne.text) ?? 0.0;
      double secondNote = double.tryParse(noteTwo.text) ?? 0.0;
      double thirdNote = double.tryParse(noteThree.text) ?? 0.0;
      double total = (firstNote + secondNote + thirdNote) / 3;

      return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
   return Container(
      alignment: Alignment.center,
      color: Colors.orangeAccent,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text(
            'Calculadora de Médias',
            style: TextStyle(
              color: Colors.white, // Set text color to white
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomTextField( labelText: "Digite o nome", controller: name,),
              CustomTextField( labelText: "Digite o email", controller: email,),
              Row(
                children: <Widget>[
                  Expanded(child: CustomTextField(labelText: "Nota 1",controller: noteOne,)),
                  Expanded(child: CustomTextField(labelText: "Nota 2",controller: noteTwo,)),
                  Expanded(child: CustomTextField(labelText: "Nota 3",controller: noteThree,)),
                ],
              ),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
                    minimumSize: MaterialStateProperty.all<Size>(Size(250, 40)),
                  ),
                  child: Text(
                    "Calcular Média",
                    style: TextStyle(color: Colors.white, fontSize: 17.0),
                  ),
                  onPressed: () {
                    setState(
                          () {
                            totalMedia =   calcNote();
                      },
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: Text("Resultados",
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.orangeAccent,),
                ),
              ),
          Row(
            children: <Widget>[
              Text("Nome: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)), Text(name.text),
              ]),
              Row(
                  children: <Widget>[
                    Text("Email: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)), Text(email.text),
                  ]),
              Row(
                  children: <Widget>[
                    Text("Notas: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                    Text('${noteOne.text} - ${noteTwo.text} - ${noteThree.text}')
                  ]),
              Row(
                  children: <Widget>[
                    Text("Média: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)), Text(totalMedia),
                  ]),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
                    minimumSize: MaterialStateProperty.all<Size>(Size(250, 40)),
                  ),
                  child: Text(
                    "Limpar dados",
                    style: TextStyle(color: Colors.white, fontSize: 17.0),
                  ),
                  onPressed: () {
                  setState( () {  name.text = "";
                  email.text = "";
                  noteOne.text = "";
                  noteTwo.text = "";
                  noteThree.text = "";
                  totalMedia = "";
                  } );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  CustomTextField({required this.labelText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 20 , left: 10,   right: 10),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(),
              labelText: labelText,
            ),
          ),
        ),
      ],
    );
  }
}

class FormButtons extends StatelessWidget {
  final String name;
  final String title;

  FormButtons({required this.name, required this.title});

  @override
  Widget build(BuildContext context) {
    var button = Container(
      margin: EdgeInsets.only(top: 50.0, left: 10.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          )),
        ),
        child: Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 15.0),
        ),
        onPressed: () {
        },
      ),
    );
    return button;
  }
  }

