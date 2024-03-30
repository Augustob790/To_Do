// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:to_do_list/modules/presentation/helpers/helpers.dart';
import '../../domain/model/task.dart';

class ToDoTile extends StatelessWidget {
  final Task task;
  final Function()? onTap;
  final Function(bool?)? onChanged;
  final bool isCompleted;

  const ToDoTile({
    super.key,
    this.onTap,
    required this.task,
    this.onChanged,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: InkWell(
        onTap: onTap,
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
                    value: isCompleted,
                    onChanged: onChanged,
                    activeColor: Colors.black,
                  ),
                  Text(
                    task.title,
                    style: TextStyle(
                      color: Colors.black,
                      decoration: isCompleted
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
                      task.dataInit == ""
                          ? ""
                          : Helpers.formatDateForBR(task.dataInit),
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
