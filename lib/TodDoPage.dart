import 'package:flutter/material.dart';
import 'package:todo_app/style.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  List ToDoList = [];
  String item = "";

  MyInputOnChange(content) {
    setState(() {
      item = content;
    });
  }

  AddItem() {
    setState(() {
      ToDoList.add({'item': item});
    });
  }

  RemoveItem(index) {
    setState(() {
      ToDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo'),
        backgroundColor: Colors.green,
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 70,
                        child: TextFormField(
                          onChanged: (content) {
                            MyInputOnChange(content);
                          },
                          decoration: AppInputDecoration('List Item'),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            AddItem();
                          },
                          child: Text(
                            'Add',
                            style: ButtonTextStyle(),
                          ),
                          style: AppButtonStyle(),
                        ))
                  ],
                )),
            Expanded(
                flex: 90,
                child: ListView.builder(
                  itemCount: ToDoList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: SizeBox50(Row(
                        children: [
                          Expanded(
                            flex: 80,
                            child: Text(ToDoList[index]['item'].toString()),
                          ),
                          Expanded(
                            flex: 20,
                            child: TextButton(
                              onPressed: () {
                                RemoveItem(index);
                              },
                              child: Icon(Icons.delete),
                            ),
                          )
                        ],
                      )),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
