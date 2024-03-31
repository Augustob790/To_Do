// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/manrope.dart';

class InfoTask extends StatefulWidget {
  const InfoTask({
    Key? key,
    required this.excluir,
    required this.editar,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;
  final dynamic Function() excluir;
  final dynamic Function() editar;

  @override
  State<InfoTask> createState() => _InfoTaskState();
}

class _InfoTaskState extends State<InfoTask> {
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
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
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
                          text: "Tarefa",
                          color: Color.fromRGBO(46, 44, 52, 1),
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
                      color: Colors.black)
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Manrope(
                    text: "Nome",
                    color: Color.fromARGB(255, 12, 11, 11),
                    font: FontWeight.w500,
                    size: 15,
                  ),
                  const SizedBox(width: 5),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 245, 246, 250),
                        border: Border.symmetric(),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Manrope(
                          text: widget.title,
                          color: Color.fromARGB(255, 12, 11, 11),
                          font: FontWeight.w500,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Manrope(
                    text: "Descrição",
                    color: Color.fromARGB(255, 12, 11, 11),
                    font: FontWeight.w500,
                    size: 15,
                  ),
                  const SizedBox(width: 5),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 245, 246, 250),
                        border: Border.symmetric(),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Manrope(
                          text: widget.description,
                          color: Color.fromARGB(255, 12, 11, 11),
                          font: FontWeight.w500,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonStandard(
                    margin:
                        const EdgeInsets.only(top: 30, bottom: 30, left: 10),
                    height: 30,
                    width: 90,
                    onTap: widget.excluir,
                    color: Colors.black,
                    text: "Excluir",
                    size: 15,
                    isLoading: true,
                  ),
                  CustomButtonStandard(
                    margin:
                        const EdgeInsets.only(top: 30, bottom: 30, right: 10),
                    height: 30,
                    width: 90,
                    onTap: widget.editar,
                    color: Colors.black,
                    text: "Editar",
                    size: 15,
                    isLoading: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
