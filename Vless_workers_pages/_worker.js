import { connect } from "cloudflare:sockets";

// How to generate your own UUID:
let userID = "e85dfd33-6788-4c04-be1e-20ba10708e52";

const proxyIPs = ["proxy.xxxxxxxx.tk"];
let CDNIP = 'www.visa.com.sg';
let IP1 = 'www.visa.com';
// ... (other IP and port definitions)

let proxyIP = proxyIPs[Math.floor(Math.random() * proxyIPs.length)];

if (!isValidUUID(userID)) {
  throw new Error("UUID is not valid");
}

export default {
  async fetch(request, env, ctx) {
    try {
      userID = env.uuid || userID;
      proxyIP = env.proxyip || proxyIP;
      CDNIP = env.cdnip || CDNIP;
      IP1 = env.ip1 || IP1;
      // ... (other environment variables)

      const upgradeHeader = request.headers.get("Upgrade");
      const url = new URL(request.url);

      if (!upgradeHeader || upgradeHeader !== "websocket") {
        switch (url.pathname) {
          case `/${userID}`:
            const vlessConfig = getVLESSConfig(userID, request.headers.get("Host"));
            return new Response(`${vlessConfig}`, { status: 200, headers: { "Content-Type": "text/html;charset=utf-8" } });
          // ... (other cases)
          default:
            return new Response('Not found', { status: 404 });
        }
      }

      // Handle WebSocket upgrade or other logic here...

    } catch (err) {
      return new Response(`Error: ${err.message}`, { status: 500 });
    }
  }
};

function isValidUUID(uuid) {
  const regex = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;
  return regex.test(uuid);
}
