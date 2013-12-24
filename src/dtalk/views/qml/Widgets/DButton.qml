import QtQuick 2.1

Item {
	id: container
	
	property alias source: image.source
	signal clicked
	
	width: image.width; height: image.height
	
	Image {
		id: image
		smooth: true
	}
	
	states: [
		State { 
			name: "hovered"
			PropertyChanges { target: container; opacity: 0.6 }
		}
		
	]
	
	transitions: Transition {
		NumberAnimation { properties: "opacity"; duration: 350 }
	}
	
	MouseArea {
		id: mouseArea
		anchors.fill: parent
		hoverEnabled: true
		onEntered: container.state = "hovered"
		onExited: container.state = ""
		onReleased: { container.state = mouseArea.containsMouse ? "hovered" : ""}
		onClicked: container.clicked()
	}
	
}