package com.example;

import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.SystemColor;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
// import java.util.concurrent.ExecutionException;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;
import javax.swing.border.EmptyBorder;
// import javax.swing.border.LineBorder;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.Firestore;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.FirestoreClient;

import javax.swing.SwingConstants;
// import javax.swing.JTextField;
import javax.swing.JTextArea;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JList;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
// import javax.swing.JScrollPane;
// import javax.swing.ScrollPaneConstants;
import javax.swing.UIManager;

public class TabbedUI extends JFrame {

	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	private JTabbedPane tabbedPane;
	private JPanel panel;
	private JPanel B1_button;
	private JPanel B2_button;
	private JPanel B3_button;
	private JLabel lblFootFall_real;

	private JTextArea link;

	private JTextArea ListField;

	private JTextArea img_text_1;
	private JTextArea ListField_1;
	private JTextArea ListField_2;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {

		FileInputStream serviceAccount;

		FirebaseOptions options = null;
		try {
			serviceAccount = new FileInputStream(
					"/home/dikshant/Desktop/stuff and java/eclipse workspace/GUI OVERTURE/my-second-project-c7122-firebase-adminsdk-q55gt-82c424fa54.json");

			try {
				options = FirebaseOptions.builder().setCredentials(GoogleCredentials.fromStream(serviceAccount))
						.setDatabaseUrl("https://my-second-project-c7122.firebaseio.com/").build();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}

		FirebaseApp.initializeApp(options);

		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					TabbedUI frame = new TabbedUI();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	Firestore db = FirestoreClient.getFirestore();

	/**
	 * Create the ame.
	 */
	public TabbedUI() {

		Constant one = new Constant();

		setBackground(one.dark);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 958, 550);
		contentPane = new JPanel();
		contentPane.setForeground(one.dark);
		contentPane.setBackground(SystemColor.desktop);
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		setContentPane(contentPane);
		contentPane.setLayout(null);

		panel = new JPanel();
		panel.setBackground(new Color(35, 35, 35));
		panel.setBounds(0, -13, 233, 768);
		contentPane.add(panel);
		panel.setLayout(null);
		tabbedPane = new JTabbedPane(JTabbedPane.TOP);
		tabbedPane.setBounds(217, -50, 1085, 768);
		contentPane.add(tabbedPane);

		B1_button = new JPanel();
		B1_button.addMouseListener(new MouseAdapter() {

			@Override
			public void mouseClicked(MouseEvent e) {

				tabbedPane.setSelectedIndex(0);
				B1_button.setBackground(one.onclic);
				B2_button.setBackground(one.dark);
				B3_button.setBackground(one.dark);

			}

			@Override
			public void mouseEntered(MouseEvent e) {

				B1_button.setBackground(one.onclic);

			}

			@Override
			public void mouseExited(MouseEvent e) {
				B1_button.setBackground(one.dark);

			}

		});
		B1_button.setBackground(new Color(47, 79, 79));
		B1_button.setBounds(0, 161, 233, 57);
		panel.add(B1_button);
		B1_button.setLayout(null);

		JLabel lblBeacon = new JLabel("Beacon1");
		lblBeacon.setForeground(new Color(95, 158, 160));
		lblBeacon.setFont(new Font("FreeSans", Font.BOLD, 23));
		lblBeacon.setBounds(12, 12, 142, 33);
		B1_button.add(lblBeacon);
		//
		B2_button = new JPanel();
		B2_button.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {

				tabbedPane.setSelectedIndex(1);
				B2_button.setBackground(one.onclic);
				B1_button.setBackground(one.defaul);
				B3_button.setBackground(one.defaul);

			}

			//
			@Override
			public void mouseEntered(MouseEvent e) {

				B2_button.setBackground(one.onclic);

			}

			@Override
			public void mouseExited(MouseEvent e) {
				// B2_button.setBackground(one.defaul);

			}

		});
		B2_button.setBackground(new Color(47, 79, 79));
		B2_button.setBounds(0, 230, 233, 57);
		panel.add(B2_button);
		B2_button.setLayout(null);

		JLabel lblBeacon_1 = new JLabel("Beacon2");
		lblBeacon_1.setBounds(12, 19, 96, 26);
		lblBeacon_1.setForeground(new Color(95, 158, 160));
		lblBeacon_1.setFont(new Font("FreeSans", Font.BOLD, 23));
		B2_button.add(lblBeacon_1);

