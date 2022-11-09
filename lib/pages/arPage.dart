import 'package:flutter/material.dart';
import '../widgets/armultipletargets.dart';
import '../widgets/instrumentTabs.dart';

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
      body: const Center(
          // Here we load the Widget with the AR Dino experience
          child: ArMultipleTargetsWidget()),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
           _showBottomModal(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _showBottomModal(context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (builder) {
        return new Container(
          color: Colors.transparent,
          child: new Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                )
              ],
            ),
            alignment: Alignment.topLeft,
            child: InstrumentTabs(),
          ),
        );
      }
    );
  }
}
