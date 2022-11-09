import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: const <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 25.0,
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 250, 249, 249),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Flute",
                  style: TextStyle(
                    fontSize: 20.0,
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 250, 249, 249),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Discription",
                  style: TextStyle(
                    fontSize: 25.0,
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 250, 249, 249),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "...",
                  style: TextStyle(
                    fontSize: 20.0,
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 250, 249, 249),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Period",
                  style: TextStyle(
                    fontSize: 25.0,
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 250, 249, 249),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "1790-1830",
                  style: TextStyle(
                    fontSize: 20.0,
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 250, 249, 249),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Classification",
                  style: TextStyle(
                    fontSize: 25.0,
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 250, 249, 249),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "String",
                  style: TextStyle(
                    fontSize: 20.0,
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 250, 249, 249),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
