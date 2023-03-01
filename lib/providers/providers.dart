import 'package:demo_/managers/api_manager.dart';
import 'package:demo_/models/fighters_model.dart';
import 'package:demo_/models/matches_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '';

final allFightersProvider = FutureProvider(
  (ref) async {
    final response = await APIManager()
        .get("https://staging-api.konquer.club/api/v1/events/42/fighters");
    final data = response.data;
    List<FightersModel> list = [];
    for (var d in data) {
      list.add(FightersModel.fromJson(d));
    }
    return list;
  },
);

final allMatchesProvider = FutureProvider(
  (ref) async {
    final response = await APIManager().get(
        "https://staging-api.konquer.club/api/v1/events/42/boutsheets/43/sessions");
    final data = response.data;
    List<MatchesModels> list = [];
    for (var d in data) {
      list.add(MatchesModels.fromJson(d));
    }
    return list;
  },
);
final apiProvider = FutureProvider<List<FightersModel>>((ref) async {
  final fighters = await ref.watch(allFightersProvider.future);
  final matches = await ref.watch(allMatchesProvider.future);
  List<FightersModel> _unmatched = List.from(fighters);
  matches.forEach((match) {
    _unmatched.removeWhere((element) => element.id == match.redFighter?.id);
    _unmatched.removeWhere((element) => element.id == match.blueFighter?.id);
    _unmatched.removeWhere((element) => element.id == match.winner?.id);
  });
  return _unmatched;
});
