import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/vol_model.dart';
import 'home_page_view_model.dart';

part 'home_page_presenter.g.dart';

@riverpod
class HomePagePresenter extends _$HomePagePresenter {
  @override
  FutureOr<HomePageViewModel> build() async {
    return fetch();
  }

  Future<HomePageViewModel> fetch() async {
    final CollectionReference<VolModel> volsCollection =
        FirebaseFirestore.instance.collection('vols').withConverter<VolModel>(
              fromFirestore:
                  (DocumentSnapshot<Map<String, dynamic>> snapshot, _) =>
                      VolModel.fromFirestore(snapshot.data()!, snapshot.id),
              toFirestore: (VolModel value, _) => value.toFirestore(),
            );
    final QuerySnapshot<VolModel> querySnapshot = await volsCollection
        .orderBy(
          'createdAt',
          descending: true,
        )
        .limit(10000)
        .get();
    final List<VolModel> vols = querySnapshot.docs
        .map((QueryDocumentSnapshot<VolModel> document) => document.data())
        .toList();
    return HomePageViewModel(isLoading: false, vols: vols);
  }

  Future<void> updateVols() async {
    state = await AsyncValue.guard(() async {
      final HomePageViewModel value = await fetch();
      return value;
    });
    return;
  }
}
