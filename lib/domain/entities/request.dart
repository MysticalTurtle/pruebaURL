class Request {
  final String brand;
  final String color;
  final String year;
  final String kilometers;
  final String gasolineType;

  const Request({
    required this.brand,
    required this.color,
    required this.year,
    required this.kilometers,
    required this.gasolineType,
  });

  Request copyWith({
    String? brand,
    String? color,
    String? year,
    String? kilometers,
    String? gasolineType,
  }) {
    return Request(
      brand: brand ?? this.brand,
      color: color ?? this.color,
      year: year ?? this.year,
      kilometers: kilometers ?? this.kilometers,
      gasolineType: gasolineType ?? this.gasolineType,
    );
  }

  @override
  String toString() {
    return 'Request(brand: $brand, color: $color, year: $year, kilometers: $kilometers, gasolineType: $gasolineType)';
  }

  String toURL() {
    String marca = brand!=""? "&marca=$brand" : '';
    String colorURL = color!=""? "&color=$color" : '';
    String kilometraje = year!=""? "&kilometros=$kilometers" : '';
    String anio = kilometers!=""? "&year=$year" : '';
    String tipoGasolina = gasolineType!=""? "&tipoGasolina=$gasolineType" : '';

    return "http://example.com?$marca$colorURL$kilometraje$anio$tipoGasolina";
  }
}