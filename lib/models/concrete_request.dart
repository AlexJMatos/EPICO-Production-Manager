
import 'package:epico_remissions_manager/models/company.dart';
import 'package:epico_remissions_manager/models/concrete_plant.dart';
import 'package:epico_remissions_manager/models/concrete_request_specification.dart';
import 'package:epico_remissions_manager/models/project_site.dart';

class ConcreteRequest {
  String id;
  DateTime date;
  ConcretePlant plant;
  Company client;
  ProjectSite site;
  double requiredQuantity;
  List<ConcreteRequestSpecification> concreteSpecifications;

  ConcreteRequest({
    required this.id,
    required this.plant,
    required this.client,
    required this.site,
    required this.requiredQuantity,
    required this.concreteSpecifications,
    DateTime? date,
  }) : date = date ?? DateTime.now();

  @override
  String toString() {
    return 'ConcreteRequest: { id: $id, date: $date, plant: $plant, client: $client, site: $site, requiredQuantity: $requiredQuantity, concreteSpecifications: $concreteSpecifications }';
  }
}
