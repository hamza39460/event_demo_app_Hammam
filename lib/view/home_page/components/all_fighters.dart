part of '../home_page.dart';

class _AllFighters extends ConsumerWidget {
  const _AllFighters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fighters = ref.read(allFightersProvider).asData?.value;
    return Expanded(
      child: ListView.builder(
        itemCount: fighters?.length ?? 0,
        itemBuilder: (context, index) {
          final fighter = fighters?[index];
          if (fighter == null) return Container();
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
