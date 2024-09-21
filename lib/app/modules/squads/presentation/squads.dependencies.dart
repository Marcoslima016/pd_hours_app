import 'package:get_it/get_it.dart';
import 'package:pd_hours_app/lib.exports.dart';

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

    squadsRepository ??= SquadsRepository(client: DIORESTClient());
    GetIt.I.registerFactory<ISquadsRepository>(() => squadsRepository!);

    usecaseLoadSquads ??= LoadSquads(squadsRepository: squadsRepository!);
    GetIt.I.registerFactory<ILoadSquads>(() => usecaseLoadSquads!);
  }
}
