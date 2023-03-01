part of '../home_page.dart';

class _TabBar extends ConsumerWidget {
  const _TabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matches = ref.watch(_matchesCount);
    final fighters = ref.watch(_allFightersCount);
    final unmatched = ref.watch(_unmatchedCount);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _TabBarItem(
            header: "Unmatched",
            number: unmatched,
            index: 0,
          ),
          _TabBarItem(
            header: "Matches",
            number: matches,
            index: 1,
          ),
          _TabBarItem(
            header: "All",
            number: fighters,
            index: 2,
          ),
        ],
      ),
    );
  }
}

class _TabBarItem extends ConsumerWidget {
  const _TabBarItem({
    Key? key,
    required this.header,
    required this.number,
    required this.index,
  }) : super(key: key);
  final String header;
  final int number;
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _currentTab = ref.watch(_currentTabProvider);
    return InkWell(
      onTap: () {
        ref.read(_currentTabProvider.notifier).state = index;
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "$number",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              header,
              style: TextStyle(
                color: Colors.black,
                decoration:
                    _currentTab == index ? TextDecoration.underline : null,
                decorationThickness: 3,
                decorationColor: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
