import 'address.dart';
import 'manager.dart';
import 'project_site.dart';

class Company {
  String companyName = "";
  Manager? manager;
  Address? mainLocation;
  List<ProjectSite> projects = List.empty();
}
