function Gigasecond (date) {
    this.startDate = date;
    
    
    this.date = function () {
        var startTime = this.startDate.getTime();
        var endDate = new Date(startTime + 1000000000000);
        return endDate;
    }

}

// var Gigasecond = function (date) {
//     this.startDate = date;
// }
// 
// Gigasecond.prototype.date = function() {
//     var startTime = this.startDate.getTime();
//     var endDate = new Date(startTime + 1000000000000);
//     return endDate;
// }
module.exports = Gigasecond;
