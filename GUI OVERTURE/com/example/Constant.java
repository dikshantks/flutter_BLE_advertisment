package com.example;

import java.awt.Color;
import java.util.List;
import java.util.concurrent.ExecutionException;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;

public class Constant {

	Color main = Color.decode("#37413e");

	Color right = (new Color(35, 35, 35));
	Color left = (new Color(70, 70, 70));

	Color box = Color.decode("#a1cad4") ; 
	Color dark = (new Color(35,35,35));
	Color text = (new Color(35,35,35));

//	Color dark = Color.decode("#37413e");
	Color hover = Color.decode("#a1cad4");
	Color defaul = Color.decode("#1e2323");

	Color onclic = Color.decode("#a1cad4");

	public void getdata() throws InterruptedException, ExecutionException

	{
		Firestore db = com.google.firebase.cloud.FirestoreClient.getFirestore();
		ApiFuture<QuerySnapshot> future = db.collection("data").get();

		List<QueryDocumentSnapshot> documents = future.get().getDocuments();

		Object rowdata[] = new Object[4];

		for (QueryDocumentSnapshot document : documents) {

//		System.out.println(document.getData().getClass());
//		System.out.println(document.getData());

			rowdata[0] = document.getData().get("ble");
			rowdata[1] = document.getData().get("data");
			rowdata[2] = document.getData().get("device_name");
			rowdata[3] = document.getData().get("user");
//		System.out.println(rowdata[0] + rowdata[1].toString() + rowdata[2].toString() + rowdata[3].toString() );

		}
	}
}
