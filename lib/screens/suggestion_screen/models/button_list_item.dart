class ButtonListItemModel {
  String emoji;
  String name;
  String frequency;
  String price;
  String id;

  ButtonListItemModel({
    String? emoji,
    String? name,
    String? frequency,
    String? price,
    String? id,
  })  : emoji = emoji ?? '',
        name = name ?? '',
        frequency = frequency ?? '',
        price = price ?? '',
        id = id ?? '';
}
