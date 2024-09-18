import 'package:get_it/get_it.dart';

import '../squads.exports.dart';

class SquadsDependencies {
  late ISquadsRepository? squadsRepository;
  late ILoadSquads? usecaseLoadSquads;

  late CreateSquadController? createSquadController;

  SquadsDependencies({
    this.squadsRepository,
    this.usecaseLoadSquads,
    this.createSquadController,
  });

  bind() {
    createSquadController ??= CreateSquadController();

    squadsRepository ??= SquadsRepository();
    GetIt.I.registerFactory<ISquadsRepository>(() => squadsRepository!);

    usecaseLoadSquads ??= LoadSquads(squadsRepository: squadsRepository!);
    GetIt.I.registerFactory<ILoadSquads>(() => usecaseLoadSquads!);
  }
}
