import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:stripe_app/models/custom_credit_card/custom_credit_card.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentState()) {
    on<OnSelectCardEvent>(_onSelectCard);
    on<OnDesactiveCardEvent>(_onDesactiveCard);
  }

  void _onSelectCard(OnSelectCardEvent event, Emitter emit) {
    emit(state.copyWith(cardActive: true, card: event.card));
  }

  void _onDesactiveCard(OnDesactiveCardEvent event, Emitter emit) {
    emit(state.copyWith(cardActive: false));
  }
}
