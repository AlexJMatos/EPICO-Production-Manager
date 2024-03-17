import 'location.dart';
import 'manager.dart';
import 'project_site.dart';

class Company {
  int id;
  String companyName;
  Manager? manager;
  Location? mainLocation;
  List<ProjectSite> projects;

  Company({
    required this.id,
    required this.companyName,
    this.manager,
    this.mainLocation,
    List<ProjectSite>? projects,
  }) : projects = projects ?? [];

  @override
  String toString() {
    return 'Company: { companyName: $companyName, manager: $manager, mainLocation: $mainLocation, projects: $projects }';
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(id: map["id"], companyName: map["company_name"]);
  }

  Map<String, dynamic> toMap() => {"id": id, "company_name": companyName};
}
