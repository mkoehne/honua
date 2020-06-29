import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:honua/models/challange.dart';
import 'package:honua/models/entry.dart';
import 'package:honua/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../application.dart';

final CollectionReference challengesCollection =
    Firestore.instance.collection('challenges');

final CollectionReference entriesCollection =
    Firestore.instance.collection('entries');

class Repository {
  static final Repository _instance = new Repository.internal();

  factory Repository() => _instance;

  Repository.internal();

  Future<List<Challenge>> getChallenges() async {
    QuerySnapshot querySnapshot = await challengesCollection.getDocuments();
    var list = querySnapshot.documents;

    List<Challenge> challenges = new List<Challenge>();

    for (var item in list) {
      var challenge = Challenge.fromMap(item.data);
      challenges.add(challenge);
    }

    return challenges;
  }

  Future<Entry> createEntry(Entry entry) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(entriesCollection.document());

      entry.id = ds.documentID;
      final Map<String, dynamic> data = entry.toMap();
      await tx.set(ds.reference, data);

      return data;
    };

    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      var entry = Entry.fromMap(mapData);

      return entry;
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  Future<List<Entry>> getEntries() async {
    QuerySnapshot querySnapshot = await entriesCollection.getDocuments();
    var list = querySnapshot.documents;

    List<Entry> entries = new List<Entry>();

    for (var item in list) {
      var entry = Entry.fromMap(item.data);
      entries.add(entry);
    }

    return entries;
  }

  Future<void> createUser(User user) async {
    Firestore.instance
        .collection('users')
        .document(user.id)
        .setData(user.toMap());
  }

  Future<dynamic> updateUser(User user) async {
    var collection = Firestore.instance.collection('users');

    final TransactionHandler updateTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(collection.document(user.id));

      await tx.update(ds.reference, user.toMap());
      return {'updated': true};
    };

    return Firestore.instance
        .runTransaction(updateTransaction)
        .then((result) => result['updated'])
        .catchError((error) {
      print('error: $error');
      return false;
    });
  }

  Future<dynamic> updateToken(String token) async {
    Application.pushToken = token;
    Application.savePushToken(token);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString('id');
    var collection = Firestore.instance.collection('users');
    var data = await collection.document(id).get();
    var user = User.fromMap(data.data);

    if (!Application.user.pushTokens.contains(token)) {
      Application.user.pushTokens.add(token);
    }

    if (!user.pushTokens.contains(token)) {
      user.pushTokens.add(token);

      final TransactionHandler updateTransaction = (Transaction tx) async {
        final DocumentSnapshot ds = await tx.get(collection.document(user.id));

        await tx.update(ds.reference, user.toMap());
        return {'updated': true};
      };

      return Firestore.instance
          .runTransaction(updateTransaction)
          .then((result) => result['updated'])
          .catchError((error) {
        print('error: $error');
        return false;
      });
    }
  }

  Future<User> getUser(String id) async {
    var collection = Firestore.instance.collection('users');
    var data = await collection.document(id).get();
    var user = User.fromMap(data.data);
    return user;
  }
}
