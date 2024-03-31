import 'package:flutter/material.dart';
import '../../modules/domain/model/task.dart';
import 'manrope.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.task, this.onTap});

  final Task task;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(
          color: Colors.yellow,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Manrope(
                  text: task.title,
                  color: Colors.black,
                  font: FontWeight.w500,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
