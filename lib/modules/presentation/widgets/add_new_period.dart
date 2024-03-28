import 'package:flutter/material.dart';

import '../controller/home_page_controller.dart';
import 'custom_button.dart';

class AddNewTaskButton extends StatelessWidget {
  const AddNewTaskButton({super.key, required this.controller, required this.onTap});

  final HomePageController controller;
  final dynamic Function() onTap;


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: CustomButtonStandard(
        height: 25,
        width: 125,
        onTap: onTap,
        color: const Color.fromARGB(247, 15, 40, 139),
        text: "Adicionar Período",
        size: 12,
        isLoading: true,
      ),
    );
  }
}

  