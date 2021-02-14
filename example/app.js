const tabGroup = Ti.UI.createTabGroup({
	tabs: [
		Ti.UI.createTab({ window: Ti.UI.createWindow(), title: 'Tab 1', icon: dot() }),
		Ti.UI.createTab({ window: Ti.UI.createWindow(), title: 'Tab 2', icon: dot() }),
		Ti.UI.createTab({ window: Ti.UI.createWindow() }),
		Ti.UI.createTab({ window: Ti.UI.createWindow(), title: 'Tab 4', icon: dot() }),
		Ti.UI.createTab({ window: Ti.UI.createWindow(), title: 'Tab 5', icon: dot() })
	]
});

tabGroup.add(primaryButton());
tabGroup.open();

function isiPhoneX() {
	return (Ti.Platform.displayCaps.platformWidth === 375 && Ti.Platform.displayCaps.platformHeight === 812 || // iPhone X / XS / 11 / 12 Mini
		Ti.Platform.displayCaps.platformWidth === 414 && Ti.Platform.displayCaps.platformHeight === 896 // iPhone X / XS / 11
		|| Ti.Platform.displayCaps.platformWidth === 834 && Ti.Platform.displayCaps.platformHeight === 1194 // iPhone X Max / 11 Max
		|| Ti.Platform.displayCaps.platformWidth === 390 && Ti.Platform.displayCaps.platformHeight === 844 // iPhone 12
		|| Ti.Platform.displayCaps.platformWidth === 428 && Ti.Platform.displayCaps.platformHeight === 926) && ( // iPhone 12 Max
		Ti.Platform.displayCaps.logicalDensityFactor === 3 || Ti.Platform.displayCaps.logicalDensityFactor === 2); // Only for @2x and @3x devices
}

function dot() {
	return Ti.UI.createView({ backgroundColor: '#eee', width: 18, height: 18, borderRadius: 9 }).toImage();
}

function primaryButton() {
	const button = Ti.UI.createView({ height: 50, width: 50, borderRadius: 25, backgroundColor: 'red', bottom: isiPhoneX() ? 50 : 22 });
	
	button.add(Ti.UI.createView({ height: 20, width: 2, backgroundColor: 'white' }));
	button.add(Ti.UI.createView({ width: 20, height: 2, backgroundColor: 'white' }));

	return button;
}
