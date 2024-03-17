import 'package:epico_remissions_manager/models/manager.dart';

import 'location.dart';
import 'company.dart';

class ConcreteBatchingPlant {
  String id;
  String plant;
  Manager manager;
  Location location;
  Company company;

  ConcreteBatchingPlant({
    required this.id,
    required this.plant,
    required this.manager,
    required this.location,
    required this.company,
  });

  @override
  String toString() {
    return 'ConcretePlant: { id: $id, plant: $plant, manager: $manager, location: $location, company: $company }';
  }
}
