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

      // await controller.dependencies!.usecaseLoadSquads!();

      controller.value = Loaded(
        squadsList: [
          Squad(
            id: 1,
            name: "Squad1",
          ),
        ],
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
}
