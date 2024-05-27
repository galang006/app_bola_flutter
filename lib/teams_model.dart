class TeamsModel {
  final List<Data>? data;

  TeamsModel({
    this.data,
  });

  TeamsModel.fromJson(Map<String, dynamic> json)
      : data = (json['Data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'Data' : data?.map((e) => e.toJson()).toList()
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