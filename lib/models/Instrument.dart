class Instrument {
  final int id;
  final String name;

  const Instrument({
    required this.id,
    required this.name,
  });

  factory Instrument.fromJson(Map<String, dynamic> json) {
    return Instrument(
      id: json['id'],
      name: json['name'],
    );
  }
}