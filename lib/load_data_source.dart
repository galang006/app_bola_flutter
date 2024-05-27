import 'base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadLeague() {
    return BaseNetwork.get("");
  }

  Future<Map<String, dynamic>> loadTeams(int idLeague){
    return BaseNetwork.get("$idLeague");
  }

  Future<Map<String, dynamic>> loadDetailTeams(int idLeague, int idTeam){
    return BaseNetwork.get("$idLeague/$idTeam");
  }

}