const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp(functions.config().functions);

const firestoreDatabase = admin.firestore();

exports.rewardUsers = functions.firestore
  .document("users/{usersID}")
  .onCreate(async (doc, context) => {
    const dateTimeNow = Date.now();
    const user = doc.data();

    const referralCode = user["referral_code"] ?? "";
    const currentUserUID = user["uid"] ?? "";

    if (referralCode !== "") {
      const referredUserSnapshot = await firestoreDatabase
        .collection("users")
        .where("refer_code", "==", referralCode)
        .get();
      const referredUser = referredUserSnapshot.docs[0].data();
      const referredUserUID = referredUser["uid"] ?? "";

      let batch = firestoreDatabase.batch();

      batch.update(firestoreDatabase.collection("users").doc(referredUserUID), {
        reward: admin.firestore.FieldValue.increment(100),
      });

      batch.set(
        firestoreDatabase
          .collection("users")
          .doc(referredUserUID)
          .collection("referrers")
          .doc(currentUserUID),
        {
          createdAt: dateTimeNow,
          uid: currentUserUID,
        }
      );

      await batch.commit();

      //       await firestoreDatabase
      //         .collection("users")
      //         .doc(referredUserUID)
      //         .update({
      //           reward: admin.firestore.FieldValue.increment(100),
      //         });

      //       await firestoreDatabase
      //         .collection("users")
      //         .doc(referredUserUID)
      //         .collection("referrers")
      //         .doc(currentUserUID)
      //         .set({
      //           createdAt: dateTimeNow,
      //           uid: currentUserUID,
      //         });
    }
  });
