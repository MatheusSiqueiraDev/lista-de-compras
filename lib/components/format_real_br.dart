import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';

class FormatRealBr {
  CurrencyTextInputFormatter get coin {
    return CurrencyTextInputFormatter(locale: 'pt-BR', decimalDigits: 2, symbol: 'R\$');
  }
}