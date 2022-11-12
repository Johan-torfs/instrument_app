import 'package:flutter/material.dart';
import '../widgets/armultipletargets.dart';
import '../widgets/instrumentTabs.dart';
import 'historyPage.dart';

class ArPage extends StatefulWidget {
  const ArPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ArPageState();
}

class _ArPageState extends State<ArPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Instruments"),
      ),
      body: Center(
          // Here we load the Widget with the AR Dino experience
          child: ArMultipleTargetsWidget(
            onClick: (String name) {
              navigateToInstrument(context, name);
            },
          )),
    );
  }

  static navigateToInstrument(BuildContext context, String name) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HistoryPage(instrumentName: name)),
    );
  }
}
