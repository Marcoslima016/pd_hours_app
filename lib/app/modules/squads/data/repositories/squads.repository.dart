import '../../domain/domain.exports.dart';

class SquadsRepository implements ISquadsRepository {
  //

  @override
  Future<List<Squad>> loadSquads() async {
    try {
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
