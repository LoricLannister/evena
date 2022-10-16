import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController noteController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  bool isDoneSelected = false;
  bool isProgressSelected = true;
  late DateTime date;
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

  Future pickADateTime() async {
    final newDate = await pickDateTime(
      date,
      pickDate: true,
      firstDate: DateTime.now(),
    );
    if (newDate == null) return;
    date = newDate;
    setState(() {});
  }

  Future<DateTime?> pickDateTime(DateTime initialDate,
      {required bool pickDate, required DateTime firstDate}) async {
    if (pickDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: DateTime.now().add(const Duration(days: 31)),
      );
      if (date == null) return null;
      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);
      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );
      if (timeOfDay == null) return null;
      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
      return date.add(time);
    }
  }

  @override
  void initState() {
    super.initState();
    date = DateTime.now();
  }

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
          'Add tasks',
          style: TextStyle(color: Colors.black54),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  noteController.text.isNotEmpty) {
                Navigator.pop(context, {
                  "name": nameController.text.trim(),
                  "note": noteController.text.trim(),
                  "type": type,
                  "date": date.toIso8601String().substring(0, 10)
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
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    pickADateTime();
                  },
                  child: ListTile(
                    title: Text(
                      date.toString().substring(0, 10),
                    ),
                    trailing: const Icon(Icons.calendar_today),
                  ),
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
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        color:
                            isDoneSelected ? Colors.purple : Colors.transparent,
                        border: Border.all(color: Colors.black54),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (!isDoneSelected) {
                              isDoneSelected = !isDoneSelected;
                              isProgressSelected = false;
                            }
                          });
                        },
                        child: Center(
                          child: Text(
                            'Done',
                            style: TextStyle(
                                color: isDoneSelected
                                    ? Colors.white
                                    : Colors.black87),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        color: isProgressSelected
                            ? Colors.purple
                            : Colors.transparent,
                        border: Border.all(color: Colors.black54),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (!isProgressSelected) {
                              isProgressSelected = !isProgressSelected;
                              isDoneSelected = false;
                            }
                          });
                        },
                        child: Center(
                          child: Text(
                            'In progress',
                            style: TextStyle(
                                color: isProgressSelected
                                    ? Colors.white
                                    : Colors.black87),
                          ),
                        ),
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
