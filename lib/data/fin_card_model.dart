import 'dart:ffi';

class FinCard {
  final int? id;
  final String? cardAssetImage;
  final String? cardType;
  final String? amountText;
  final String? validThrough;

  const FinCard(
    this.id,
    this.cardAssetImage,
    this.cardType,
    this.amountText,
    this.validThrough,
  );
}
