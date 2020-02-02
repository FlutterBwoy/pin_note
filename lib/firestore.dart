import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreService {
  final CollectionReference myCollection = Firestore.instance.collection('Folder Name');
  Future<Product> createFolder(String name) async {
      final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(myCollection.document(name));

      final Product task = Product(name);
      final Map<String, dynamic> data = task.toMap();
      await tx.set(ds.reference, data);
      return data;
    };

    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      return Product.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');  
      return null;
    });
  }

  Stream<QuerySnapshot> getTaskList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = myCollection.snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }
    if (limit != null) {
      snapshots = snapshots.take(limit);
    }
    return snapshots;
  }

  
}

class Product {
  String name;
 


  Product(this.name);



  Product.map(dynamic obj){
    this.name = obj['Folder Name'];
  
  }

  String get name1 => name;
 

  Map<String,dynamic> toMap(){
    var map=new Map<String,dynamic>();
    map['Folder Name']=name;
   
    return map;
  }

  Product.fromMap(Map<String,dynamic> map){
    this.name= map['Folder Name'];
   
  }
}


