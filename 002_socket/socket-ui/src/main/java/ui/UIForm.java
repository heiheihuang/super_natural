package ui;

import socket.ClsMainClient;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

class UIForm extends JFrame {

    UIForm() {
        JButton jWaitNumberButton = new JButton("WaitNumber");
        JTextArea jWaitNumberTextArea = new JTextArea();
        jWaitNumberButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String th = "";
                String textA = "<WaitNumber version=\"1\" />ö";
                String textB = "<WxTicket version=\"1\"><Datas WinTypeID =\"99\" CardNumber=\""+th+"\"/></WxTicket>ö";
                String receiveStr = ClsMainClient.tcpSendMain(textA);
                jWaitNumberTextArea.setText("Return data: " + receiveStr);
            }
        });

        this.setLayout(new GridLayout(2, 1, 10, 10));
        this.add(jWaitNumberButton);
        this.add(jWaitNumberTextArea);
        this.setSize(300, 400);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setLocation(200, 200);
        this.setVisible(true);
    }
}
