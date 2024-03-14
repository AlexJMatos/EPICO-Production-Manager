import 'package:epico_remissions_manager/models/manager.dart';

import 'address.dart';
import 'company.dart';

class ConcretePlant {
  String id;
  String plant;
  Manager manager;
  Address address;
  Company company;

  ConcretePlant({
    required this.id,
    required this.plant,
    required this.manager,
    required this.address,
    required this.company,
  });

  @override
  String toString() {
    return 'ConcretePlant: { id: $id, plant: $plant, manager: $manager, address: $address, company: $company }';
  }
}
