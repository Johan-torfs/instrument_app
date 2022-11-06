class Instrument {
  final int id;
  final String name;
  final String period;
  final String description;
  final String collection;

  const Instrument({
    required this.id,
    required this.name,
    required this.period,
    required this.description,
    required this.collection,
  });

  factory Instrument.fromJson(Map<String, dynamic> json) {
    return Instrument(
      id: int.parse(json['id']),
      name: json['name'],
      period: json['period'],
      description: json['description'],
      collection: json['collection'],
    );
  }
}