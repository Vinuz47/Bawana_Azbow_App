class Books {
  final String imagePath;
  final int totalPages;
  final int totalviewers;
  final int totalComments;
  final int? linearProgressIndicatorPersentage;
  final String edition;
  final String date;
  final String? description;
  final double rating;
  final String longDescription;
  final int reviews;

  Books({
    required this.imagePath,
    required this.totalPages,
    required this.totalviewers,
    required this.totalComments,
    required this.linearProgressIndicatorPersentage,
    required this.edition,
    required this.date,
    required this.description,
    required this.rating,
    required this.longDescription,
    required this.reviews
  });
}
