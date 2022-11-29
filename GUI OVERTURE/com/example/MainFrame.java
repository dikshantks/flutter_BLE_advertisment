package com.example;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.border.LineBorder;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

import java.awt.Color;
//import java.awt.FlowLayout;
//import javax.swing.BoxLayout;
//import com.jgoodies.forms.layout.FormLayout;
//import com.jgoodies.forms.layout.ColumnSpec;
//import com.jgoodies.forms.layout.RowSpec;
//import javax.swing.JTextArea;
import java.awt.Dimension;
import javax.swing.JTextField;
import javax.swing.JPasswordField;
// import javax.swing.border.BevelBorder;
import java.awt.Font;
import javax.swing.JSeparator;
import javax.swing.JLabel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.awt.event.ActionEvent;

@SuppressWarnings("serial")
public class MainFrame extends JFrame {

	private JPanel contentPane;
	private final JPanel Left_panel;
	private JTextField txtAdminName;
	private JPasswordField pwdPassword;

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
					MainFrame frame = new MainFrame();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public MainFrame() {

		Constant one = new Constant();

		setBackground(one.main);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 888, 583);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(36, 31, 49));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		setContentPane(contentPane);
		contentPane.setLayout(null);

		JPanel panel_1 = new JPanel();
		panel_1.setPreferredSize(new Dimension(0, 0));
		panel_1.setMinimumSize(new Dimension(0, 1));
		panel_1.setAlignmentY(0.0f);
		panel_1.setAlignmentX(0.0f);
		panel_1.setBackground(one.right);
		panel_1.setBorder(null);
		panel_1.setBounds(368, -21, 520, 570);
		contentPane.add(panel_1);
		panel_1.setLayout(null);

		txtAdminName = new JTextField();
		txtAdminName.setToolTipText("name");
		txtAdminName.setFont(new Font("Dialog", Font.PLAIN, 18));
		LineBorder lineBorder = new LineBorder(Color.white, 8, true);
		txtAdminName.setBorder(lineBorder);
		txtAdminName.setBackground(one.hover);
		txtAdminName.setSelectionColor(Color.ORANGE);
		txtAdminName.setForeground(new Color(153, 193, 241));
		txtAdminName.setCaretColor(Color.MAGENTA);
		txtAdminName.setAlignmentY(0.0f);
		txtAdminName.setAlignmentX(0.0f);
		txtAdminName.setBounds(96, 166, 362, 42);
		panel_1.add(txtAdminName);
		txtAdminName.setColumns(10);

		pwdPassword = new JPasswordField();
		pwdPassword.setForeground(new Color(153, 193, 241));
		pwdPassword.setText("Password");
		pwdPassword.setBorder(new EmptyBorder(0, 0, 0, 0));
		pwdPassword.setBackground(one.box);
		pwdPassword.setBounds(96, 252, 362, 42);
		panel_1.add(pwdPassword);

		JSeparator separator = new JSeparator();
		separator.setMinimumSize(new Dimension(4, 10));
		separator.setSize(new Dimension(0, 6));
		separator.setPreferredSize(new Dimension(0, 7));
		separator.setForeground(new Color(0, 0, 0));
		separator.setBounds(70, 230, 414, 10);
		panel_1.add(separator);

		JLabel label_1 = new JLabel();
		label_1.setIcon(new ImageIcon(MainFrame.class.getResource("/com/example/icons8-unlock-private-50.png")));
		label_1.setBounds(39, 252, 50, 51);
		panel_1.add(label_1);

		JLabel label = new JLabel();
		label.setIcon(new ImageIcon(MainFrame.class.getResource("/com/example/icons8-account-48.png")));
		label.setBounds(39, 167, 56, 51);
		panel_1.add(label);

		JButton btnNewButton = new JButton("LOGIN");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				TabbedUI ui = new TabbedUI();

				if ( txtAdminName.getText().toString() == "admin")

				{

					ui.setVisible(true);

					setVisible(false);
					
					System.out.print("heeleo") ; 

				}

			}
		});
		btnNewButton.setForeground(new Color(98, 160, 234));
		btnNewButton.setBackground(one.right);
		btnNewButton.setBounds(144, 420, 314, 25);
		panel_1.add(btnNewButton);
		Left_panel = new JPanel();
		Left_panel.setBackground(one.left);
		Left_panel.setBounds(0, -21, 377, 583);
		contentPane.add(Left_panel);
	}
}
