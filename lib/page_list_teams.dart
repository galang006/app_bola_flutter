import 'package:responsi_prak/load_data_source.dart';
import 'package:flutter/material.dart';
import 'package:responsi_prak/page_detail_team.dart';
import 'package:responsi_prak/teams_model.dart';

class PageListTeams extends StatefulWidget {
  final int idLeague;
  const PageListTeams({Key? key, required this.idLeague}) : super(key: key);
  @override
  State<PageListTeams> createState() => _PageListTeamsState ();
}

class _PageListTeamsState extends State<PageListTeams> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " Teams",
          style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Color(0xFF3A023E),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: _buildListTeamsBody(),
    );
  }

  Widget _buildListTeamsBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadTeams(widget.idLeague),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            // Jika data ada error maka akan ditampilkan hasil error
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            // Jika data ada dan berhasil maka akan ditampilkan hasil datanya
            TeamsModel teamsModel = TeamsModel.fromJson(snapshot.data);
            return _buildSuccessSection(teamsModel);
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

  Widget _buildSuccessSection(TeamsModel data) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: data.data!.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemTeams(data.data![index]);
      },
    );
  }

  Widget _buildItemTeams(Data teams) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PageDetailTeam(
                  idLeague: widget.idLeague,
                  idTeam: teams.idClub!,
                )));
      },
      child: Card(
          color: Color(0xFFF7EFF1),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  child: Image.network(teams.logoClubUrl!),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                          teams.nameClub!,
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                          textAlign: TextAlign.center, overflow: TextOverflow.ellipsis
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Head Coach: ${teams.headCoach!}",
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          )

      ),
    );
  }


}
