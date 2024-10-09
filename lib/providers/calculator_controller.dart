import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var output = "0".obs;
  var _input = "".obs;
  var _num1 = 0.0.obs;
  var _num2 = 0.0.obs;
  var _operator = "".obs;

  void input(String buttonText) {
    if (buttonText == "C") {
      clear();
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/" || buttonText == "%") {
      _operator.value = buttonText;
      _num1.value = double.tryParse(_input.value) ?? 0;
      _input.value = "";
    } else if (buttonText == "=") {
      _num2.value = double.tryParse(_input.value) ?? 0;
      calculate();
    } else {
      _input.value += buttonText;
    }
    output.value = _input.value.isEmpty ? "0" : _input.value;
  }

  void clear() {
    _input.value = "";
    _num1.value = 0;
    _num2.value = 0;
    _operator.value = "";
    output.value = "0";
  }

  void calculate() {
    double result = 0;
    switch (_operator.value) {
      case "+":
        result = _num1.value + _num2.value;
        break;
      case "-":
        result = _num1.value - _num2.value;
        break;
      case "*":
        result = _num1.value * _num2.value;
        break;
      case "/":
        result = _num1.value / _num2.value;
        break;
      case "%":
        result = _num1.value % _num2.value;
        break;  
    }
    output.value = result.toString();
    _input.value = output.value;
  }
}