		B3_button = new JPanel();
		B3_button.addMouseListener(new MouseAdapter() {

			public void mouseClicked(MouseEvent e) {

				tabbedPane.setSelectedIndex(2);
				B3_button.setBackground(one.onclic);
				B2_button.setBackground(one.defaul);
				B1_button.setBackground(one.defaul);

			}

			@Override
			public void mouseEntered(MouseEvent e) {

				B3_button.setBackground(one.onclic);

			}

			@Override
			public void mouseExited(MouseEvent e) {
				// B3_button.setBackground(one.defaul);

			}

		});
		B3_button.setBackground(new Color(47, 79, 79));
		B3_button.setBounds(0, 299, 233, 57);
		panel.add(B3_button);
		B3_button.setLayout(null);

		JLabel lblBeacon_1_1 = new JLabel("Beacon3");
		lblBeacon_1_1.setForeground(new Color(95, 158, 160));
		lblBeacon_1_1.setFont(new Font("FreeSans", Font.BOLD, 23));
		lblBeacon_1_1.setBounds(12, 19, 96, 26);
		B3_button.add(lblBeacon_1_1);

		JLabel lblFootFall = new JLabel("FootFall");
		lblFootFall.setHorizontalAlignment(SwingConstants.CENTER);
		lblFootFall.setForeground(new Color(0, 128, 128));
		lblFootFall.setFont(new Font("Dialog", Font.BOLD, 28));
		lblFootFall.setBounds(12, 26, 209, 50);
		panel.add(lblFootFall);

		data foot = new data();

		lblFootFall_real = new JLabel(Integer.toString(foot.num()));
		lblFootFall_real.setHorizontalAlignment(SwingConstants.CENTER);
		lblFootFall_real.setForeground(new Color(0, 128, 128));
		lblFootFall_real.setFont(new Font("DejaVu Sans Mono", Font.BOLD, 28));
		lblFootFall_real.setBounds(12, 72, 209, 50);
		panel.add(lblFootFall_real);

		JPanel Beacon1 = new JPanel();
		Beacon1.setBackground(new Color(40, 40, 40));
		tabbedPane.addTab("New tab", null, Beacon1, null);
		Beacon1.setLayout(null);

		Beacon B_one = new Beacon();

		JLabel lblHeading = new JLabel("Website");
		lblHeading.setForeground(Color.LIGHT_GRAY);
		lblHeading.setHorizontalAlignment(SwingConstants.CENTER);
		lblHeading.setFont(new Font("DialogInput", Font.BOLD, 25));
		lblHeading.setBounds(12, 185, 143, 32);
		Beacon1.add(lblHeading);

		JLabel lblContent = new JLabel("Content");
		lblContent.setForeground(Color.LIGHT_GRAY);
		lblContent.setHorizontalAlignment(SwingConstants.CENTER);
		lblContent.setFont(new Font("DialogInput", Font.BOLD, 25));
		lblContent.setBounds(12, 309, 143, 44);
		Beacon1.add(lblContent);

		JTextArea content_area = new JTextArea();
		content_area.setFont(new Font("Dialog", Font.BOLD, 22));
		content_area.setWrapStyleWord(true);
		content_area.setLineWrap(true);
		content_area.setBounds(164, 288, 245, 107);
		Beacon1.add(content_area);

		link = new JTextArea();
		link.setFont(new Font("Dialog", Font.BOLD, 22));
		link.setBackground(UIManager.getColor("Button.background"));
		link.setWrapStyleWord(true);
		link.setLineWrap(true);
		link.setBounds(164, 185, 245, 32);
		Beacon1.add(link);

		JLabel lblNewLabel = new JLabel("Likes: ");
		lblNewLabel.setForeground(Color.LIGHT_GRAY);
		lblNewLabel.setFont(new Font("Dialog", Font.PLAIN, 22));
		lblNewLabel.setBounds(57, 46, 98, 32);
		Beacon1.add(lblNewLabel);

