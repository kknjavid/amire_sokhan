
class Sokhan {
  int? id;
  String arabic;
  String farsi;
  String refrence;
  int favourit;
  Sokhan({
    this.id,
    required this.arabic,
    required this.farsi,
    required this.refrence,
    required this.favourit,
  });
  
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'arabic': arabic,
      'farsi': farsi,
      'refrence': refrence,
      'favourit': favourit,
    };
  }

  factory Sokhan.fromMap(Map<String, dynamic> map) {
    return Sokhan(
      id: map['id'],
      arabic: map['arabic'],
      farsi: map['farsi'],
      refrence: map['refrence'],
      favourit: map['favourit'],
    );
  }

 
}
