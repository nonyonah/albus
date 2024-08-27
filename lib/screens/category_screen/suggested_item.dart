abstract class SuggestedItem {
  final String id;
  final String name;
  final bool isSelected;

  SuggestedItem({required this.id, required this.name, this.isSelected = false});

  SuggestedItem copyWith({bool? isSelected});
}