var at = function (hour, minute) {
  var hourStr = '';
  var minStr = '';
  var clock = {};

  if (!minute) {
    var minute = 0;
  }
  var time = { 'minute': minute, 'hour': hour };
  time = makeTime(time);

  clock.toString = function () {
    var result = convertTimeUnitToStr(time.hour) + ":" + convertTimeUnitToStr(time.minute);
    return result;
  }

  clock.plus = function (moreMinutes) {
    time.minute += moreMinutes;
    time = makeTime(time);
    return clock;
  }

  clock.minus = function (lessMinutes) {
    time.minute -= lessMinutes;
    time = makeTime(time);
    return clock;
  }

  clock.equals = function (secondClock) {
    return +clock === +secondClock;
  }

  clock.valueOf = function () {
    //Not a very good way to do things…
    var result = time.minute.toString() + time.hour.toString();
    // console.log(result);
    return result;
  }

  return clock;
}

function makeTime(time) {
  time = rollMinute(time);
  time = rollHour(time);
  return time;

}

function rollHour(time) {
  var hour = time.hour;
  var minute = time.minute;
  if (hour < 0) {
    if (hour <= -24) {
      hour = hour % 24;
    }
    hour = 24 + hour;
  }
  if (hour >= 24) {
    hour = hour % 24;
  }
  return {'hour': hour, 'minute': minute};
}

function rollMinute(time) {
  var result,
      hour,
      minute;
  hour = time.hour;
  minute = time.minute;

  if (minute < 0) {
    if (minute <= -60) {
      hour += Math.floor(minute / 60);
      minute = 60 - (-minute % 60);
    } else {
      hour += Math.floor(minute / 60);
      minute += 60;
    }
  }
  if (minute >= 60) {
    if (minute % 60 === 0) {
      hour += minute / 60;
      minute = 0;
    } else {
      hour += Math.floor(minute / 60);
      minute = minute % 60;
    }
  }
  result = { 'hour': hour, 'minute': minute };
  return result;
}

function convertTimeUnitToStr(timeUnit) {
  var str = timeUnit.toString();
  if (str.length < 2) {
    str = '0' + str;
  }
  return str;
}

exports.at = at;