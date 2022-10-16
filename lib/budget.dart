import 'package:evena/addBudget.dart';
import 'package:flutter/material.dart';

class Budget extends StatefulWidget {
  const Budget({Key? key}) : super(key: key);

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  final List<String> types = [
    "Clothes and accessories",
    "Health and beauty",
    "Music and show",
    "Flower and decoration",
    "Accessories",
    "Jewelry",
    "Photo and video",
    "Ceremony",
    "Banquet",
    "Transport",
    "Hall renting",
  ];

  List<Map<String, dynamic>> budgetDetails = [
    {
      "name": "Image de mariés",
      "type": "Clothes and accessories",
      "status": "Pending",
      "paid": "0",
      "date": "2022-09-20"
    },
    {
      "name": "Divertissement et musique",
      "type": "Music and show",
      "status": "Pending",
      "paid": "0",
      "date": "2022-09-20"
    },
    {
      "name": "Divertissement et musique",
      "type": "Flower and decoration",
      "status": "Pending",
      "paid": "0",
      "date": "2022-09-20"
    },
    {
      "name": "Invitations et accessoires pour le banquet",
      "type": "Accessories",
      "status": "Pending",
      "paid": "0",
      "date": "2022-09-20"
    },
    {
      "name": "Cadeaux et bonbonnières",
      "type": "Accessories",
      "status": "Pending",
      "paid": "0",
      "date": "2022-09-20"
    },
    {
      "name": "Bagues",
      "type": "Jewelry",
      "status": "Pending",
      "paid": "0",
      "date": "2022-09-20"
    },
    {
      "name": "Photo/vidéo",
      "type": "Photo and video",
      "status": "Pending",
      "paid": "0",
      "date": "2022-09-20"
    },
    {
      "name": "Céremonie",
      "type": "Ceremony",
      "status": "Pending",
      "paid": "0",
      "date": "2022-09-20"
    },
    {
      "name": "Banquet",
      "type": "Banquet",
      "status": "Pending",
      "paid": "0",
      "date": "2022-09-20"
    },
    {
      "name": "Transport",
      "type": "Transport",
      "status": "Pending",
      "paid": "0",
      "date": "2022-09-20"
    },
  ];

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
                    builder: (context) => const AddBudget(),
                  ),
                );
                if (result != null) {
                  setState(() {
                    budgetDetails.add(result);
                  });
                }
              },
              icon: const Icon(Icons.add),
              color: Colors.black87,
            ),
          ],
          title: const Text(
            "Budget",
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          bottom: TabBar(
            physics: const BouncingScrollPhysics(),
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
          children: types
              .map(
                (title) => ListView.builder(
                  itemCount: budgetDetails
                      .where((element) => element['type'] == title)
                      .toList()
                      .length,
                  itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(2.5),
                          child: Container(
                            height: 75,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                            child: ListTile(
                              title: Text(budgetDetails[index]['name']),
                              subtitle: Text(budgetDetails[index]['status']),
                              trailing:
                                  Text("Paid: ${budgetDetails[index]['paid']}"),
                            ),
                          ),
                        ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
