import '../domain.exports.dart';

abstract class ILoadSquads {
  Future<List<Squad>> call();
}

class LoadSquads implements ILoadSquads {
  final ISquadsRepository squadsRepository;

  LoadSquads({
    required this.squadsRepository,
  });

  @override
  Future<List<Squad>> call() async {
    try {
      await squadsRepository.loadSquads();
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
