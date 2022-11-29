package com.example;

// import java.util.Map;
// import java.util.Arrays;
// import java.util.HashMap;
import java.util.List;
import java.util.concurrent.ExecutionException;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;

public class Beacon {

	int id;

	String ble_name, img, textinfo, url;

	String[] offers;

	Beacon() {

	}

	public void Headupdate(Firestore db, int id, String head) {

		ApiFuture<WriteResult> future = db.collection("admin").document(Integer.toString(id)).update("heading", head);

		try {
			System.out.print(future.get().getUpdateTime());
		} catch (InterruptedException | ExecutionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void urlupdate(Firestore db, int id, String head) {

		// Add a new document (asynchronously) in collection "cities" with id "LA"
		ApiFuture<WriteResult> future = db.collection("admin").document(Integer.toString(id)).update("url", head);

		try {
			System.out.print(future.get().getUpdateTime());
		} catch (InterruptedException | ExecutionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void infoupdate(Firestore db, int id, String head) {

		// Add a new document (asynchronously) in collection "cities" with id "LA"
		ApiFuture<WriteResult> future = db.collection("admin").document(Integer.toString(id)).update("content", head);

		try {
			System.out.print(future.get().getUpdateTime());
		} catch (InterruptedException | ExecutionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void imgupdate(Firestore db, int id, String head) {

		ApiFuture<WriteResult> future = db.collection("admin").document(Integer.toString(id)).update("img", head);

		try {
			System.out.print(future.get().getUpdateTime());
		} catch (InterruptedException | ExecutionException e) {

			e.printStackTrace();
		}

	}

	public void Offersupdate(Firestore db, int id, List<String> head) {
		// Add a new document (asynchronously) in collection "cities" with id "LA"
		ApiFuture<WriteResult> future = db.collection("admin").document(Integer.toString(id)).update("offers", head);

		try {
			System.out.print(future.get().getUpdateTime());
		} catch (InterruptedException | ExecutionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
