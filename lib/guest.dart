import 'package:evena/addGuest.dart';
import 'package:evena/diagramModel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Guest extends StatefulWidget {
  final String name;
  final String partnerName;
  const Guest({Key? key, required this.name, required this.partnerName})
      : super(key: key);

  @override
  State<Guest> createState() => _GuestState();
}

class _GuestState extends State<Guest> {
  final List<String> types = [
    "             Guests            ",
    "             Events            ",
  ];

  List<Map<String, dynamic>> guestsDetails = [];
  List<Map<String, dynamic>> eventsDetails = [
    {
      "name": "Bachelorette party",
      "accepted": 1,
      "pending": 1,
      "denied": 1,
      "total": 3,
      "date": "Date is not defined"
    },
    {
      "name": "Bachelor party",
      "accepted": 0,
      "pending": 1,
      "denied": 1,
      "total": 2,
      "date": "Date is not defined"
    },
    {
      "name": "Wedding",
      "accepted": 2,
      "pending": 2,
      "denied": 2,
      "total": 6,
      "date": "Date is not defined"
    },
  ];

  List<PieChartSectionData> getSectionsContext(
      {int accepted = 0, int denied = 0, int pending = 0, int total = 0}) {
    return [
      Data(
        name: "accepted",
        percent: (accepted / total) * 100,
        color: Colors.green,
      ),
      Data(
        name: "pending",
        percent: (pending / total) * 100,
        color: Colors.yellow,
      ),
      Data(
        name: "denied",
        percent: (denied / total) * 100,
        color: Colors.red,
      ),
    ]
        .asMap()
        .map<int, PieChartSectionData>((index, data) {
          final value = PieChartSectionData(
            //Le radius diminue l'epaisseur des secteurs.
            radius: 8, title: '',
            color: data.color,
            value: data.percent,
          );
          return MapEntry(index, value);
        })
        .values
        .toList();
  }

  @override
  void initState() {
    super.initState();
    guestsDetails.addAll([
      {"name": widget.name, "type": "Wedding", "date": ""},
      {"name": widget.partnerName, "type": "Wedding", "date": ""},
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: types.length,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.more_vert,
            color: Colors.black87,
          ),
          actions: [
            IconButton(
              onPressed: () async {
                Map<String, dynamic>? result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddGuest(),
                  ),
                );
                if (result != null) {
                  setState(() {
                    guestsDetails.add(result);
                  });
                }
              },
              icon: const Icon(Icons.add),
              color: Colors.black87,
            ),
          ],
          title: const Text(
            "Guests",
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          bottom: TabBar(
            labelColor: Colors.purple,
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            tabs: types
                .map(
                  (title) => Tab(text: title),
                )
                .toList(),
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: guestsDetails.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(2.5),
                child: Container(
                  height: 75,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: ListTile(
                    title: Text(guestsDetails[index]['name']),
                    subtitle: Row(
                      children: [
                        Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            color: guestsDetails[index]['type'] == "Wedding"
                                ? Colors.green
                                : Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(guestsDetails[index]['type']),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: eventsDetails.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
                  height: 110,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: ListTile(
                    title: Row(
                      children: [
                        const Icon(Icons.wine_bar, color: Colors.black87),
                        const SizedBox(width: 5),
                        Text(eventsDetails[index]['name']),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Text(eventsDetails[index]['date']),
                        ),
                        SizedBox(
                          width: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                      "${eventsDetails[index]['accepted']} accepted"),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                      "${eventsDetails[index]['pending']} pending"),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                      "${eventsDetails[index]['denied']} denied"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    trailing: SizedBox(
                      height: 40,
                      width: 40,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: PieChart(
                          PieChartData(
                            borderData: FlBorderData(show: false),
                            sectionsSpace: 3,
                            centerSpaceRadius: 15,
                            sections: getSectionsContext(
                              accepted: eventsDetails[index]['accepted'],
                              pending: eventsDetails[index]['pending'],
                              denied: eventsDetails[index]['denied'],
                              total: eventsDetails[index]['total'],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator(
      {required MaterialColor color, required String text, double size = 16}) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
