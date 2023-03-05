class Work {
  final String title;
  final String description;
  final String date;
  final String companyName;

  //final String companyLogo;
  final String companyWebsite;
  final String companyLocation;
  final String companyPhone;
  final List<String> responsibilities;

  Work.filled({
    required this.title,
    required this.date,
    required this.description,
    required this.companyName,
    //required this.companyLogo,
    required this.companyWebsite,
    required this.companyLocation,
    required this.companyPhone,
    required this.responsibilities,
  });

  factory Work.fromJson(Map<String, dynamic> json) {
    return Work.filled(
      title: json['title'],
      description: json['description'],
      companyName: json['company_name'],
      //companyLogo: json['companyLogo'],
      companyWebsite: json['company_website'],
      companyLocation: json['company_location'],
      companyPhone: json['company_phone'],
      date: json['date'],
      responsibilities: List<String>.from(
        json['responsibilities'],
      ),
    );
  }
}
