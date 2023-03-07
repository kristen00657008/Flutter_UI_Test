import 'package:equatable/equatable.dart';

class CardModel extends Equatable{
  int number;
  String suit;
  bool isLock;

  CardModel(
      {required this.number,
      required this.suit,
      required this.isLock});

  @override
  String toString() {
    return "$number of $suit\n";
  }

  factory CardModel.clone(CardModel source) {
    return CardModel(
        isLock: source.isLock,
        suit: source.suit,
        number: source.number
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [suit, number];

}

List<String> suitList = ['Spade', 'Heart', 'Diamond', 'Club'];

final List<CardModel> cardList = List.generate(
  52,
  (index) => CardModel(
    number: (index + 1) % 13 == 0 ? 13 : (index + 1) % 13,
    suit: suitList[index ~/ 13],
    isLock: false,
  ),
);
