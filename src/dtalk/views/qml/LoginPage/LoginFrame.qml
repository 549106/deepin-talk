import QtQuick 2.1
import QtQuick.Layouts 1.0
import "../Widgets"

Item {
    id: container
    property alias isLogging: loginButton.isLogging
	
	Column {
			anchors.fill: parent
			anchors.topMargin: 90
			spacing: 50
		
			FaceFrame {
				width: parent.width
			}
		
			Column {
				spacing: 10
				width: parent.width; height: 110

				LoginInput {
                    id: jid
					anchors.horizontalCenter: parent.horizontalCenter
					leftImage: "../images/person.png"
					rightImage: "../images/arrow.png"
                    text: "houshao55@gmail.com"
				}
				
				LoginInput {
                    id: passwd
					anchors.horizontalCenter: parent.horizontalCenter
					leftImage: "../images/passwd.png"
					rightImage: "../images/keyboard.png"
					echoMode: TextInput.Password
				}
				
				Row {
					anchors.horizontalCenter: parent.horizontalCenter
					spacing: 35
					LoginStatus { height: 30 }
					CheckBox { text: "记住密码" }
					CheckBox { text: "自动登录" }
				}
		
			}
		
			LoginButton {
                id: loginButton
				width: parent.width
                onClicked: {
                    if (jid.text != "" & passwd.text != ""){
                        serverManager.login(jid.text, passwd.text)
                        isLogging = true
                    }
                }
			}
	}
}