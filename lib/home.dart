import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    TextEditingController _taskcontroller = TextEditingController();
    
    addStringToSF(String task) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
await prefs.setStringList('tasks', <String>[task]);
  // print(task);
}

getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
final List<String>? tasks = prefs.getStringList('tasks');
print(tasks?.length,);

ListView.builder(
  padding: const EdgeInsets.all(8),
  itemCount: tasks?.length,
  itemBuilder: (BuildContext context, int index) {
    return Column(
      children: [
        Text( tasks![index]),
      ],
    );
  }
);
  // return tasks; 
  }

    return Scaffold(
      appBar: AppBar(
        title: const Text('TO-DO'),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 70,),
              SizedBox(
      width: 250,
      child: TextField(
        controller: _taskcontroller,
        decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name of the task',
        ),
      ),
      ),
      TextButton(onPressed: () async {
        addStringToSF(_taskcontroller.text);
       getStringValuesSF();
      }, 
      child: const Text('Submit.'))
            ],
          ),
        ),
    );
  }
}


// Widget Tasks(String value) {
// //  bool isChecked = false;
// // return Row(
// //         children: [
// //           Checkbox(
// //           checkColor: Colors.white,
// //           value: isChecked,
// //           onChanged: (bool? value) {
// //             setState(() {
// //               isChecked = value!;
// //             });
// //           } ),
// //           const SizedBox(width: 20,),
// //           Text(value),
// //         ],
// //     );
// return ListView(
//    padding: const EdgeInsets.all(8),
//   children: <Widget>[
//     Container(
//       height: 50,
//       color: Colors.amber[600],
//       child: Center(child: Text(value)),
//     ),
//   ],
// );

// }