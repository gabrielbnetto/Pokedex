

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pokedex/Utils/TypeColorUtils.dart';

class StatsPokemon extends StatefulWidget {
  final List<Stats> stats;
  final List<Types> types;
  final int baseExperience;

  StatsPokemon(this.stats, this.types, this.baseExperience, {Key key}) : super(key: key);

  @override
  _StatsPokemon createState() => _StatsPokemon();
}

class _StatsPokemon extends State<StatsPokemon> {
  TypeColorUtils color = new TypeColorUtils();
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: AspectRatio(
        aspectRatio: 1,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          color: color.typeColor(widget.types[0].type.name),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      'Pokemon Base Stats',
                      style: TextStyle(
                          color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Base Experience: ' + widget.baseExperience.toString(),
                      style: TextStyle(
                          color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: BarChart(
                          mainBarData()
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      )
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [Colors.black] : [barColor],
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 255,
            colors: [Colors.white.withOpacity(0.3)],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() {
    List<BarChartGroupData> groups = [];
    for (var i = 0; i < widget.stats.length; i++){
      BarChartGroupData barChartGroupData = makeGroupData(i, widget.stats[i].baseStat.toDouble(), isTouched: i == touchedIndex);
      groups.add(barChartGroupData);
    }
    return groups;
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.white,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String attribute;
                if(widget.stats[group.x.toInt()].stat.name.contains("-")){
                  List<String> name = widget.stats[group.x.toInt()].stat.name.split("-");
                  attribute = "${name[0][0].toUpperCase()}${name[0].substring(1,name[0].length)}-${name[1][0].toUpperCase()}${name[1].substring(1,name[1].length)}";
                }else{
                  String name = widget.stats[group.x.toInt()].stat.name;
                  attribute = "${name[0][0].toUpperCase()}${name.substring(1, name.length)}";
                }
              return BarTooltipItem(
                  attribute + '\n' + (rod.y - 1).toString(), TextStyle(color: Colors.black));
            }),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! FlPanEnd &&
                barTouchResponse.touchInput is! FlLongPressEnd) {
              touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          interval: 16,
          showTitles: true,
          getTextStyles: (value) =>
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            if(widget.stats[value.toInt()].stat.name.contains("-")){
              List<String> name = widget.stats[value.toInt()].stat.name.split("-");
              return "${name[0].substring(0,2).toUpperCase()}-${name[1].substring(0,2).toUpperCase()}";
            }
            return widget.stats[value.toInt()].stat.name.substring(0,2).toUpperCase();
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }
}

    






  


  
