import '../squads.exports.dart';

abstract class ISquadsState {
  List<Squad>? get squadsList => null;
  Future initialize(SquadsController controller) async {}
}

class InitialState extends ISquadsState {
  @override
  Future initialize(SquadsController controller) async {
    try {
      controller.value = Loading();
      controller.dependencies!.bind();
      controller.value = Loaded();
    } catch (e) {
      rethrow;
    }
  }
}

class Loading extends ISquadsState {}

class Loaded extends ISquadsState {}
