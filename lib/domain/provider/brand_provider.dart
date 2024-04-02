import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/request.dart';

class BrandProvider extends ChangeNotifier {

  Request request = const Request(
    brand: '',
    color: '',
    year: '',
    kilometers: '',
    gasolineType: '',
  );

  List<bool> isActive = List.generate(5, (index) => true);

  void setBrand(String brand) {
    request = request.copyWith(brand: brand);
    notifyListeners();
  }

  void setColor(String color) {
    request = request.copyWith(color: color);
    notifyListeners();
  }

  void setYear(String year) {
    request = request.copyWith(year: year);
    notifyListeners();
  }

  void setKilometers(String kilometers) {
    request = request.copyWith(kilometers: kilometers);
    notifyListeners();
  }

  void setGasolineType(String gasolineType) {
    request = request.copyWith(gasolineType: gasolineType);
    notifyListeners();
  }

  void changeIsActive(int index) {
    isActive[index] = !isActive[index];
    notifyListeners();
  }

  cleanSearch() {
    request = const Request(
      brand: '',
      color: '',
      year: '',
      kilometers: '',
      gasolineType: '',
    );
    isActive = List.generate(5, (index) => true);
    notifyListeners();
  }
}