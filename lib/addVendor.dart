import 'package:flutter/material.dart';

class AddVendor extends StatefulWidget {
  const AddVendor({Key? key}) : super(key: key);

  @override
  State<AddVendor> createState() => _AddVendorState();
}

class _AddVendorState extends State<AddVendor> {
  // Déclaration des variables
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController siteController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  late DateTime date;

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
  bool isReservedSelected = false;
  bool isPendingSelected = true;
  bool isRejectedSelected = false;
  bool addToBudget = false;

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
          onPressed: () =>
              Navigator.pop(context), // Retour sur la page précédente
          icon: const Icon(Icons.clear),
          color: Colors.black87,
        ),
        title: const Text(
          'Add a new vendor', // Titre
          style: TextStyle(color: Colors.black54),
        ),
        actions: [
          // Le bouton pour valider la création d'un invité
          IconButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                // Les conditions à remplir avant la création d'un invité
                Navigator.pop(context, {
                  "name": nameController.text.trim(),
                  "phone": phoneController.text.trim(),
                  "categorie": type,
                  "address": addressController.text.trim(),
                  "reserved": isReservedSelected,
                  "pending": isPendingSelected,
                  "rejected": isRejectedSelected,
                  "date": date.toIso8601String().substring(0, 10),
                });
              } else {
                // Le message d'erreur
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Field name is required',
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
            Container(
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
            const SizedBox(height: 10),
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
                controller: siteController,
                keyboardType: TextInputType.streetAddress,
                onChanged: (value) => setState(() {}),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Site",
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
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 25,
                    child: TextField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) => setState(() {}),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Amount",
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      leading: Checkbox(
                          value: addToBudget,
                          onChanged: (val) {
                            setState(() {
                              addToBudget = val!;
                            });
                          }),
                      horizontalTitleGap: 0,
                      title: const Text(
                        "Add to budget",
                        style: TextStyle(fontSize: 15),
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
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: isReservedSelected
                            ? Colors.purple
                            : Colors.transparent,
                        border: Border.all(color: Colors.black54),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (!isReservedSelected) {
                              isReservedSelected = !isReservedSelected;
                              isPendingSelected = false;
                              isRejectedSelected = false;
                            }
                          });
                        },
                        child: Center(
                          child: Text(
                            'Reserved',
                            style: TextStyle(
                                color: isReservedSelected
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
                        color: isPendingSelected
                            ? Colors.purple
                            : Colors.transparent,
                        border: Border.all(color: Colors.black54),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (!isPendingSelected) {
                              isPendingSelected = !isPendingSelected;
                              isReservedSelected = false;
                              isRejectedSelected = false;
                            }
                          });
                        },
                        child: Center(
                          child: Text(
                            'Pending',
                            style: TextStyle(
                                color: isPendingSelected
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
                        color: isRejectedSelected
                            ? Colors.purple
                            : Colors.transparent,
                        border: Border.all(color: Colors.black54),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (!isRejectedSelected) {
                              isRejectedSelected = !isRejectedSelected;
                              isReservedSelected = false;
                              isPendingSelected = false;
                            }
                          });
                        },
                        child: Center(
                          child: Text(
                            'Rejected',
                            style: TextStyle(
                                color: isRejectedSelected
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
