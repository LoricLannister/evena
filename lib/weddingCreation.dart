import 'dart:io';

import 'package:evena/Utils.dart';
import 'package:evena/home.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MarriageCreation extends StatefulWidget {
  const MarriageCreation({Key? key}) : super(key: key);

  @override
  State<MarriageCreation> createState() => _MarriageCreationState();
}

class _MarriageCreationState extends State<MarriageCreation> {
  // Déclaration des variables
  late DateTime toDate;
  String photoPath = '';
  bool photoPicked = false;
  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  bool isOtherSelected = false;
  bool isMalePartnerSelected = false;
  bool isFemalePartnerSelected = false;
  bool isOtherPartnerSelected = false;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController partnerNameController = TextEditingController();
  final TextEditingController partnerEmailController = TextEditingController();
  final TextEditingController marriageNameController = TextEditingController();
  final TextEditingController marriageBudgetController =
      TextEditingController();

  // Initialisation de la date
  @override
  void initState() {
    super.initState();
    toDate = DateTime.now().add(const Duration(days: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Create a marriage',
          style: TextStyle(color: Colors.purple),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (surnameController.text.trim().isNotEmpty &&
                  partnerNameController.text.trim().isNotEmpty &&
                  marriageBudgetController.text.trim().isNotEmpty) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(
                      surname: surnameController.text.trim(),
                      partnerName: partnerNameController.text.trim(),
                      budget: marriageBudgetController.text.trim(),
                      dateTime: toDate,
                    ),
                  ),
                  (route) => false,
                );
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Disposition des éléments du formulaire
            const Divider(color: Colors.purple, thickness: 2),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                'PERSONNAL INFORMATIONS',
                style: TextStyle(fontSize: 17),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: photoPicked
                  ? CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.transparent,
                      backgroundImage: FileImage(
                        File(photoPath),
                      ),
                    )
                  : const CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("assets/5.png"),
                    ),
              horizontalTitleGap: 2,
              title: const Text("Picture"),
              subtitle: const Text('Change your profile picture'),
              trailing: Container(
                height: 35,
                width: 80,
                color: Colors.grey.shade300,
                child: InkWell(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (builder) => bottomSheet(),
                  ),
                  child: const Center(
                    child: Text(
                      'CHOOSE',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: surnameController,
                onChanged: (value) => setState(() {}),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Your surname",
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            isMaleSelected ? Colors.purple : Colors.transparent,
                        border: Border.all(color: Colors.black54),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (!isMaleSelected) {
                              isMaleSelected = !isMaleSelected;
                              isOtherSelected = false;
                              isFemaleSelected = false;
                            }
                          });
                        },
                        child: Center(
                          child: Text(
                            'Male',
                            style: TextStyle(
                                color: isMaleSelected
                                    ? Colors.white
                                    : Colors.black87),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: isFemaleSelected
                            ? Colors.purple
                            : Colors.transparent,
                        border: Border.all(color: Colors.black54),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (!isFemaleSelected) {
                              isFemaleSelected = !isFemaleSelected;
                              isOtherSelected = false;
                              isMaleSelected = false;
                            }
                          });
                        },
                        child: Center(
                          child: Text(
                            'Female',
                            style: TextStyle(
                                color: isFemaleSelected
                                    ? Colors.white
                                    : Colors.black87),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: isOtherSelected
                            ? Colors.purple
                            : Colors.transparent,
                        border: Border.all(color: Colors.black54),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (!isOtherSelected) {
                              isOtherSelected = !isOtherSelected;
                              isMaleSelected = false;
                              isFemaleSelected = false;
                            }
                          });
                        },
                        child: Center(
                          child: Text(
                            'Other',
                            style: TextStyle(
                                color: isOtherSelected
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
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                'PARTNER',
                style: TextStyle(fontSize: 17),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: partnerNameController,
                onChanged: (value) => setState(() {}),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Partner name",
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: isMalePartnerSelected
                            ? Colors.purple
                            : Colors.transparent,
                        border: Border.all(color: Colors.black54),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (!isMalePartnerSelected) {
                              isMalePartnerSelected = !isMalePartnerSelected;
                              isOtherPartnerSelected = false;
                              isFemalePartnerSelected = false;
                            }
                          });
                        },
                        child: Center(
                          child: Text(
                            'Male',
                            style: TextStyle(
                                color: isMalePartnerSelected
                                    ? Colors.white
                                    : Colors.black87),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: isFemalePartnerSelected
                            ? Colors.purple
                            : Colors.transparent,
                        border: Border.all(color: Colors.black54),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (!isFemalePartnerSelected) {
                              isFemalePartnerSelected =
                                  !isFemalePartnerSelected;
                              isOtherPartnerSelected = false;
                              isMalePartnerSelected = false;
                            }
                          });
                        },
                        child: Center(
                          child: Text(
                            'Female',
                            style: TextStyle(
                                color: isFemalePartnerSelected
                                    ? Colors.white
                                    : Colors.black87),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: isOtherPartnerSelected
                            ? Colors.purple
                            : Colors.transparent,
                        border: Border.all(color: Colors.black54),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (!isOtherPartnerSelected) {
                              isOtherPartnerSelected = !isOtherPartnerSelected;
                              isMalePartnerSelected = false;
                              isFemalePartnerSelected = false;
                            }
                          });
                        },
                        child: Center(
                          child: Text(
                            'Other',
                            style: TextStyle(
                                color: isOtherPartnerSelected
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
                controller: partnerEmailController,
                onChanged: (value) => setState(() {}),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Partner email",
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                'MARRIAGE',
                style: TextStyle(fontSize: 17),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: marriageNameController,
                onChanged: (value) => setState(() {}),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText:
                      "${surnameController.text.trim()} & ${partnerNameController.text.trim()}",
                ),
              ),
            ),
            const SizedBox(height: 10),
            buildTo(),
            const SizedBox(height: 10),
            Container(
              height: 50,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: marriageBudgetController,
                keyboardType: TextInputType.number,
                onChanged: (value) => setState(() {}),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Total budget (CFA Frs)",
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildTo() => buildHeader(
    // La fonction pour sélectionner une date
        header: "Date and hour of ceremonie",
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: buildDropdownField(
                text: Utils.toDate(toDate),
                onClicked: () => pickToDateTime(pickDate: true),
                isCalendar: true,
              ),
            ),
            Expanded(
              flex: 4,
              child: buildDropdownField(
                text: Utils.toTime(toDate),
                onClicked: () => pickToDateTime(pickDate: false),
                isCalendar: false,
              ),
            ),
          ],
        ),
      );

  Widget buildDropdownField(
          {required text,
          required VoidCallback onClicked,
          required bool isCalendar}) =>
      ListTile(
        title: Text(text),
        trailing: Icon(isCalendar ? Icons.calendar_today : Icons.access_time),
        onTap: onClicked,
      );

  Widget buildHeader({required String header, required Row child}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              header,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          child,
        ],
      );

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(
      toDate,
      pickDate: pickDate,
      firstDate: DateTime.now(),
    );
    if (date == null) return;
    toDate = date;
    setState(() {});
  }

  Future<DateTime?> pickDateTime(DateTime initialDate,
      {required bool pickDate, required DateTime firstDate}) async {
    if (pickDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: DateTime.now().add(const Duration(days: 7)),
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

  Widget bottomSheet() {
    // Interface de sélection d'une photo
    return Container(
      height: MediaQuery.of(context).size.height / 6.5,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Choose profile picture",
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
    // Ouverture de la galerie ou de la caméra
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        photoPicked = true;
        photoPath = pickedFile.path;
      });
    }
  }
}
