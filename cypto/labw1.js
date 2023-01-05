const n = 10
let X = '1111101010101010101'.split('').map(e => +e)
let Y = '1100110011001100110011'.split('').map(e => +e)
let Z = '11100001111000011110000'.split('').map(e => +e)

const lfsr = () => {
  const majority = X[8] + Y[10] + Z[10] >= 2 ? 1 : 0;
  const x = X[13] ^ X[16] ^ X[17] ^ X[18]
  const y = Y[20] ^ Y[21]
  const z = Z[20] ^ Z[21] ^ Z[22]
  if (X[8] === majority) {
    X.pop()
    X.unshift(x)
  } else {
    X[0] = x
  }
  if (Y[10] === majority) {
    Y.pop()
    Y.unshift(y)
  } else {
    Y[0] = y
  }
  if (Z[10] === majority) {
    Z.pop()
    Z.unshift(z)
  } else {
    Z[0] = z
  }
}

(function main() {
  for (let i = 0; i < n; i++) {
    lfsr()
  }
  console.log(X, Y, Z, '-------------------------------')
})()
