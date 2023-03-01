part of '../home_page.dart';

class _AllMatches extends ConsumerWidget {
  const _AllMatches({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matches = ref.read(allMatchesProvider).asData?.value;

    return Expanded(
      child: ListView.builder(
        itemCount: matches?.length ?? 0,
        itemBuilder: (context, index) {
          final match = matches?[index];
          if (match == null) return Container();
          if (match.redFighter == null && match.blueFighter == null) {
            return Container();
          }
          return Card(
            elevation: 4,
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${match.redFighter?.firstName ?? ""} vs ${match.blueFighter?.firstName ?? ""}",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
