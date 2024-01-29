class MenuItem {
  String name;
  double price;
  String description;
  List<String> ingredients;

  MenuItem(this.name, this.price, this.description, this.ingredients);

  @override
  String toString() {
    return '$name: \$${price.toStringAsFixed(2)} - $description';
  }
}
