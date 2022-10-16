import 'package:flutter/material.dart';

class AddGuest extends StatefulWidget {
  const AddGuest({Key? key}) : super(key: key);

  @override
  State<AddGuest> createState() => _AddGuestState();
}

class _AddGuestState extends State<AddGuest> {
  // Déclaration des variables
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  late DateTime date;

  final List<String> types = [
    "Newly weds",
    "Bride's family",
    "Groom's family",
    "Bride's friends",
    "Groom's friends",
    "Mutual friends",
    "Bride's coworkers",
    "Groom's coworkers",
    "Vendors",
  ];
  String type = "Newly weds";
  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  bool isOtherSelected = false;
  bool isAdultSelected = true;
  bool isChildSelected = false;
  bool isBabySelected = false;

  // Initialisation de la date à l'heure actuelle pendant le chargement de la page
  @override
  void initState() {
    super.initState();
    date = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // L'entête de la page avec ses caractéristiques: nom, les icônes et leurs actions
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),// Retour sur la page précédente
          icon: const Icon(Icons.clear),
          color: Colors.black87,
        ),
        title: const Text(
          'Add a new guest',// Titre
          style: TextStyle(color: Colors.black54),
        ),
        actions: [
          // Le bouton pour valider la création d'un invité
          IconButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  lastNameController.text.isNotEmpty &&
                  (isMaleSelected || isFemaleSelected || isOtherSelected) &&
                  (isAdultSelected || isChildSelected || isBabySelected) &&
                  phoneController.text.isNotEmpty &&
                  emailController.text.isNotEmpty &&
                  addressController.text.isNotEmpty) {// Les conditions à remplir avant la création d'un invité
                Navigator.pop(context, {
                  "name": nameController.text.trim(),
                  "phone": phoneController.text.trim(),
                  "address": addressController.text.trim(),
                  "type": type,
                  "accepted": 0,
                  "pending": 0,
                  "denied": 0,
                  "total": 0,
                  "date": date.toIso8601String().substring(0, 10),
                });
              } else {
                // Le message d'erreur
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
            // Le formulaire avec les différents champs
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 15, right: 5),
                    child: TextField(
                      controller: nameController,
                      onChanged: (value) => setState(() {}),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "name",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 5, right: 15),
                    child: TextField(
                      controller: lastNameController,
                      onChanged: (value) => setState(() {}),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Last name",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
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
            const SizedBox(height: 5),
            Container(
              height: 50,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: isAdultSelected
                            ? Colors.purple
                            : Colors.transparent,
                        border: Border.all(color: Colors.black54),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (!isAdultSelected) {
                              isAdultSelected = !isAdultSelected;
                              isChildSelected = false;
                              isBabySelected = false;
                            }
                          });
                        },
                        child: Center(
                          child: Text(
                            'Adult',
                            style: TextStyle(
                                color: isAdultSelected
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
                        color: isChildSelected
                            ? Colors.purple
                            : Colors.transparent,
                        border: Border.all(color: Colors.black54),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (!isChildSelected) {
                              isChildSelected = !isChildSelected;
                              isAdultSelected = false;
                              isBabySelected = false;
                            }
                          });
                        },
                        child: Center(
                          child: Text(
                            'Child',
                            style: TextStyle(
                                color: isChildSelected
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
                        color:
                            isBabySelected ? Colors.purple : Colors.transparent,
                        border: Border.all(color: Colors.black54),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (!isBabySelected) {
                              isBabySelected = !isBabySelected;
                              isAdultSelected = false;
                              isChildSelected = false;
                            }
                          });
                        },
                        child: Center(
                          child: Text(
                            'Baby',
                            style: TextStyle(
                                color: isBabySelected
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
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 15, bottom: 10),
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
                controller: phoneController,
                keyboardType: TextInputType.number,
                onChanged: (value) => setState(() {}),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Phone",
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => setState(() {}),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "E-mail",
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: addressController,
                keyboardType: TextInputType.streetAddress,
                onChanged: (value) => setState(() {}),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Address",
                ),
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
                  hintText: "Note",
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
