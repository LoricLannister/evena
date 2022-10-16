import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddBudget extends StatefulWidget {
  const AddBudget({Key? key}) : super(key: key);

  @override
  State<AddBudget> createState() => _AddBudgetState();
}

class _AddBudgetState extends State<AddBudget> {
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String photoPath = '';

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
  String type = "Clothes and accessories";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.clear),
          color: Colors.black87,
        ),
        title: const Text(
          'Ajouter une dépense',
          style: TextStyle(color: Colors.black54),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  budgetController.text.isNotEmpty &&
                  noteController.text.isNotEmpty) {
                Navigator.pop(context, {
                  "name": nameController.text.trim(),
                  "note": noteController.text.trim(),
                  "status": "En attente",
                  "paid": budgetController.text.trim(),
                  "type": type,
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Please fill all fields',
                      textAlign: TextAlign.center,
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            icon: const Icon(Icons.done),
            color: Colors.black87,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: nameController,
                onChanged: (value) => setState(() {}),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "name",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 10, bottom: 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: DropdownButton<String>(
                      isExpanded: true,
                      value: type,
                      items: types.map(buildMenuItem).toList(),
                      onChanged: (value) {
                        setState(() {
                          if (value != null) {
                            type = value;
                          }
                        });
                      }),
                ),
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: budgetController,
                keyboardType: TextInputType.number,
                onChanged: (value) => setState(() {}),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Approximative amount",
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        size: 65,
                        color: Colors.grey,
                      ),
                      onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (builder) => bottomSheet(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: photoPath.isEmpty
                          ? const Center(
                              child: Text("No picture"),
                            )
                          : Image.file(
                              File(photoPath),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: noteController,
                onChanged: (value) => setState(() {}),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "note",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: MediaQuery.of(context).size.height / 6.5,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Choose a picture",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: () async {
                    takePhoto(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.camera, color: Colors.purple),
                  label: const Text(
                    "Camera",
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
                TextButton.icon(
                  onPressed: () async {
                    takePhoto(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.image, color: Colors.purple),
                  label: const Text(
                    "Gallery",
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        photoPath = pickedFile.path;
      });
    }
  }

  DropdownMenuItem<String> buildMenuItem(String value) => DropdownMenuItem(
        value: value,
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
