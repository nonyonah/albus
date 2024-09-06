class CurrencyItemModel {
  CurrencyItemModel({this.amountCard, this.id}) {
    amountCard = amountCard ?? "USD";
    id = id ?? "";
  }

  String? amountCard;
  String? id;
}
