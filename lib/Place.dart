class Place {
  final String id;
  final String imageUrl;
  final String title;
  final String location;
  final String description;
  final double lat;
  final double long;

  Place(
      {required this.imageUrl,
      required this.title,
      required this.location,
      required this.description,
      required this.id,
      required this.lat,
      required this.long
      });

  @override
  String toString() {
    return "Place(title: $title, location: $location, description: $description, id: $id, lat: $lat, long: $long)";
  }
}
