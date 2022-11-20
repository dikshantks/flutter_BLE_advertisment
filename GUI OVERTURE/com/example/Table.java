package com.example;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableRowSorter;

import com.google.api.core.ApiFuture;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

import java.awt.Color;
import javax.swing.JTable;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.awt.event.ActionEvent;
import javax.swing.JLabel;

public class Table extends JFrame {

	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	private JTable table;
	private DefaultTableModel table_model;
	private TableRowSorter<DefaultTableModel> rowsorter;

	public void getdata() throws InterruptedException, ExecutionException

	{
		Firestore db = com.google.firebase.cloud.FirestoreClient.getFirestore();
		ApiFuture<QuerySnapshot> future = db.collection("data").get();

		List<QueryDocumentSnapshot> documents = future.get().getDocuments();

		Object rowdata[] = new Object[4];

		for (QueryDocumentSnapshot document : documents) {

//			System.out.println(document.getData().getClass());
//			System.out.println(document.getData());

			rowdata[0] = document.getData().get("ble");
			rowdata[1] = document.getData().get("data");
			rowdata[2] = document.getData().get("device_name");
			rowdata[3] = document.getData().get("user");
//			System.out.println(rowdata[0] + rowdata[1].toString() + rowdata[2].toString() + rowdata[3].toString() );

		}
	}

	public static void main(String[] args) {

		FileInputStream serviceAccount;
		try {
			serviceAccount = new FileInputStream(
					"/home/dikshant/Desktop/stuff and java/eclipse workspace/GUI OVERTURE/my-second-project-c7122-firebase-adminsdk-q55gt-82c424fa54.json");
			FirebaseOptions options = null;
			try {

				options = FirebaseOptions.builder().setCredentials(GoogleCredentials.fromStream(serviceAccount))
						.setDatabaseUrl("https://my-second-project-c7122.firebaseio.com/").build();
			} catch (IOException e1) {

				e1.printStackTrace();
			}

			FirebaseApp.initializeApp(options);

		} catch (FileNotFoundException e1) {

			e1.printStackTrace();
		}

		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Table frame = new Table();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	public Table() {
		
		
//		Get_teG
		
		setTitle("Overture");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 815, 500);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(36, 31, 49));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		setContentPane(contentPane);
		contentPane.setLayout(null);

		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(88, 121, 595, 240);

		contentPane.add(scrollPane);
		rowsorter = new TableRowSorter<DefaultTableModel>(table_model);

		String rowData[][] = {};

		String ColName[] = { "ble", "Data", "Ble_name", "user" };
		table_model = new DefaultTableModel(rowData, ColName);

		table = new JTable(table_model);
//		table.setModel();
		scrollPane.setViewportView(table);
		table.setName("table");
//
//		Object eg[] = new Object[4];
//
//		eg[0] = "dummy";
//		eg[1] = "dummy";
//		eg[2] = "dummy";
//		eg[3] = "dummmy";

//		table_model.insertRow(0, eg);

		table.setRowSorter(rowsorter);

		JButton btnRefresh = new JButton("Refresh");
		btnRefresh.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				try {
					Thread.sleep(5000);
				} catch (InterruptedException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				table_model.addRow(rowData);

			}

		});

		btnRefresh.setBounds(335, 433, 117, 25);
		contentPane.add(btnRefresh);

		JLabel lblDummy = new JLabel("dummy1");
		lblDummy.setBounds(134, 23, 70, 15);
		contentPane.add(lblDummy);

	}
}
