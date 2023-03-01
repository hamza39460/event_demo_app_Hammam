// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:demo_/models/fighters_model.dart';
import 'package:demo_/models/matches_model.dart';
import 'package:demo_/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'components/tab_bar.dart';
part 'components/all_fighters.dart';
part 'components/all_matches.dart';
part 'components/un_matched_fighters.dart';

final _currentTabProvider = StateProvider<int>((ref) => 0);
final _unmatchedCount = StateProvider<int>((ref) => 0);
final _matchesCount = StateProvider<int>((ref) => 0);
final _allFightersCount = StateProvider<int>((ref) => 0);

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(apiProvider);
    final currentTab = ref.watch(_currentTabProvider);
    return Scaffold(
      body: data.when(
        data: (data) {
          final fighters = ref.read(allFightersProvider).asData?.value;

          final matches = ref.read(allMatchesProvider).asData?.value;

          Future(() {
            ref.read(_matchesCount.notifier).state = matches?.length ?? 0;
            ref.read(_allFightersCount.notifier).state = fighters?.length ?? 0;
            ref.read(_unmatchedCount.notifier).state = data.length;
          });
          return Column(
            children: [
              _TabBar(),
              if (currentTab == 2) _AllFighters(),
              if (currentTab == 1) _AllMatches(),
              if (currentTab == 0) _UnMatchedFighters(fighters: data),
            ],
          );
        },
        error: (error, stackTrace) => Text("Error $error"),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
