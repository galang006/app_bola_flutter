class DetailTeamModel {
  final Data? data;

  DetailTeamModel({
    this.data,
  });

  DetailTeamModel.fromJson(Map<String, dynamic> json)
      : data = (json['Data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['Data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'Data' : data?.toJson()
  };
}

class Data {
  final int? idClub;
  final String? nameClub;
  final String? logoClubUrl;
  final String? stadiumName;
  final String? captainName;
  final String? headCoach;

  Data({
    this.idClub,
    this.nameClub,
    this.logoClubUrl,
    this.stadiumName,
    this.captainName,
    this.headCoach,
  });

  Data.fromJson(Map<String, dynamic> json)
      : idClub = json['IdClub'] as int?,
        nameClub = json['NameClub'] as String?,
        logoClubUrl = json['LogoClubUrl'] as String?,
        stadiumName = json['StadiumName'] as String?,
        captainName = json['CaptainName'] as String?,
        headCoach = json['HeadCoach'] as String?;

  Map<String, dynamic> toJson() => {
    'IdClub' : idClub,
    'NameClub' : nameClub,
    'LogoClubUrl' : logoClubUrl,
    'StadiumName' : stadiumName,
    'CaptainName' : captainName,
    'HeadCoach' : headCoach
  };
}