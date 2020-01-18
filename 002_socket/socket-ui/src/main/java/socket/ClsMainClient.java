package socket;

public class ClsMainClient {

	public static String tcpSendMain(String text) {
		final String[] tcpResult = {""};
		final String[] tcpMessage = {""};
		TcpClient tcpClient = new TcpClient() {

			@Override
			public void onReceive(SocketTransceiver st, String s) {
				String messageReceive = "Client1 Receive: " + s;
				tcpResult[0] = s;
				tcpMessage[0] += messageReceive;
				System.out.println(messageReceive);
			}

			@Override
			public void onDisconnect(SocketTransceiver st) {
				String messageReceive = "Client1 Disconnect";
				tcpMessage[0] += messageReceive;
				System.out.println(messageReceive);
			}

			@Override
			public void onConnect(SocketTransceiver transceiver) {
				String messageReceive = "Client1 Connect";
				tcpMessage[0] += messageReceive;
				System.out.println(messageReceive);
			}

			@Override
			public void onConnectFailed() {
				String messageReceive = "Client1 Connect Failed";
				tcpMessage[0] += messageReceive;
				System.out.println(messageReceive);
			}
		};

		tcpClient.connect("71.125.11.35", 9095);
		delay();
		int num=0;
		while ("".equals(tcpResult[0]) && num<10) {
			if (tcpClient.isConnected()) {
				tcpClient.getTransceiver().send(text);
			} else {
				break;
			}
			num++;
			delay();
		}
		tcpClient.disconnect();
		return "".equals(tcpResult[0])?tcpMessage[0]:tcpResult[0];
	}

	private static void delay() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}
