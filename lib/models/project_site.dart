import 'package:epico_remissions_manager/models/location.dart';
import 'package:epico_remissions_manager/models/company.dart';

class ProjectSite {
  int id;
  String siteName;
  Location? location;
  Company? company;

  ProjectSite(
      {required this.id, required this.siteName, this.location, this.company});

  @override
  String toString() {
    return 'ProjectSite: { siteName: $siteName, location: $location, company: $company }';
  }
}
