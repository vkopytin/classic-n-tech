import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Weather;
import Toybox.Time;
import Toybox.Application;
import Toybox.Graphics;
using Toybox.Time.Gregorian as Date;

const WEEK_DAYS = ["", "SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
const MONTHS = {
    Date.MONTH_JANUARY => "JAN",
    Date.MONTH_FEBRUARY => "FEB",
    Date.MONTH_MARCH => "MAR",
    Date.MONTH_APRIL => "APR",
    Date.MONTH_MAY => "MAY",
    Date.MONTH_JUNE => "JUN",
    Date.MONTH_JULY => "JUL",
    Date.MONTH_AUGUST => "AUG",
    Date.MONTH_SEPTEMBER => "SEP",
    Date.MONTH_OCTOBER => "OCT",
    Date.MONTH_NOVEMBER => "NOV",
    Date.MONTH_DECEMBER => "DEC"
};

var Cities = [] as Array<[String, Number, Number, String]>;
var secondLocation = ["", 40.7128, -74.0060, "NYC"] as [String, Number, Number, String];
