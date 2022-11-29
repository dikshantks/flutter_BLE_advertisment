package com.example;

import java.util.List;
import java.util.concurrent.ExecutionException;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;

public class data {

	public int num() {
		int footfall = 553353453;

		Firestore db = com.google.firebase.cloud.FirestoreClient.getFirestore();
		ApiFuture<QuerySnapshot> future = db.collection("data").get();

		try {
			List<QueryDocumentSnapshot> documents = future.get().getDocuments();

			footfall = documents.size();
		} catch (InterruptedException | ExecutionException e) {

			footfall = 69;
			e.printStackTrace();
		}

		return footfall;
	}

	public int like1() {

		int like = 0;

		Firestore db = com.google.firebase.cloud.FirestoreClient.getFirestore();
		DocumentReference one = db.collection("admin").document("0");

		try {
			like =  ((Long)one.get().get().get("likes")).intValue();
		} catch (InterruptedException | ExecutionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return like;
	}	public int like2() {

		int like = 0;

		Firestore db = com.google.firebase.cloud.FirestoreClient.getFirestore();
		DocumentReference one = db.collection("admin").document("1");

		try {
			like =  ((Long)one.get().get().get("likes")).intValue();
		} catch (InterruptedException | ExecutionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return like;
	}	public int like3() {

		int like = 0;

		Firestore db = com.google.firebase.cloud.FirestoreClient.getFirestore();
		DocumentReference one = db.collection("admin").document("2");

		try {
			like =  ((Long)one.get().get().get("likes")).intValue();
		} catch (InterruptedException | ExecutionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return like;
	}

}
