import '../domain.exports.dart';

abstract class ISquadsRepository {
  Future<List<Squad>> loadSquads();
}