		JButton web_button = new JButton("change");
		web_button.setBackground(UIManager.getColor("Button.darkShadow"));
		web_button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				B_one.urlupdate(db, 0, link.getText());

			}
		});
		web_button.setBounds(421, 185, 117, 25);
		Beacon1.add(web_button);

		JButton content_button = new JButton("change");
		content_button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				B_one.infoupdate(db, 0, content_area.getText());
			}
		});
		content_button.setBounds(421, 323, 117, 25);
		Beacon1.add(content_button);

		JLabel lblList = new JLabel("Offers");
		lblList.setForeground(Color.LIGHT_GRAY);
		lblList.setHorizontalAlignment(SwingConstants.CENTER);
		lblList.setFont(new Font("DialogInput", Font.BOLD, 25));
		lblList.setBounds(12, 426, 143, 44);
		Beacon1.add(lblList);

		JList<String> offer_list = new JList<String>();
		offer_list.setBounds(445, 402, 205, 120);
		Beacon1.add(offer_list);

		DefaultListModel<String> model = new DefaultListModel<String>();

		List<String> offers1 = new ArrayList<String>();
		// offers1.add("1") ;

		offer_list.setModel(model);

		JButton btn_add = new JButton("add"); // come bac khere

		btn_add.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				if (!ListField.getText().toString().isEmpty()) {

					String offer = ListField.getText().toString();

					model.addElement(offer);

					offers1.add(offer);

					ListField.setText(null);

					B_one.Offersupdate(db, 0, offers1);

				}

			}
		});
		btn_add.setBounds(164, 457, 117, 25);
		Beacon1.add(btn_add);

		JLabel lblHeading_3 = new JLabel("Heading");
		lblHeading_3.setForeground(Color.LIGHT_GRAY);
		lblHeading_3.setHorizontalAlignment(SwingConstants.CENTER);
		lblHeading_3.setFont(new Font("DialogInput", Font.BOLD, 25));
		lblHeading_3.setBounds(22, 229, 143, 32);
		Beacon1.add(lblHeading_3);

		JTextArea Heading = new JTextArea();
		Heading.setFont(new Font("Dialog", Font.BOLD, 22));
		Heading.setWrapStyleWord(true);
		Heading.setLineWrap(true);
		Heading.setBounds(164, 242, 245, 32);
		Beacon1.add(Heading);

		JButton heading_button = new JButton("change");
		heading_button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				B_one.Headupdate(db, 0, Heading.getText());
			}
		});
		heading_button.setBounds(421, 249, 117, 25);
		Beacon1.add(heading_button);

		JLabel like_counter = new JLabel(Long.toString(foot.like1()));
		like_counter.setForeground(Color.LIGHT_GRAY);
		like_counter.setFont(new Font("Dialog", Font.PLAIN, 22));
		like_counter.setBounds(164, 46, 98, 32);
		Beacon1.add(like_counter);

		JLabel lblShowImage = new JLabel("Image");
		lblShowImage.setForeground(Color.LIGHT_GRAY);
		lblShowImage.setHorizontalAlignment(SwingConstants.CENTER);
		lblShowImage.setFont(new Font("DialogInput", Font.BOLD, 25));
		lblShowImage.setBounds(12, 122, 143, 32);
		Beacon1.add(lblShowImage);

		JTextArea img_text = new JTextArea();
		img_text.setFont(new Font("Dialog", Font.BOLD, 22));

		// LineBorder lineBorder =new LineBorder(Color.white, 1, true);

		img_text.setWrapStyleWord(true);
		img_text.setLineWrap(true);
		// img_text.setBorder(lineBorder);
		img_text.setBackground(UIManager.getColor("Button.background"));
		img_text.setBounds(164, 122, 245, 32);
		Beacon1.add(img_text);

		JButton img_button = new JButton("add new"); /// ONE HERE
		img_button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				if (!img_text.getText().toString().isEmpty()) {

					B_one.imgupdate(db, 0, img_text.getText());

				}

			}

		});
		img_button.setBounds(421, 122, 117, 25);
		Beacon1.add(img_button);
		ListField = new JTextArea();
		ListField.setFont(new Font("Dialog", Font.BOLD, 22));
		ListField.setBounds(164, 420, 245, 25);
		Beacon1.add(ListField);

		JButton btnDelete = new JButton("delete");
		btnDelete.setBounds(292, 457, 117, 25);
		Beacon1.add(btnDelete);

		JPanel Beacon2 = new JPanel();
		Beacon2.setForeground(Color.DARK_GRAY);
		Beacon2.setBackground(new Color(40, 40, 40));
		tabbedPane.addTab("New tab", null, Beacon2, null);
		Beacon2.setLayout(null);

		JLabel lblHeading_1 = new JLabel("Website");
		lblHeading_1.setForeground(Color.LIGHT_GRAY);
		lblHeading_1.setHorizontalAlignment(SwingConstants.CENTER);
		lblHeading_1.setFont(new Font("DialogInput", Font.BOLD, 25));
		lblHeading_1.setBounds(12, 186, 143, 32);
		Beacon2.add(lblHeading_1);

		JLabel lblContent_1 = new JLabel("Content");
		lblContent_1.setForeground(Color.LIGHT_GRAY);
		lblContent_1.setHorizontalAlignment(SwingConstants.CENTER);
		lblContent_1.setFont(new Font("DialogInput", Font.BOLD, 25));
		lblContent_1.setBounds(12, 310, 143, 44);
		Beacon2.add(lblContent_1);

		JTextArea content_area_1 = new JTextArea();
		content_area_1.setFont(new Font("Dialog", Font.BOLD, 22));
		content_area_1.setWrapStyleWord(true);
		content_area_1.setLineWrap(true);
		content_area_1.setBounds(164, 289, 245, 107);
		Beacon2.add(content_area_1);

		JTextArea link_1 = new JTextArea();
		link_1.setFont(new Font("Dialog", Font.BOLD, 23));
		link_1.setWrapStyleWord(true);
		link_1.setLineWrap(true);
		link_1.setBackground(UIManager.getColor("Button.background"));
		link_1.setBounds(164, 186, 245, 32);
		Beacon2.add(link_1);

		JLabel lblNewLabel_1 = new JLabel("Likes: ");
		lblNewLabel_1.setForeground(Color.LIGHT_GRAY);
		lblNewLabel_1.setFont(new Font("Dialog", Font.PLAIN, 22));
		lblNewLabel_1.setBounds(57, 47, 98, 32);
		Beacon2.add(lblNewLabel_1);

		JButton web_button_1 = new JButton("change");
		web_button_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				if (!link_1.getText().toString().isEmpty()) {

					B_one.urlupdate(db, 1, link_1.getText());

				}

			}
		});
		web_button_1.setBounds(421, 186, 117, 25);
		Beacon2.add(web_button_1);

		JButton content_button_1 = new JButton("change");
		content_button_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) { /// come she

				if (!content_area_1.getText().toString().isEmpty()) {

					B_one.infoupdate(db, 1, content_area_1.getText());

				}
			}
		});
		content_button_1.setBounds(421, 324, 117, 25);
		Beacon2.add(content_button_1);

		JLabel lblList_1 = new JLabel("Offers");
		lblList_1.setForeground(Color.LIGHT_GRAY);
		lblList_1.setHorizontalAlignment(SwingConstants.CENTER);
		lblList_1.setFont(new Font("DialogInput", Font.BOLD, 25));
		lblList_1.setBounds(12, 427, 143, 44);
		Beacon2.add(lblList_1);

		DefaultListModel<String> model1 = new DefaultListModel<String>();

		List<String> offers2 = new ArrayList<String>();
		// offers1.add("1") ;

		JList<String> offer_list_1 = new JList<String>();
		offer_list_1.setBounds(445, 403, 205, 120);
		Beacon2.add(offer_list_1);

		offer_list_1.setModel(model);
		// place

		JButton btn_add_1 = new JButton("add");
		btn_add_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				if (!ListField_1.getText().toString().isEmpty()) {

					String offer = ListField_1.getText().toString();

					model1.addElement(offer);

					offers2.add(offer);

					ListField.setText(null);

					B_one.Offersupdate(db, 1, offers2);

				}
			}
		});
		btn_add_1.setBounds(164, 458, 117, 25);
		Beacon2.add(btn_add_1);

		JLabel lblHeading_3_1 = new JLabel("Heading");
		lblHeading_3_1.setForeground(Color.LIGHT_GRAY);
		lblHeading_3_1.setHorizontalAlignment(SwingConstants.CENTER);
		lblHeading_3_1.setFont(new Font("DialogInput", Font.BOLD, 25));
		lblHeading_3_1.setBounds(22, 230, 143, 32);
		Beacon2.add(lblHeading_3_1);

		JTextArea Heading_1 = new JTextArea();
		Heading_1.setFont(new Font("Dialog", Font.BOLD, 22));
		Heading_1.setWrapStyleWord(true);
		Heading_1.setLineWrap(true);
		Heading_1.setBounds(164, 243, 245, 32);
		Beacon2.add(Heading_1);

		JButton heading_button_1 = new JButton("change");
		heading_button_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				if (!Heading_1.getText().toString().isEmpty()) {

					B_one.Headupdate(db, 1, Heading_1.getText());

				}
			}
		});
		heading_button_1.setBounds(421, 250, 117, 25);
		Beacon2.add(heading_button_1);

		JLabel like_counter_1 = new JLabel(Long.toString(foot.like2())); // heeeee
		like_counter_1.setForeground(Color.LIGHT_GRAY);
		like_counter_1.setFont(new Font("Dialog", Font.PLAIN, 22));
		like_counter_1.setBounds(164, 47, 98, 32);
		Beacon2.add(like_counter_1);

		JLabel lblShowImage_1 = new JLabel("Image");
		lblShowImage_1.setForeground(Color.LIGHT_GRAY);
		lblShowImage_1.setHorizontalAlignment(SwingConstants.CENTER);
		lblShowImage_1.setFont(new Font("DialogInput", Font.BOLD, 25));
		lblShowImage_1.setBounds(12, 123, 143, 32);
		Beacon2.add(lblShowImage_1);

		img_text_1 = new JTextArea();
		img_text_1.setFont(new Font("Dialog", Font.BOLD, 25));
		img_text_1.setWrapStyleWord(true);
		img_text_1.setLineWrap(true);
		img_text_1.setBackground(UIManager.getColor("Button.background"));
		img_text_1.setBounds(164, 123, 245, 32);
		Beacon2.add(img_text_1);

		JButton img_button_1 = new JButton("add new");
		img_button_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) { // here ref
				if (!img_text_1.getText().toString().isEmpty()) {

					B_one.imgupdate(db, 1, img_text_1.getText());

				}

			}
		});
		img_button_1.setBounds(421, 123, 117, 25);
		Beacon2.add(img_button_1);

		ListField_1 = new JTextArea();
		ListField_1.setFont(new Font("Dialog", Font.BOLD, 22));
		ListField_1.setBounds(164, 421, 245, 25);
		Beacon2.add(ListField_1);

		JButton btnDelete_1 = new JButton("delete");
		btnDelete_1.setBounds(292, 458, 117, 25);
		Beacon2.add(btnDelete_1);
		tabbedPane.setBackgroundAt(1, new Color(0, 0, 255));

		JPanel Beacon3 = new JPanel();
		Beacon3.setBackground(new Color(40, 40, 40));
		tabbedPane.addTab("New tab", null, Beacon3, null);
		Beacon3.setLayout(null);

		JLabel lblHeading_2 = new JLabel("Website");
		lblHeading_2.setForeground(Color.LIGHT_GRAY);
		lblHeading_2.setHorizontalAlignment(SwingConstants.CENTER);
		lblHeading_2.setFont(new Font("DialogInput", Font.BOLD, 25));
		lblHeading_2.setBounds(12, 186, 143, 32);
		Beacon3.add(lblHeading_2);

		JLabel lblContent_2 = new JLabel("Content");
		lblContent_2.setForeground(Color.LIGHT_GRAY);
		lblContent_2.setHorizontalAlignment(SwingConstants.CENTER);
		lblContent_2.setFont(new Font("DialogInput", Font.BOLD, 25));
		lblContent_2.setBounds(12, 310, 143, 44);
		Beacon3.add(lblContent_2);

		JTextArea content_area_2 = new JTextArea();
		content_area_2.setFont(new Font("Dialog", Font.BOLD, 22));
		content_area_2.setWrapStyleWord(true);
		content_area_2.setLineWrap(true);
		content_area_2.setBounds(164, 289, 245, 107);
		Beacon3.add(content_area_2);

		JTextArea link_2 = new JTextArea();
		link_2.setFont(new Font("Dialog", Font.BOLD, 22));
		link_2.setWrapStyleWord(true);
		link_2.setLineWrap(true);
		link_2.setBackground(UIManager.getColor("Button.background"));
		link_2.setBounds(164, 186, 245, 32);
		Beacon3.add(link_2);

		JLabel lblNewLabel_2 = new JLabel("Likes: ");
		lblNewLabel_2.setForeground(Color.LIGHT_GRAY);
		lblNewLabel_2.setFont(new Font("Dialog", Font.PLAIN, 22));
		lblNewLabel_2.setBounds(57, 47, 98, 32);
		Beacon3.add(lblNewLabel_2);

		JButton web_button_2 = new JButton("change");
		web_button_2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if (!link_2.getText().toString().isEmpty()) {

					B_one.urlupdate(db, 2, link_2.getText()); // for 2

				}
			}
		});
		web_button_2.setBounds(421, 186, 117, 25);
		Beacon3.add(web_button_2);

		JButton content_button_2 = new JButton("change");
		content_button_2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				if (!content_area_2.getText().toString().isEmpty()) {

					B_one.infoupdate(db, 2, content_area_2.getText()); // for 2

				}
			}
		});
		content_button_2.setBounds(421, 324, 117, 25);
		Beacon3.add(content_button_2);

		JLabel lblList_2 = new JLabel("Offers");
		lblList_2.setForeground(Color.LIGHT_GRAY);
		lblList_2.setHorizontalAlignment(SwingConstants.CENTER);
		lblList_2.setFont(new Font("DialogInput", Font.BOLD, 25));
		lblList_2.setBounds(12, 427, 143, 44);
		Beacon3.add(lblList_2);

		DefaultListModel<String> model2 = new DefaultListModel<String>();

		List<String> offers3 = new ArrayList<String>();
		// offers1.add("1") ;

		JList<String> offer_list_2 = new JList<String>();
		offer_list_2.setBounds(445, 403, 205, 120);
		Beacon3.add(offer_list_2);

		offer_list_2.setModel(model2);
		;
		JButton btn_add_2 = new JButton("add");
		btn_add_2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) { // commit

				if (!ListField_2.getText().toString().isEmpty()) {

					String offer = ListField_2.getText().toString();

					model2.addElement(offer);

					offers3.add(offer);

					ListField_2.setText(null);

					B_one.Offersupdate(db, 2, offers3);

				}
			}
		});
		btn_add_2.setBounds(164, 458, 117, 25);
		Beacon3.add(btn_add_2);

		JLabel lblHeading_3_2 = new JLabel("Heading");
		lblHeading_3_2.setForeground(Color.LIGHT_GRAY);
		lblHeading_3_2.setHorizontalAlignment(SwingConstants.CENTER);
		lblHeading_3_2.setFont(new Font("DialogInput", Font.BOLD, 25));
		lblHeading_3_2.setBounds(22, 230, 143, 32);
		Beacon3.add(lblHeading_3_2);

		JTextArea Heading_2 = new JTextArea();
		Heading_2.setFont(new Font("Dialog", Font.BOLD, 22));
		Heading_2.setWrapStyleWord(true);
		Heading_2.setLineWrap(true);
		Heading_2.setBounds(164, 243, 245, 32);
		Beacon3.add(Heading_2);

		JButton heading_button_2 = new JButton("change");
		heading_button_2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				if (!Heading_2.getText().toString().isEmpty()) {

					B_one.Headupdate(db, 2, Heading_2.getText());

				}
			}
		});
		heading_button_2.setBounds(421, 250, 117, 25);
		Beacon3.add(heading_button_2);

		JLabel like_counter_2 = new JLabel(Long.toString(foot.like3())); // herere
		like_counter_2.setForeground(Color.LIGHT_GRAY);
		like_counter_2.setFont(new Font("Dialog", Font.PLAIN, 22));
		like_counter_2.setBounds(164, 47, 98, 32);
		Beacon3.add(like_counter_2);

		JLabel lblShowImage_2 = new JLabel("Image");
		lblShowImage_2.setForeground(Color.LIGHT_GRAY);
		lblShowImage_2.setHorizontalAlignment(SwingConstants.CENTER);
		lblShowImage_2.setFont(new Font("DialogInput", Font.BOLD, 25));
		lblShowImage_2.setBounds(12, 123, 143, 32);
		Beacon3.add(lblShowImage_2);

		JTextArea img_text_2 = new JTextArea();
		img_text_2.setFont(new Font("Dialog", Font.BOLD, 22));
		img_text_2.setWrapStyleWord(true);
		img_text_2.setLineWrap(true);
		img_text_2.setBackground(UIManager.getColor("Button.background"));
		img_text_2.setBounds(164, 123, 245, 32);
		Beacon3.add(img_text_2);

		JButton img_button_2 = new JButton("add new");
		img_button_2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				if (!img_text_2.getText().toString().isEmpty()) {

					B_one.imgupdate(db, 2, img_text_2.getText());

				}
			}
		});
		img_button_2.setBounds(421, 123, 117, 25);
		Beacon3.add(img_button_2);

		ListField_2 = new JTextArea();
		ListField_2.setFont(new Font("Dialog", Font.BOLD, 22));
		ListField_2.setBounds(164, 421, 245, 25);
		Beacon3.add(ListField_2);

		JButton btnDelete_2 = new JButton("delete");
		btnDelete_2.setBounds(292, 458, 117, 25);
		Beacon3.add(btnDelete_2);
	}
}
