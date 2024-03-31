import 'package:flutter/material.dart';
import '../../controller/controller.dart';

class AddTaskScreen extends StatefulWidget {
  final Controller controller;
  final dynamic Function() add;
  const AddTaskScreen({
    super.key,
    required this.controller,
    required this.add,
  });

  @override
  State<AddTaskScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          padding: const EdgeInsets.all(0),
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.grey.shade800.withOpacity(.8),
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
        child: Column(children: [
          Expanded(
              child: ListView(
            children: [
              TextField(
                controller: widget.controller.titleController,
                style: const TextStyle(color: Colors.white, fontSize: 30),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Título',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 30)),
              ),
              TextField(
                controller: widget.controller.descriptionController,
                style: const TextStyle(
                  color: Colors.white,
                ),
                maxLines: null,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Digite algo aqui',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    )),
              ),
            ],
          ))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.add,
        shape: const CircleBorder(),
        elevation: 10,
        backgroundColor: Colors.grey.shade800,
        child: const Icon(Icons.save, color: Colors.white),
      ),
    );
  }
}
