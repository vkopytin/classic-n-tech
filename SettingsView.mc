import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class SettingsView extends WatchUi.Menu2 {
    public function initialize() {
        Menu2.initialize({:title=>Rez.Strings.Settings});
        buildMenu();
    }

    public function buildMenu() as Void {
        var secondTimezone = Application.Properties.getValue("SecondTimezone");
        var secondTimezoneItem = new WatchUi.MenuItem(
            Rez.Strings.secondTimezoneTitle as String,
            $.Cities[secondTimezone as Number][0] as String,
            secondTimezone,
            {}
        );
        Menu2.addItem(secondTimezoneItem);
    }
}

class SettingsDelegate extends WatchUi.Menu2InputDelegate {
    private var menu as SettingsView;
    private var app as WatchFaceApp;

    public function initialize(menu as SettingsView, app as WatchFaceApp) {
        Menu2InputDelegate.initialize();
        self.menu = menu;
        self.app = app;
    }

    public function onSelect(menuItem as MenuItem) as Void {
        var secondTimezone = Application.Properties.getValue("SecondTimezone");
        var selectedIndex = secondTimezone as Number;
        selectedIndex++;
        selectedIndex = selectedIndex >= $.Cities.size() ? 0 : selectedIndex;
        Application.Properties.setValue("SecondTimezone", selectedIndex);
        menuItem.setSubLabel($.Cities[selectedIndex][0] as String);
        self.app.onSettingsChanged();
    }
}
