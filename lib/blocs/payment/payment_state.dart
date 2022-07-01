part of 'payment_bloc.dart';

@immutable
class PaymentState {
  final double amount;
  final String currency;
  final bool cardActive;
  final CustomCreditCard? card;

  const PaymentState({
    this.card,
    this.amount = 275.55,
    this.currency = "USD",
    this.cardActive = false,
  });

  String get amountString => '${(amount * 100).floor()}';

  PaymentState copyWith({
    double? amount,
    String? currency,
    bool? cardActive,
    CustomCreditCard? card,
  }) =>
      PaymentState(
        card: card ?? this.card,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        cardActive: cardActive ?? this.cardActive,
      );

  @override
  String toString() {
    return "Payment state: {Amount: $amount, Currency: $currency, cardActive: $cardActive, card: $card}";
  }
}
