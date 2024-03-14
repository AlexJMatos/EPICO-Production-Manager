import 'package:epico_remissions_manager/models/address.dart';
import 'package:epico_remissions_manager/models/company.dart';

class ProjectSite {
  String siteName;
  Address? location;
  Company? company;

  ProjectSite({required this.siteName, this.location, this.company});

  @override
  String toString() {
    return 'ProjectSite: { siteName: $siteName, location: $location, company: $company }';
  }
}
