class LeagueModel {
  final List<Data>? data;

  LeagueModel({
    this.data,
  });

  LeagueModel.fromJson(Map<String, dynamic> json)
      : data = (json['Data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'Data' : data?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final int? idLeague;
  final String? leagueName;
  final String? country;
  final String? logoLeagueUrl;
  final String? leaderStandings;

  Data({
    this.idLeague,
    this.leagueName,
    this.country,
    this.logoLeagueUrl,
    this.leaderStandings,
  });

  Data.fromJson(Map<String, dynamic> json)
      : idLeague = json['idLeague'] as int?,
        leagueName = json['leagueName'] as String?,
        country = json['country'] as String?,
        logoLeagueUrl = json['logoLeagueUrl'] as String?,
        leaderStandings = json['leaderStandings'] as String?;

  Map<String, dynamic> toJson() => {
    'idLeague' : idLeague,
    'leagueName' : leagueName,
    'country' : country,
    'logoLeagueUrl' : logoLeagueUrl,
    'leaderStandings' : leaderStandings
  };
}