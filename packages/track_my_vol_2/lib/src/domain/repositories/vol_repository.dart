import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/models.dart';

// part 'vol_repository.g.dart';

final Provider<Repository> repositoryProvider =
    Provider<Repository>(Repository.new);

class Repository {
  Repository(this.ref);

  final Ref ref;

  Future<VolModel> fetchVolModel() async {
    // final CollectionReference<VolModel> volsCollection =
    //     FirebaseFirestore.instance.collection('vols').withConverter<VolModel>(
    //           fromFirestore:
    //               (DocumentSnapshot<Map<String, dynamic>> snapshot, _) =>
    //                   VolModel.fromFirestore(snapshot.data()!, snapshot.id),
    //           toFirestore: (VolModel value, _) => value.toFirestore(),
    //         );
    // final QuerySnapshot<VolModel> querySnapshot = await volsCollection
    //     .orderBy(
    //       'createdAt',
    //       descending: true,
    //     )
    //     .limit(10000)
    //     .get();
    // final List<VolModel> vols = querySnapshot.docs
    //     .map((QueryDocumentSnapshot<VolModel> document) => document.data())
    //     .toList();
    // return vols[0];
    return VolModel(
      id: '1',
      userId: 'userId',
      images: [],
      title: 'title',
      description: 'description',
      horus: 1,
      year: 2,
      month: 3,
      day: 4,
      fullName: 'fullName',
      category: 'category',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isApproved: false,
    );
  }
}
