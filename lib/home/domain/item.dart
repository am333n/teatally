class ItemCounter {
  final int id;
  final int count;

  ItemCounter({
    required this.id,
    required this.count,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'count': count,
    };
  }

  factory ItemCounter.fromJson(Map<String, dynamic> json) {
    return ItemCounter(
      id: json['id'],
      count: json['count'],
    );
  }
}
