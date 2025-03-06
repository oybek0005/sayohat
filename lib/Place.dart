class Place {
  final String id;
  final String imageUrl;
  final String title;
  final String location;
  final String description;

  Place({required this.imageUrl, required this.title, required this.location,required this.description,required this.id});

  @override
  String toString() {
    return "Place(title: $title, location: $location, description: $description, id: $id)";
  }
}