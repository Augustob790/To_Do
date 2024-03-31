// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:to_do_list/modules/presentation/controller/home_page_controller.dart';
import 'package:to_do_list/modules/presentation/helpers/helpers.dart';
import '../../modules/domain/model/task.dart';

class ToDoTile extends StatefulWidget {
  final Task task;
  final HomePageController controller;
  final Function()? onTap;
  final Function(bool?)? onChanged;
  final Function(DismissDirection)? onDismissed;
  final bool isCompleted;

  const ToDoTile({
    super.key,
    this.onTap,
    required this.task,
    this.onChanged,
    this.isCompleted = false,
    required this.controller, this.onDismissed,
  });

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: widget.onDismissed,
      child: Padding(
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
                      value: widget.isCompleted,
                      onChanged: widget.onChanged,
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
      ),
    );
  }
}
