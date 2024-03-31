import 'package:flutter/material.dart';

class AddNewTaskButton extends StatelessWidget {
  const AddNewTaskButton({super.key, required this.onTap});

  final dynamic Function() onTap;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor: Colors.grey.shade800,
      shape: const CircleBorder(),
      child: const Icon(
        Icons.add,
        size: 38,
        color: Colors.white,
      ),
    );
  }
}
