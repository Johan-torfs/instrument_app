import 'package:flutter/material.dart';

void main() => runApp(const MusicPage());

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

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
                  width: width * .6,
                  child: const Text("Info",
                      style:
                          TextStyle(color: Color.fromARGB(255, 250, 249, 249))),
                ),
              ),
              DataColumn(
                // ignore: sized_box_for_whitespace
                label: Container(
                  width: width * .4,
                  child: const Text("Action",
                      style:
                          TextStyle(color: Color.fromARGB(255, 250, 249, 249))),
                ),
              ),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text(
                    'Francisco de Asis Tarra Eixa\ncomposer (1852 - 1909)',
                    style:
                        TextStyle(color: Color.fromARGB(255, 250, 249, 249)))),
                DataCell(Icon(
                  Icons.not_started_outlined,
                  size: 35,
                  color: Colors.green,
                )),
              ]),
              DataRow(cells: [
                DataCell(Text('Daniel Papoty\ncomposer (1902 - 1977)',
                    style:
                        TextStyle(color: Color.fromARGB(255, 250, 249, 249)))),
                DataCell(Icon(Icons.motion_photos_pause,
                    size: 35, color: Colors.orange)),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
