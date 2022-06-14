import 'package:falconx/falconx.dart';

final now = DateTime.now();
final today = DateTime(now.year, now.month, now.day);
final yesterday = DateTime(now.year, now.month, now.day - 1);

extension AppIntegerFormatExtension on int? {
  String formatTotalView() {
    if (this == null) return '0';
    if (this! >= 1000000) {
      return '${this! / 1000000}M';
    } else if (this! >= 1000) {
      return '${this! / 1000}K';
    }
    return '$this';
  }

  int formatPriceNumber() {
    if (this == null) return 0;
    if (this! > 1000000) {
      return this! ~/ 1000000;
    } else if (this! > 1000) {
      return this! ~/ 1000;
    }
    return this!;
  }
}

extension AppStringFormatExtention on String {
  String get nameToSku => 'sku_$removeWhiteSpace';
}

extension AppDoubleFormatExtention on double? {
  String formatPrice({bool sign = true, int decimalDigits = 2}) {
    final priceObject = this?.toString().split('.') ?? ['0'];
    if (priceObject[1] == '0') {
      return NumberFormat.currency(symbol: sign ? '฿' : '', decimalDigits: 0)
          .format(this ?? 0);
    }
    return NumberFormat.currency(
      symbol: sign ? '฿' : '',
      decimalDigits: decimalDigits,
    ).format(this ?? 0);
  }

  String formatWithMaxPrice(double? maxPrice, {bool sign = true}) {
    if (this == maxPrice) return formatPrice(sign: sign);
    return formatPrice(sign: sign) +
        (maxPrice != null ? ' - ${maxPrice.formatPrice(sign: sign)}' : '');
  }
}

extension AppDateTimeFormat on DateTime? {
  String toFormatddMMMyyyyHHmm() {
    if (this == null) return '';
    final data = DateFormat('dd MMM yyyy HH:mm').format(this!);
    return data;
  }

  String toFormatddMMyyyyHHmm() {
    if (this == null) return '';
    final data = DateFormat('dd/MM/yyyy, HH:mm').format(this!);
    return data;
  }

  String? toFormatyyyyMMdd() {
    if (this == null) return '';
    final data = DateFormat('yyyy-MM-dd').format(this!);
    return data;
  }

  String? toFormatddMMyyyy() {
    if (this == null) return '';
    final data = DateFormat('dd/MM/yyyy').format(this!);
    return data;
  }

  String? toFormatddMMMyyyy() {
    if (this == null) return '';
    final data = DateFormat('dd MMM yyyy').format(this!);
    return data;
  }

  String? toFormatHHmm() {
    if (this == null) return '';
    final data = DateFormat('HH:mm').format(this!);
    return data;
  }

  String formatGroupChatHeader() {
    final messageDate = DateTime(this!.year, this!.month, this!.day);

    if (this!.isAfter(today)) {
      return DateFormat('HH:mm').format(this!);
    } else if (messageDate == yesterday) {
      return 'Yesterday';
    } else if (messageDate.difference(today).inDays < -356) {
      return DateFormat('dd/MM/yy').format(this!);
    } else {
      return DateFormat('dd/MM').format(this!);
    }
  }

  DateTime groupByDateTime() {
    int weightMinute(int minute) {
      return (minute / 10).floor();
    }

    if (this!.isAfter(today)) {
      return DateTime(
        this!.year,
        this!.month,
        this!.day,
        this!.hour,
        weightMinute(this!.minute),
      );
    } else {
      return DateTime(this!.year, this!.month, this!.day);
    }
  }
}

extension AppTimeOfDayFormat on TimeOfDay? {
  String toFormatTimeOfDay() {
    final now = DateTime.now();
    final dt = DateTime(
      now.year,
      now.month,
      now.day,
      this?.hour ?? 0,
      this?.minute ?? 0,
    );
    final data = DateFormat('HH:mm').format(dt);
    return data;
  }

  String toFormatHHmm00() {
    final now = DateTime.now();
    final dt = DateTime(
      now.year,
      now.month,
      now.day,
      this?.hour ?? 0,
      this?.minute ?? 0,
    );
    final data = DateFormat('HH:mm:ss').format(dt);
    return data;
  }
}

extension AppUnixToDateTimeFormat on int {
  DateTime unixToDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(this * 1000).toUtc();
  }
}
