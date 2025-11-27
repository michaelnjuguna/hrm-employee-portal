class Event {
  final String title;
  final String? description;
  final String? color;
  // TODO: Make id required
  final String? id;

  const Event({this.id, required this.title, this.description, this.color});
}
