import 'package:epico_remissions_manager/service/pocket_base_service.dart';
import 'package:epico_remissions_manager/views/autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pocketbase/pocketbase.dart';

class RemissionForm extends StatefulWidget {
  const RemissionForm({super.key});

  @override
  State<RemissionForm> createState() => _RemissionState();
}

class _RemissionState extends State<RemissionForm> {
  final pb = PocketBase(dotenv.get("BACKEND_URL"));

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  PocketBaseService pocketbase = PocketBaseService.instance;
  static List<String> concretebatchingPlants = [];
  static const customer = ["EPICO CONCRETOS - 0001", "ARQCOZ - 0002"];
  static const projects = ["CASA OCIO - 0001", "TREN MAYA - 0002"];
  static const products = ["100-RR3-14", "150-R-14", "200-R-14", "250-R-14"];

  @override
  void initState() {
    super.initState();
    _getDataFromBackend();
  }

  void _getDataFromBackend() async {
    final result = await pocketbase.loadConcreteBatchingPlants();
    setState(() {
      concretebatchingPlants = result
          .map((e) =>
              "${e.getStringValue("identifier_name")} - 000${e.getIntValue("plant_number")}")
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitleSection(),
          buildDivider("General"),
          buildGeneralInfoSection(concretebatchingPlants),
          buildProjectAndCustomerSection(customer, projects),
          buildDivider("Producto y cantidad"),
          buildProductInfoSection(products),
          buildDivider("Dosificador y unidad")
        ],
      ),
    );
  }
}

Flexible buildTitleSection() {
  return const Flexible(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Crear remision",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
        ),
      ],
    ),
  );
}

Flexible buildGeneralInfoSection(List<String> plant) {
  return Flexible(
    child: Row(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              decoration: const InputDecoration(
                label: Text("Numero de remision"),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: InputDatePickerFormField(
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
                fieldLabelText: "Fecha",
                initialDate: DateTime.now()),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: AutoCompleteElement(
              fieldName: "Planta",
              options: plant,
            ),
          ),
        )
      ],
    ),
  );
}

Flexible buildProjectAndCustomerSection(
    List<String> customers, List<String> projects) {
  return Flexible(
    child: Row(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: AutoCompleteElement(
              fieldName: "Cliente",
              options: customers,
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: AutoCompleteElement(
              fieldName: "Obra",
              options: projects,
            ),
          ),
        ),
      ],
    ),
  );
}

Flexible buildProductInfoSection(List<String> products) {
  return Flexible(
    child: Row(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: AutoCompleteElement(
              fieldName: "Pedido",
              options: products,
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: InputDatePickerFormField(
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
                fieldLabelText: "Fecha",
                initialDate: DateTime.now()),
          ),
        ),
      ],
    ),
  );
}

Row buildDivider(String title) {
  return Row(children: <Widget>[
    const Expanded(child: Divider()),
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold),
      ),
    ),
    const Expanded(child: Divider()),
  ]);
}
