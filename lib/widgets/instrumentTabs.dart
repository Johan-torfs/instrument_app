import 'package:flutter/material.dart';
import '../pages/historyPage.dart';
import 'instrument.dart';
import 'musicPage.dart';
import 'musicianPage.dart';

class InstrumentTabs extends StatelessWidget {
  const InstrumentTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: const Center(
              child: Text(" - FLUTE -"),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            // backgroundColor: Color.fromARGB(255, 13, 1, 1),
            bottom: const TabBar(
                labelColor: Color.fromARGB(255, 250, 249, 249),
                unselectedLabelColor: Color.fromARGB(255, 250, 249, 249),
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.black54),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("History"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Musician"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Music"),
                    ),
                  ),
                ]),
          ),
          body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: InstrumentLoad(),
            padding: const EdgeInsets.only(
                top: 104.0, left: 16.0, right: 16.0, bottom: 16.0),
            child: const TabBarView(
                children: [HistoryPage(instrumentName: "Flute"), MusicianPage(), MusicPage()]),
          ),
        ));
  }
}
