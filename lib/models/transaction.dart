class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date = DateTime.now();

  Transaction(this.id, this.title, this.value);
}
