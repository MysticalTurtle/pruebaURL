import 'package:flutter/material.dart';
import 'package:pokedex/domain/provider/brand_provider.dart';
import 'package:pokedex/presentation/input_search.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController brandController;
  late TextEditingController colorController;
  late TextEditingController yearController;
  late TextEditingController kilometersController;
  late TextEditingController gasolineTypeController;

  @override
  void initState() {
    super.initState();
    brandController = TextEditingController();
    colorController = TextEditingController();
    yearController = TextEditingController();
    kilometersController = TextEditingController();
    gasolineTypeController = TextEditingController();
  }

  @override
  void dispose() {
    brandController.dispose();
    colorController.dispose();
    yearController.dispose();
    kilometersController.dispose();
    gasolineTypeController.dispose();
    super.dispose();
  }

  void cleanInputs() {
    brandController.clear();
    colorController.clear();
    yearController.clear();
    kilometersController.clear();
    gasolineTypeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    BrandProvider brandProvider =
        Provider.of<BrandProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prueba Técnica"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            InputSearch(
              isActive: brandProvider.isActive[0],
              controller: brandController,
              hintText: "Marca",
              callBack: (_) => brandProvider.changeIsActive(0),
              changeText: (p0) => brandProvider.setBrand(p0),
            ),
            InputSearch(
              isActive: brandProvider.isActive[1],
              controller: colorController,
              hintText: "Color",
              callBack: (_) => brandProvider.changeIsActive(1),
              changeText: (p0) => brandProvider.setColor(p0),
            ),
            InputSearch(
              isActive: brandProvider.isActive[2],
              controller: yearController,
              hintText: "Año",
              callBack: (_) => brandProvider.changeIsActive(2),
              changeText: (p0) => brandProvider.setYear(p0),
            ),
            InputSearch(
              isActive: brandProvider.isActive[3],
              controller: kilometersController,
              hintText: "Kilometros",
              callBack: (_) => brandProvider.changeIsActive(3),
              changeText: (p0) => brandProvider.setKilometers(p0),
            ),
            InputSearch(
              isActive: brandProvider.isActive[4],
              controller: gasolineTypeController,
              hintText: "Tipo de Gasolina",
              callBack: (_) => brandProvider.changeIsActive(5),
              changeText: (p0) => brandProvider.setGasolineType(p0),
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('URL: ${brandProvider.request.toURL()}'),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text("Buscar"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  brandProvider.cleanSearch();
                  cleanInputs();
                },
                child: const Text("Limpiar"))
          ],
        ),
      ),
    );
  }
}
