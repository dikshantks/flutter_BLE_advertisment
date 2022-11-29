package com.example;

import java.util.List;
import java.util.concurrent.ExecutionException;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;

public class Get_teG {
	
	
	public void getdata() 
	{
		
		Firestore db = com.google.firebase.cloud.FirestoreClient.getFirestore();
		ApiFuture<QuerySnapshot> future = db.collection("data").get();
		List<QueryDocumentSnapshot> documents = null;
		try {
			documents = future.get().getDocuments();
		} catch (InterruptedException | ExecutionException e1) {
			e1.printStackTrace();
		}
		Object rowdata[] = new Object[4];

		for (QueryDocumentSnapshot document : documents) {

			System.out.println(document.getData().getClass());
			System.out.println(document.getData());

			rowdata[0] = document.getData().get("ble");
			rowdata[1] = document.getData().get("data");
			rowdata[2] = document.getData().get("device_name");
			rowdata[3] = document.getData().get("user");
			System.out.println(
					rowdata[0] + rowdata[1].toString() + rowdata[2].toString() + rowdata[3].toString());
		}
	}
	
//	public arra

}
