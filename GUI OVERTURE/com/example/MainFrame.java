package com.example;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
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
import javax.swing.border.BevelBorder;
import java.awt.Font;
import javax.swing.JSeparator;
import javax.swing.JLabel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

@SuppressWarnings("serial")
public class MainFrame extends JFrame {

	private JPanel contentPane;
	private final JPanel panel = new JPanel();
	private JTextField txtAdminName;
	private JPasswordField pwdPassword;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
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
		setBackground(new Color(26, 95, 180));
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
		panel_1.setBackground(new Color(61, 56, 70));
		panel_1.setBorder(null);
		panel_1.setBounds(368, -21, 520, 570);
		contentPane.add(panel_1);
		panel_1.setLayout(null);
		
		txtAdminName = new JTextField();
		txtAdminName.setToolTipText("name");
		txtAdminName.setFont(new Font("Dialog", Font.PLAIN, 18));
		txtAdminName.setBorder(new BevelBorder(BevelBorder.LOWERED, new Color(94, 92, 100), new Color(94, 92, 100), new Color(94, 92, 100), new Color(94, 92, 100)));
		txtAdminName.setBackground(new Color(61, 56, 70));
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
		pwdPassword.setBorder(new BevelBorder(BevelBorder.LOWERED, new Color(94, 92, 100), new Color(94, 92, 100), new Color(94, 92, 100), new Color(94, 92, 100)));
		pwdPassword.setBackground(new Color(61, 56, 70));
		pwdPassword.setBounds(96, 252, 362, 42);
		panel_1.add(pwdPassword);
		
		JSeparator separator = new JSeparator();
		separator.setMinimumSize(new Dimension(4, 10));
		separator.setSize(new Dimension(0, 6));
		separator.setPreferredSize(new Dimension(0, 7));
		separator.setForeground(new Color(0, 0, 0));
		separator.setBounds(70, 230, 414, 10);
		panel_1.add(separator);
		
		JLabel label_1 = new JLabel("");
		label_1.setIcon(new ImageIcon(MainFrame.class.getResource("/com/example/icons8-unlock-private-50.png")));
		label_1.setBounds(39, 252, 50, 51);
		panel_1.add(label_1);
		
		JLabel label = new JLabel("");
		label.setIcon(new ImageIcon(MainFrame.class.getResource("/com/example/icons8-account-48.png")));
		label.setBounds(39, 167, 56, 51);
		panel_1.add(label);
		
		JButton btnNewButton = new JButton("LOGIN");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				Table table = new Table() ; 
				
				table.setVisible(true);
				
				setVisible(false);				
			}
		});
		btnNewButton.setForeground(new Color(98, 160, 234));
		btnNewButton.setBackground(new Color(36, 31, 49));
		btnNewButton.setBounds(201, 420, 117, 25);
		panel_1.add(btnNewButton);
		panel.setBackground(Color.DARK_GRAY);
		panel.setBounds(0, -21, 377, 583);
		contentPane.add(panel);
	}
}
