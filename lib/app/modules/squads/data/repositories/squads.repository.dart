import 'package:pd_hours_app/lib.exports.dart';

class SquadsRepository implements ISquadsRepository {
  //

  final IRESTClient client;

  SquadsRepository({
    required this.client,
  });

  @override
  Future<List<Squad>> loadSquads() async {
    try {
      Map<String, dynamic> response = await client.get(
        endpoint: "/squads",
      );

      List<Squad> result = [];

      for (Map<String, dynamic> responseItem in response["data"]) {
        Squad squad = Squad.fromMap(responseItem);
        result.add(squad);
      }

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future createSquad({required PayloadCreateSquad payload}) async {
    try {
      Map<String, dynamic> requestBody = {
        "name": payload.name,
      };

      await client.post(
        endpoint: "/squad",
        data: requestBody,
      );
    } catch (e) {
      rethrow;
    }
  }
}
