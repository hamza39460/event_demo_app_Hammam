part of '../home_page.dart';

final _createMatch = StateProvider<List<FightersModel>>((ref) => []);

class _UnMatchedFighters extends ConsumerWidget {
  _UnMatchedFighters({
    Key? key,
    required this.fighters,
  }) : super(key: key);
  final List<FightersModel> fighters;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createMatch = ref.watch(_createMatch);
    return Expanded(
      child: Column(
        children: [
          if (createMatch.isNotEmpty)
            Expanded(
              flex: 0,
              child: Column(
                children: [
                  const Text("Create Match"),
                  Expanded(
                    flex: 0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: createMatch.length,
                      itemBuilder: (context, index) {
                        final fighter = createMatch[index];
                        return Card(
                          elevation: 4,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${fighter.firstName} ${fighter.lastName}",
                                ),
                                const Spacer(),
                                InkWell(
                                  child: const Icon(Icons.remove),
                                  onTap: () {
                                    createMatch.remove(fighter);
                                    ref.read(_createMatch.notifier).state = [
                                      ...createMatch
                                    ];
                                    fighters.add(fighter);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (createMatch.length < 2) {
                        showError(context, "Please select 2 fighters");
                        return;
                      }
                      ref.read(_unmatchedCount.notifier).state--;
                      ref.read(_unmatchedCount.notifier).state--;
                      ref.read(_matchesCount.notifier).state++;
                      ref.read(allMatchesProvider).asData?.value.add(
                            MatchesModels(
                                redFighter: createMatch[0],
                                blueFighter: createMatch[1]),
                          );
                      ref.read(_createMatch.notifier).state = [];
                    },
                    child: Text("Create Match"),
                  ),
                ],
              ),
            ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: fighters.length,
              itemBuilder: (context, index) {
                final fighter = fighters[index];
                return Card(
                  elevation: 4,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${fighter.firstName} ${fighter.lastName}",
                        ),
                        const Spacer(),
                        InkWell(
                          child: const Icon(Icons.add),
                          onTap: () {
                            if (createMatch.length == 2) {
                              showError(context, 'You can only add 2 fighters');
                              return;
                            }
                            ref.read(_createMatch.notifier).state = [
                              ...createMatch,
                              fighter
                            ];
                            fighters.remove(fighter);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  showError(BuildContext context, String error) {
    final snackBar = SnackBar(
      content: Text(error),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
