import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:task/model/datamodel.dart';

class ItemService {
  String data = 'data';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference<DataModel> product;
  Reference storage = FirebaseStorage.instance.ref();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  ItemService() {
    product = firestore.collection(data).withConverter<DataModel>(
      fromFirestore: (snapshot, options) {
        return DataModel.fromjson(
          snapshot.id,
          snapshot.data()!,
        );
      },
      toFirestore: (value, options) {
        return value.tojson();
      },
    );
  }

  Future<void> addItem(DataModel data) async {
    try {
      await product.add(data);
    } catch (e) {
      log('Error adding post :$e');
    }
  }

  Future<List<DataModel>> getAllItems() async {
    final snapshot = await product.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<void> addToCart(String id, String userId) async {
    try {
      await product.doc(id).update(
        {
          'cart': FieldValue.arrayUnion([userId])
        },
      );
    } catch (e) {
      log("Error adding to cart: $e");
    }
  }

  Future<void> favListClicked(String id, bool status) async {
    try {
      if (status == true) {
        await product.doc(id).update(
          {
            'wishlist': FieldValue.arrayUnion(
              [
                firebaseAuth.currentUser!.email ??
                    firebaseAuth.currentUser!.phoneNumber
              ],
            )
          },
        );
      } else {
        await product.doc(id).update(
          {
            'wishlist': FieldValue.arrayRemove(
              [
                firebaseAuth.currentUser!.email ??
                    firebaseAuth.currentUser!.phoneNumber
              ],
            )
          },
        );
      }
    } catch (e) {
      log("error is $e");
    }
  }

  deleteProduct(productid) async {
    try {
      await product.doc(productid).delete();
      log("The product id deleted");
    } catch (e) {
      log("the product is not deletd $e");
    }
  }

  updateproduct(productid, DataModel data) async {
    try {
      await product.doc(productid).update(data.tojson());
    } catch (e) {
      log("error in updating product : $e");
    }
  }
}
