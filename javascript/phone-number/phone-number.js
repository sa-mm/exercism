var PhoneNumber = function(str) {
    this.str = str;
};

PhoneNumber.prototype.number = function() {
    var str = this.str;
    const re = /[^0-9]+/g;
    str = str.replace(re, '');
    if (str.length == 11) {
        if (str.startsWith('1')) {
            return str.substring(1);
        } else {
            return '0000000000';
        }
    } else if (str.length < 10) {
        return '0000000000';
    } else {
        return str;
    }
};

PhoneNumber.prototype.areaCode = function () {
    return this.number().substring(0,3);
}

PhoneNumber.prototype.toString = function() {
    var strArr = this.number().split('');
    strArr = strArr.reduce( (acc,item,index) => {
        switch (index) {
            case 0:
                return acc.concat('(' + item);
                break;
            case 3:
                return acc.concat(') ' + item);
                break;
            case 6:
                return acc.concat('-' + item);
                break;
            default:
                return acc.concat(item); 
        }
    },[]);
    return strArr.join('');
};

module.exports = PhoneNumber;
