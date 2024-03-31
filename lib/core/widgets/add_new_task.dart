import 'package:flutter/material.dart';

class AddNewTaskButton extends StatelessWidget {
  const AddNewTaskButton({super.key, required this.onTap});

  final dynamic Function() onTap;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      // backgroundColor: const Color.fromARGB(247, 15, 40, 139),
      backgroundColor: Colors.yellow,
      shape: const CircleBorder(),
      child: const Icon(
        Icons.add,
        color: Colors.black,
      ),
    );
  }
}
