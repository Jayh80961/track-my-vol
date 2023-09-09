import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/vol_model.dart';
import 'my_page_view_model.dart';

part 'my_page_presenter.g.dart';

@riverpod
class MyPagePresenter extends _$MyPagePresenter {
  @override
  FutureOr<MyPageViewModel> build() async {
    return fetch();
  }

  Future<MyPageViewModel> fetch() async {
    final CollectionReference<VolModel> volsCollection =
        FirebaseFirestore.instance.collection('vols').withConverter<VolModel>(
              fromFirestore:
                  (DocumentSnapshot<Map<String, dynamic>> snapshot, _) =>
                      VolModel.fromFirestore(snapshot.data()!, snapshot.id),
              toFirestore: (VolModel value, _) => value.toFirestore(),
            );
    final QuerySnapshot<VolModel> querySnapshot = await volsCollection
        .where(
          'userId',
          isEqualTo: FirebaseAuth.instance.currentUser?.uid ?? '',
        )
        .orderBy(
          'createdAt',
          descending: true,
        )
        .limit(10000)
        .get();
    final List<VolModel> vols = querySnapshot.docs
        .map((QueryDocumentSnapshot<VolModel> document) => document.data())
        .toList();
    int totalMinutes = 0;
    int approvedMinutes = 0;
    int approvedVols = 0;
    for (int index = 0; index < vols.length; index++) {
      totalMinutes += vols[index].minutes;
      if (vols[index].isApproved) {
        approvedVols++;
        approvedMinutes += vols[index].minutes;
      }
    }
    return MyPageViewModel(
      isLoading: false,
      vols: vols,
      name: FirebaseAuth.instance.currentUser?.displayName ?? '',
      totalVols: vols.length,
      totalMinutes: totalMinutes,
      approvedVols: approvedVols,
      approvedMinutes: approvedMinutes,
    );
  }

  Future<void> updateVols() async {
    final MyPageViewModel value = await fetch();
    state = AsyncValue<MyPageViewModel>.data(value);
    return;
  }

  Future<void> deleteVol(String id) async {
    state = const AsyncValue<MyPageViewModel>.loading();
    state = await AsyncValue.guard(() async {
      await FirebaseFirestore.instance.collection('vols').doc(id).delete();
      return fetch();
    });
  }
}
