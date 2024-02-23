async function findOptimalCode() {
  let maxScore = 0;
  let code = Array.from("0000000");
  const alnum =
      "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

  for (let i = 0; i < code.length; i++) {
    for (const c of alnum) {
      code[i] = c;
      const score = await CodeBreaker_submit(code.join(""));
      if (score > maxScore) {
        maxScore = score;
        break;
      }
    }
  }

  console.log(`The optimal code is ${code.join("")}`);
}
