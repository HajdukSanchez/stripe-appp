part of 'payment_bloc.dart';

@immutable
abstract class PaymentEvent {}

class OnSelectCardEvent extends PaymentEvent {
  final CustomCreditCard card;

  OnSelectCardEvent(this.card);
}

class OnDesactiveCardEvent extends PaymentEvent {}
