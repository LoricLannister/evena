import 'package:evena/addTask.dart';
import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  List<Map<String, dynamic>> tasks = [
    {
      "name": "Organize evening girls/boys",
      "type": "Unspecified categorie",
      "date": "2022-09-20"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
          color: Colors.black87,
        ),
        title: const Text(
          'Tasks',
          style: TextStyle(color: Colors.black54),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              Map<String, dynamic>? result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddTask(),
                ),
              );
              if (result != null) {
                setState(() {
                  tasks.add(result);
                });
              }
            },
            icon: const Icon(Icons.add),
            color: Colors.black87,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(2.5),
          child: Container(
            height: 75,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: ListTile(
              leading: const Icon(
                Icons.access_time,
                color: Colors.purple,
              ),
              title: Text(tasks[index]['name']),
              subtitle: Text(tasks[index]['type']),
              trailing: Text(tasks[index]['date']),
            ),
          ),
        ),
      ),
    );
  }
}
