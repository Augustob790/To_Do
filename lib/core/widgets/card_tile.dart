import 'package:flutter/material.dart';
import '../../modules/domain/model/task.dart';
import '../../modules/presentation/controller/controller.dart';
import '../helpers/helpers.dart';

class CardTile extends StatefulWidget {
  const CardTile({
    super.key,
    required this.task,
    required this.controller,
    this.onTap,
    this.onDelete,
    required this.isCompleted,
    this.onChanged,
  });

  final Task task;
  final Controller controller;
  final bool isCompleted;
  final Function()? onTap;
  final Function()? onDelete;
  final Function(bool?)? onChanged;

  @override
  State<CardTile> createState() => _EditToDoState();
}

class _EditToDoState extends State<CardTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      color: widget.controller.getRandomColor(),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          onTap: widget.onTap,
          leading: Checkbox(
            value: widget.isCompleted,
            onChanged: widget.onChanged,
            activeColor: Colors.black,
          ),
          title: RichText(
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                text: '${widget.task.title} \n',
                style: TextStyle(
                    decoration: widget.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    height: 1.5),
                children: [
                  TextSpan(
                    text: widget.task.description,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        height: 1.5),
                  )
                ]),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              Helpers.formatDateForBR(widget.task.dataInit),
              style: TextStyle(
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey.shade800),
            ),
          ),
          trailing: IconButton(
            onPressed: widget.onDelete,
            icon: const Icon(
              Icons.delete,
            ),
          ),
        ),
      ),
    );
  }
}
