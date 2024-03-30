// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:to_do_list/modules/presentation/controller/home_page_controller.dart';
import 'package:to_do_list/modules/presentation/helpers/helpers.dart';
import '../../domain/model/task.dart';

class ToDoTile extends StatefulWidget {
  final Task task;
  final HomePageController controller;
  final Function()? onTap;
  final Function(bool?)? onChanged;
  final bool isCompleted;

  const ToDoTile({
    super.key,
    this.onTap,
    required this.task,
    this.onChanged,
    this.isCompleted = false,
    required this.controller,
  });

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: widget.task.isDone,
                    onChanged: (value) async {
                      setState(() {
                           widget.task.isDone == value;
                      });
                      // await controller.update(Task(
                      //     id: task.id,
                      //     title: task.title,
                      //     description: task.description,
                      //     isDone: value!,
                      //     dataInit: task.dataInit));
                    },
                    activeColor: Colors.black,
                  ),
                  Text(
                    widget.task.title,
                    style: TextStyle(
                      color: Colors.black,
                      decoration: widget.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  // task name
                  Padding(
                    padding: const EdgeInsets.only(left: 48.0),
                    child: Text(
                      widget.task.dataInit == ""
                          ? ""
                          : Helpers.formatDateForBR(widget.task.dataInit),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
