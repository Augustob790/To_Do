// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../../controller/home_page_controller.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/input_personalized.dart';
import '../../../widgets/manrope.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key, required this.controller, required this.add});

  final HomePageController controller;
  final dynamic Function() add;

  @override
  State<AddNewTask> createState() => _PopUpOpinionsState();
}

class _PopUpOpinionsState extends State<AddNewTask> {
  @override
  Widget build(BuildContext context) {
    return _buildAddProductsModal(context);
  }

  @override
  void initState() {
    super.initState();
    widget.controller.inicialize();
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
                          child: const Manrope(
                            text: "Nova Tarefa",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InputPersonalized(
                        maxLength: 15,
                        autovalidateMode: AutovalidateMode.disabled,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Não pode ser vazio";
                          }
                          return null;
                        },
                        fontSize: 15,
                        controller: widget.controller.titleController,
                        labelText: "Nova Tarefa",
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
                        maxLength: 15,
                        autovalidateMode: AutovalidateMode.disabled,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Não pode ser vazio";
                          }
                          return null;
                        },
                        fontSize: 15,
                        controller: widget.controller.descriptionController,
                        labelText: "Nova descrição",
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
                  color: Color.fromARGB(247, 8, 8, 8),
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
