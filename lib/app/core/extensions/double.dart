import 'package:intl/intl.dart';

extension EDouble on double {
  String formatMoney({String symbol = "R\$"}) {
    try {
      NumberFormat format = NumberFormat.currency(
        locale: "pt_BR",
        symbol: symbol,
      );
      return format.format(this);
    } catch (e) {
      return "";
    }
  }
}
