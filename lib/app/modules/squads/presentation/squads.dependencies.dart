import 'package:get_it/get_it.dart';

import '../squads.exports.dart';

class SquadsDependencies {
  late ISquadsRepository? squadsRepository;
  late ILoadSquads? usecaseLoadSquads;

  SquadsDependencies({
    this.squadsRepository,
    this.usecaseLoadSquads,
  });

  bind() {
    squadsRepository ??= SquadsRepository();
    GetIt.I.registerFactory<ISquadsRepository>(() => squadsRepository!);

    usecaseLoadSquads ??= LoadSquads(squadsRepository: squadsRepository!);
    GetIt.I.registerFactory<ILoadSquads>(() => usecaseLoadSquads!);
  }
}
