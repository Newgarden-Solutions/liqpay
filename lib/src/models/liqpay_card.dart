import 'package:equatable/equatable.dart';

class LiqPayCard extends Equatable {
  final String number;
  final String expirationMonth;
  final String expirationYear;
  final String cvv;

  LiqPayCard(this.number, this.expirationMonth, this.expirationYear, this.cvv);

  @override
  List<Object?> get props => [number, expirationMonth, expirationYear, cvv];
}
