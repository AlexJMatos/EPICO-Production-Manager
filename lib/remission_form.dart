import 'package:epico_remissions_manager/autocomplete.dart';
import 'package:flutter/material.dart';

class RemissionForm extends StatefulWidget {
  const RemissionForm({super.key});

  @override
  State<RemissionForm> createState() => _RemissionState();
}

class _RemissionState extends State<RemissionForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static const plant = ["COZUMEL - 0001", "XPUJIL - 0002"];
  static const customer = ["CLIENTE - 0001", "CLIENTE - 0002"];
  static const projects = ["OBRA - 0001", "OBRA - 0002"];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitleSection(),
          buildDivider("General"),
          buildGeneralInfoSection(plant),
          buildProjectAndCustomerSection(customer, projects),
          buildDivider("Producto y cantidad"),
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
