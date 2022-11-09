import 'package:flutter/material.dart';

void main() => runApp(const MusicianPage());

class MusicianPage extends StatelessWidget {
  const MusicianPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black54,
        // ignore: sized_box_for_whitespace
        body: Container(
          padding: const EdgeInsets.all(16.0),
          width: width,
          child: DataTable(
            columnSpacing: 0,
            horizontalMargin: 0,
            columns: [
              DataColumn(
                // ignore: sized_box_for_whitespace
                label: Container(
                  width: width * .4,
                  child: const Text("Name",
                      style:
                          TextStyle(color: Color.fromARGB(255, 250, 249, 249))),
                ),
              ),
              DataColumn(
                // ignore: sized_box_for_whitespace
                label: Container(
                  width: width * .3,
                  child: const Text("Birth",
                      style:
                          TextStyle(color: Color.fromARGB(255, 250, 249, 249))),
                ),
              ),
              DataColumn(
                // ignore: sized_box_for_whitespace
                label: Container(
                  width: width * .3,
                  child: const Text("Death",
                      style:
                          TextStyle(color: Color.fromARGB(255, 250, 249, 249))),
                ),
              ),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('Koning Albert',
                    style:
                        TextStyle(color: Color.fromARGB(255, 250, 249, 249)))),
                DataCell(Text('(*) 1916',
                    style:
                        TextStyle(color: Color.fromARGB(255, 250, 249, 249)))),
                DataCell(Text('(+) 1982',
                    style:
                        TextStyle(color: Color.fromARGB(255, 250, 249, 249)))),
              ]),
              DataRow(cells: [
                DataCell(Text('Koning Johanes',
                    style:
                        TextStyle(color: Color.fromARGB(255, 250, 249, 249)))),
                DataCell(Text('(*) 1902',
                    style:
                        TextStyle(color: Color.fromARGB(255, 250, 249, 249)))),
                DataCell(Text('(+) 1976',
                    style:
                        TextStyle(color: Color.fromARGB(255, 250, 249, 249)))),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
