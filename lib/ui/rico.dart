import 'package:flutter/material.dart';
import 'dart:math';

class Rico extends StatefulWidget {
  @override
  _RicoState createState() => _RicoState();
}

//classe interna do tipo State, que recebe a Class Rico
class _RicoState extends State<Rico> {
  double _contador = 10;

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("VOCÊ FALIU"),
          content: Text("Você perdeu tudo, faliu."),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Fechar"),
            ),
          ],
        );
      }, // Builder
    ); // ShowDialog
  } //_showDialog

  void _maisGrana() {
    //método responsável pela atualização (valores) da nossa tela
    setState(() {
      Random sorteio = new Random();
      int min = 1;
      int max = 5;
      int r = min + sorteio.nextInt(max - min);

      if (r == 1) {
        _contador = _contador + 100;
        print("$r -> $_contador");
      } else if (r == 2 && _contador > 0) {
        _contador = _contador * 2;
        print("$r -> $_contador");
      } else if (r == 2 && _contador <= 0) {
        _contador += 10;
        print("$r -> $_contador");
      } else if (r == 3 && _contador > 0) {
        _contador = _contador / 2;
        print("$r -> $_contador");
      } else if (r == 4) {
        _contador = 0;
        print("$r -> $_contador");
      }
      if (_contador <= 0) {
        _showDialog();
        _contador = 10;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //"builda" a tela(ui)
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Rico App",
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Column(
            children: <Widget>[
              //Título do App
              Expanded(
                child: Center(
                  child: Text(
                    "Venha ficar rico !!!",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange),
                  ),
                ),
              ),
              //valor dinheiro
              Expanded(
                child: Center(
                  child: Text(
                    "R\$ $_contador",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: _contador >= 500 ? Colors.red : Colors.green,
                    ),
                  ),
                ),
              ),
              //botão de ação
              Expanded(
                child: Center(
                  child: FlatButton(
                    onPressed: _maisGrana,
                    color: Colors.orange,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Mais Grana !!!",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
