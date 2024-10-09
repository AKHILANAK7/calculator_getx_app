import 'package:calculator_getx_app/providers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({super.key});

  final CalculatorController controller = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator GetX'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
              child: Obx(() => Text(
                    controller.output.value,
                    style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  )),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                _buildButtonRow(["7", "8", "9", "/"]),
                _buildButtonRow(["4", "5", "6", "*"]),
                _buildButtonRow(["1", "2", "3", "-"]),
                _buildButtonRow(["C", "0","+","%"]),
                _buildButtonRow(["="]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.map((button) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => controller.input(button),
                child: Text(button, style: const TextStyle(fontSize: 24)),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
