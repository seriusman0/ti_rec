import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'item.dart';

class MainPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fDateController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController lDateController = TextEditingController();
  final TextEditingController recomendedController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference items = firestore.collection('items');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Center(child: Text("TI-REC")),
      ),
      body: ListView(children: <Widget>[
        StreamBuilder<QuerySnapshot>(
          stream: items.snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: snapshot.data.docs
                    .map((list) => Text(list['name']))
                    .toList(),
              );
            }
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: nameController,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                        labelText: 'Item Name',
                        labelStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: priceController,
                    style: TextStyle(fontSize: 18),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Price',
                        labelStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: fDateController,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                        labelText: 'Date Of Buy' + DateTime.now().toString(),
                        labelStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: lDateController,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                        labelText: 'Last Date' + DateTime.now().toString(),
                        labelStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: noteController,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                        labelText: 'Note' + DateTime.now().toString(),
                        labelStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: 60.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30.0)),
                  child: TextButton(
                    onPressed: () {
                      items.add({
                        'name': nameController.text ?? 0,
                        'fDate': DateTime.now(),
                        'price': int.tryParse(priceController.text) ?? 0,
                        'lDate': DateTime.now(),
                        'recomended': false,
                        'note': '',
                      });
                      nameController.text = '';
                      fDateController.text = '';
                      priceController.text = '';
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ]),
    );
  }
}
