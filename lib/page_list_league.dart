import 'package:responsi_prak/league_model.dart';
import 'package:responsi_prak/load_data_source.dart';
import 'package:flutter/material.dart';
import 'package:responsi_prak/page_list_teams.dart';

class PageListLeague extends StatefulWidget {
  const PageListLeague({Key? key}) : super(key: key);
  @override
  State<PageListLeague> createState() => _PageListLeagueState();
}

class _PageListLeagueState extends State<PageListLeague> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "League",
          style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Color(0xFF3A023E),
        centerTitle: true,
      ),
      body: _buildListLeagueBody(),
    );
  }

  Widget _buildListLeagueBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadLeague(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            // Jika data ada error maka akan ditampilkan hasil error
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            // Jika data ada dan berhasil maka akan ditampilkan hasil datanya
            LeagueModel leagueModel = LeagueModel.fromJson(snapshot.data);
            return _buildSuccessSection(leagueModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(LeagueModel data) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: data.data!.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemLeagues(data.data![index]);
      },
    );
  }

  Widget _buildItemLeagues(Data league) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PageListTeams(
                      idLeague: league.idLeague!,
                    )));
      },
      child: Card(
        color: Color(0xFFF7EFF1),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                child: league.logoLeagueUrl != null
                    ? Image.network(league.logoLeagueUrl!)
                    : Placeholder(),
              ),
              SizedBox(height: 20),
              Text(
                league.leagueName!,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                "Country: ${league.country!}",
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
