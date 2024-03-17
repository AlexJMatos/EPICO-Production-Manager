import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pocketbase/pocketbase.dart';

class PocketBaseService {
  static PocketBaseService? _instance;
  static get instance {
    _instance ??= PocketBaseService._internal();
    return _instance;
  }

  PocketBaseService._internal();

  final pb = PocketBase(dotenv.get("BACKEND_URL"));

  Future<List<RecordModel>> getAllRecords(String record) async {
    return await pb.collection(record).getFullList(sort: '-created');
  }

  Future<List<RecordModel>> loadConcreteBatchingPlants() async {
    final authData = await pb.admins.authWithPassword(
        dotenv.get("ADMIN_USERNAME"), dotenv.get("ADMIN_PASSWORD"));
        
    return pb
        .collection('concrete_batching_plants')
        .getFullList(sort: '-created');
  }
}
