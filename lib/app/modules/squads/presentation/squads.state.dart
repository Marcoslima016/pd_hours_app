import '../squads.exports.dart';

abstract class ISquadsState {
  List<Squad>? get squadsList => null;
  Future initialize(SquadsController controller) async {}

  Future refresh(SquadsController controller) async {}
}

class InitialState extends ISquadsState {
  @override
  Future initialize(SquadsController controller) async {
    try {
      controller.value = Loading();
      controller.dependencies!.bind();

      List<Squad> squads = await controller.dependencies!.usecaseLoadSquads!();

      controller.value = Loaded(
        squadsList: squads,
      );
    } catch (e) {
      rethrow;
    }
  }
}

class Loading extends ISquadsState {}

class Loaded extends ISquadsState {
  @override
  List<Squad> squadsList;

  Loaded({
    required this.squadsList,
  });

  @override
  Future refresh(SquadsController controller) async {
    try {
      controller.value = Loading();

      List<Squad> squads = await controller.dependencies!.usecaseLoadSquads!();

      controller.value = Loaded(
        squadsList: squads,
      );
    } catch (e) {
      rethrow;
    }
  }
}
