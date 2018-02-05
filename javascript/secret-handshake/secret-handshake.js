const SecretHandshake = function(decimal) {
  if (typeof decimal !== "number") {
    throw new Error("Handshake must be a number");
  }

  const handshakes = ["wink", "double blink", "close your eyes", "jump"];

  const numToHandshakeReducer = (acc, binary, i) => {
    if (!handshakes[i]) {
      return acc.reverse();
    } else if (binary === "1") {
      return [...acc, handshakes[i]];
    }
    return acc;
  };

  const commands = () => {
    return decimal
      .toString(2)
      .split("")
      .reverse()
      .reduce(numToHandshakeReducer, []);
  };

  return {
    commands
  };
};

module.exports = SecretHandshake;
