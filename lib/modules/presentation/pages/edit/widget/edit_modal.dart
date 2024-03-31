// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../../controller/controller.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/input_personalized.dart';
import '../../../../../core/widgets/manrope.dart';

class EditNewTask extends StatefulWidget {
  const EditNewTask({super.key, required this.controller, required this.add});

  final Controller controller;
  final dynamic Function() add;

  @override
  State<EditNewTask> createState() => _EditNewTaskState();
}

class _EditNewTaskState extends State<EditNewTask> {
  @override
  Widget build(BuildContext context) {
    return _buildAddProductsModal(context);
  }

  _buildAddProductsModal(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(50.0, 0, 0, 0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Manrope(
                            text: "Editar Tarefa",
                            color: Colors.black,
                            size: 15,
                            font: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      iconSize: 30,
                      alignment: Alignment.topRight,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close),
                      color: Colors.black,
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InputPersonalized(
                        autovalidateMode: AutovalidateMode.disabled,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Não pode ser vazio";
                          }
                          return null;
                        },
                        fontSize: 15,
                        maxLength: 15,
                        labelText: "Edite sua Tarefa",
                        controller: widget.controller.titleController,
                        obscure: false,
                        height: 45,
                        width: (size.width / 1.55),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InputPersonalized(
                        autovalidateMode: AutovalidateMode.disabled,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Não pode ser vazio";
                          }
                          return null;
                        },
                        fontSize: 15,
                        maxLength: 15,
                        labelText: "Edite sua Tarefa",
                        controller: widget.controller.descriptionController,
                        obscure: false,
                        height: 45,
                        width: (size.width / 1.55),
                      ),
                    ),
                  ],
                ),
                CustomButtonStandard(
                  margin: const EdgeInsets.only(top: 30, bottom: 30),
                  height: 30,
                  width: 90,
                  onTap: widget.add,
                  color: Colors.black,
                  text: "Concluir",
                  size: 15,
                  isLoading: true,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
