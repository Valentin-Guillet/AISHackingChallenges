
async function tryDay(year, month, day) {
  const url = "https://hack.ainfosec.com/challenge/submit-answer/";
  const csrfToken = "TOFILL";

  const monthStr = String(month).padStart(2, '0');
  const dayStr = String(day).padStart(2, '0');
  const body = `csrfmiddlewaretoken=${csrfToken}&challenge_id=birthday&answer=${monthStr}%2F${dayStr}%2F${year}`;

  const args = {
    method : "POST",
    headers : {
      "Accept" : "application/json, text/javascript, */*; q=0.01",
      "Accept-Language" : "fr-FR,fr;q=0.5",
      "Content-Type" : "application/x-www-form-urlencoded; charset=UTF-8",
    },
    body : body,
  };

  try {
    const res = await fetch(url, args);

    const ans = await res.json();
    if (ans.error !== "It's not my birthday") {
      console.log(`Found valid date: ${month}/${day}/${year}`, ans);
      return true;
    }
  } catch (error) {
    console.log(`Error for date: ${month}/${day}/${year}`, error);
  }
  return false;
}

async function tryMonth(year, month) {
  let ans = false;
  const promises1 = [];
  for (let day = 1; day <= 15; day++) {
    promises1.push(tryDay(year, month, day));
  }
  ans ||= await Promise.any(promises1);

  const promises2 = [];
  for (let day = 16; day <= 31; day++) {
    promises2.push(tryDay(year, month, day));
  }
  ans ||= await Promise.any(promises2);

  return ans;
}

async function tryAllDates(start, stop) {
  let foundDate = false;
  for (let year = start; !foundDate && year < stop; year++) {
    for (let month = 1; !foundDate && month <= 12; month++) {
      foundDate = await tryMonth(year, month);
    }
  }
  return foundDate;
}

tryAllDates(1980, 2024);
