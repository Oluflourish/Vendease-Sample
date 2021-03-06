import 'package:rxdart/rxdart.dart';

class AppNavBloc {
  final _tabIndex = BehaviorSubject<int>.seeded(0); // Defaults to home tab

  Stream<int> get tabIndex => _tabIndex.stream;

  setTabIndex(int index) => _tabIndex.sink.add(index);

  dispose() => _tabIndex.close();
}
