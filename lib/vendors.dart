import 'package:evena/addVendor.dart';
import 'package:flutter/material.dart';

class Vendors extends StatefulWidget {
  const Vendors({Key? key}) : super(key: key);

  @override
  State<Vendors> createState() => _VendorsState();
}

class _VendorsState extends State<Vendors> {
  List<Map<String, dynamic>> vendorsDetails = [
    {
      "name": "Jessica Williams",
      "categorie": "Clothes and accessories",
      "phone": "699989796",
      "address": "Address is noy defined",
      "reserved": false,
      "pending": false,
      "rejected": true,
      "date": "Date is not defined"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  builder: (context) => const AddVendor(),
                ),
              );
              if (result != null) {
                setState(() {
                  vendorsDetails.add(result);
                });
              }
            },
            icon: const Icon(Icons.add),
            color: Colors.black87,
          ),
        ],
        title: const Text(
          "Vendors",
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: vendorsDetails.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(2.5),
          child: Container(
            height: 75,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: ListTile(
              leading: const Icon(Icons.cloud_done),
              title: Text(vendorsDetails[index]['name']),
              subtitle: Row(
                children: [
                  Text(
                    vendorsDetails[index]['reserved'] == true
                        ? "Reserved"
                        : vendorsDetails[index]['pending'] == true
                            ? "Pending"
                            : "Rejected",
                    style: TextStyle(
                      color: vendorsDetails[index]['reserved'] == true
                          ? Colors.green
                          : vendorsDetails[index]['pending'] == true
                              ? Colors.orange
                              : Colors.red,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    ",${vendorsDetails[index]['categorie']}",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
