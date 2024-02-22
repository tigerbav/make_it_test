import 'package:make_it/flows/notifications/data/models/trigger_model.dart';

abstract class ITriggerDataSource {
  Future<List<TriggerModel>> getTriggers();
}

class TriggerDataSource extends ITriggerDataSource {
  @override
  Future<List<TriggerModel>> getTriggers() async {
    await Future.delayed(const Duration(seconds: 1));

    return const [
      TriggerModel(
        id: 0,
        shortTitle: 'All Triggers',
        longTitle: null,
        children: null,
        selected: true,
        isOpened: null,
      ),
      TriggerModel(
        id: 1,
        shortTitle: 'Sport',
        longTitle: null,
        children: [
          TriggerModel(
            id: 2,
            shortTitle: 'Morning',
            longTitle:
                'Some very long names of action with many symbols in two, three, or four lines with text; the limit should be four lines.Some very long names of action with many symbols in two, three, or four lines with text; the limit should be four lines.',
            children: [
              TriggerModel(
                id: 3,
                shortTitle: '🚴 Biking',
                longTitle: null,
                children: null,
                selected: false,
                isOpened: null,
              ),
              TriggerModel(
                id: 4,
                shortTitle: '🏃 Running',
                longTitle: null,
                children: null,
                selected: false,
                isOpened: null,
              ),
            ],
            selected: true,
            isOpened: true,
          ),
          TriggerModel(
            id: 5,
            shortTitle: 'Evening',
            longTitle: null,
            children: [
              TriggerModel(
                id: 6,
                shortTitle: '🏓 Ping Pong',
                longTitle:
                    '🏓 Some very long names of action with many symbols in two, three, or four lines with text; the limit should be four lines.🏓 Some very long names of action with many symbols in two, three, or four lines with text; the limit should be four lines.',
                children: null,
                selected: false,
                isOpened: null,
              ),
              TriggerModel(
                id: 7,
                shortTitle: '🏐 Volleyball',
                longTitle: null,
                children: null,
                selected: false,
                isOpened: null,
              ),
            ],
            selected: true,
            isOpened: true,
          ),
          TriggerModel(
            id: 8,
            shortTitle: '🥊 Boxing',
            longTitle: null,
            children: null,
            selected: false,
            isOpened: null,
          ),
          TriggerModel(
            id: 9,
            shortTitle: '⚽ Football',
            longTitle: null,
            children: null,
            selected: false,
            isOpened: null,
          ),
        ],
        selected: true,
        isOpened: true,
      ),
      TriggerModel(
        id: 10,
        shortTitle: 'Work',
        longTitle: null,
        children: [
          TriggerModel(
            id: 11,
            shortTitle: '🗓️ Meeting',
            longTitle: null,
            children: null,
            selected: false,
            isOpened: null,
          ),
          TriggerModel(
            id: 12,
            shortTitle: '🖨️ Print document',
            longTitle: null,
            children: null,
            selected: false,
            isOpened: null,
          ),
        ],
        selected: true,
        isOpened: true,
      ),
      TriggerModel(
        id: 13,
        shortTitle: '⏰ Alarm',
        longTitle: null,
        children: null,
        selected: false,
        isOpened: null,
      ),
      TriggerModel(
        id: 14,
        shortTitle: '🎉 Party',
        longTitle: null,
        children: null,
        selected: false,
        isOpened: null,
      ),
      TriggerModel(
        id: 15,
        shortTitle: '🍜 Dinner',
        longTitle: null,
        children: null,
        selected: false,
        isOpened: null,
      ),
    ];
  }
}
