class PokemonEntity {
  String? number;
  String? name;
  String? thumbnailImage;
  String? description;
  List<String>? type;
  List<String>? weakness;

  PokemonEntity(
      {this.number,
      this.name,
      this.thumbnailImage,
      this.description,
      this.type,
      this.weakness});
}
