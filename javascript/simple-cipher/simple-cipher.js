var Cipher = function(key) {
  keyGaurd(key);

  this.alphabet = "abcdefghijklmnopqrstuvwxyz";

  if (key) {
    this.key = key;
  } else {
    this.key = createKey(this.alphabet);
  }

  function createKey(alphabet) {
    const randomNum = () => {
      min = Math.ceil(1);
      max = Math.floor(26);
      return Math.floor(Math.random() * (max - min)) + min;
    };

    const arr = Array.from(Array(100), randomNum);
    return arr.map(n => alphabet.charAt(n)).join("");
  }

  function keyGaurd(key) {
    if (typeof key === "undefined") return;

    const hasUpper = str => {
      return str.split("").some(char => {
        return char.toUpperCase() === char;
      });
    };

    const hasNum = str => {
      return str.split("").some(char => {
        const re = /[0-9]/;
        return re.test(char);
      });
    };

    const hasEmptyKey = str => str === "";

    if (hasUpper(key) || hasNum(key) || hasEmptyKey(key)) {
      throw new Error("Bad key");
    }
  }
};

Cipher.prototype.encode = function(message) {
  const encodedMessage = message
    .split("")
    .map((e, i) => {
      const keyChar = this.key.charAt(i);
      const offset = this.alphabet.indexOf(e) + this.alphabet.indexOf(keyChar);
      let diff;
      if (offset >= 26) {
        diff = offset - 26;
      } else {
        diff = offset;
      }
      return this.alphabet.charAt(diff);
    })
    .join("");
  return encodedMessage;
};

Cipher.prototype.decode = function(encodedMessage) {
  const decodedMessage = encodedMessage
    .split("")
    .map((e, i) => {
      const keyChar = this.key.charAt(i);
      const offset = this.alphabet.indexOf(e) - this.alphabet.indexOf(keyChar);
      let diff;
      if (offset < 0) {
        diff = 26 + offset;
      } else {
        diff = offset;
      }
      return this.alphabet.charAt(diff);
    })
    .join("");

  return decodedMessage;
};
module.exports = Cipher;
