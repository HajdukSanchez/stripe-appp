part of 'payment_bloc.dart';

@immutable
class PaymentState {
  final double totalPayment;
  final String moneyType;
  final bool cardActive;
  final CustomCreditCard? card;

  const PaymentState({
    this.card,
    this.totalPayment = 275.55,
    this.moneyType = "USD",
    this.cardActive = false,
  });

  PaymentState copyWith({
    CustomCreditCard? card,
    double? totalPayment,
    String? moneyType,
    bool? cardActive,
  }) =>
      PaymentState(
        card: card ?? this.card,
        moneyType: moneyType ?? this.moneyType,
        cardActive: cardActive ?? this.cardActive,
        totalPayment: totalPayment ?? this.totalPayment,
      );
}
