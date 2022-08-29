
const https = require('https');

exports.handler = (event, context, callback) => {
  const payload = JSON.stringify({
    text: `New user has visited site Fistpractice.online !`,
  });
  
  const options = {
    hostname: "hooks.slack.com",
    method: "POST",
    path: "https://hooks.slack.com/services/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",
  };
  
  const req = https.request(options,
      (res) => res.on("data", () => callback(null, "OK")))
  req.on("error", (error) => callback(JSON.stringify(error)));
  req.write(payload);
  req.end();
}