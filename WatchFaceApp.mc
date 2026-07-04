import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Complications;

class WatchFaceApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();

        $.Cities = Application.loadResource(Rez.JsonData.Cities) as Array<[String, Number, Number]>;
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
        self.onSettingsChanged();
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new WatchFaceView(), partialDelegateCreate() ];
    }

    function getSettingsView() as [ Views ] or [ Views, InputDelegates ] or Null {
        var view = new SettingsView();
        var delegate = new SettingsDelegate(view, self);
        return [view, delegate];
    }

    function onSettingsChanged() as Void {
        var secondTimezone = Application.Properties.getValue("SecondTimezone");
        if (secondTimezone != null) {
            var cityNumber = secondTimezone as Number;
            $.secondLocation = $.Cities[cityNumber];
        }
    }

}

function getApp() as WatchFaceApp {
    return Application.getApp() as WatchFaceApp;
}