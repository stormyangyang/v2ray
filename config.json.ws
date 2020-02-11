{
  "log": {
    "loglevel": "debug",
    "access": "log/access.log",
    "error": "log/error.log"
  },
  "inbounds": [
    {
      "tag": "input-shadowsocks",
      "protocol": "shadowsocks",
      "port": 1024,
      "settings": {
        "method": "aes-128-gcm",
        "password": "password"
      }
    }
  ],
  "outbounds": [
    {
      "tag": "output-vmess",
      "protocol": "vmess",
      "settings": {
        "vnext": [
          {
            "address": "sg-.yogurtcloud.com",
            "port": 443,
            "users": [
              {
                "id": "41d7983765e9b",
                "alterId": 64
              }
            ]
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
	"wsSettings":{
	 "path":"/ws",
	 "host":"sg-b1.yogurtcloud.com"
	}
      }
    }
  ],
  "routing": {
    "strategy": "rules",
    "settings": {
      "rules": [
        {
          "type": "field",
          "inboundTag": [
            "input-shadowsocks"
          ],
          "outboundTag": "output-vmess"
        }
      ]
    }
  }
}
