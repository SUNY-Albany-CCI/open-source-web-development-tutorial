var ewd = require('ewdgateway2');

var myUseName = process.argv[2];
var myPort    = process.argv[3];

var EWDTreeDirectory='/INF362-EWD'

var outputFilePathName = EWDTreeDirectory+"/nodejs/"+myUseName;
var logFileName = EWDTreeDirectory+"/nodejs/"+myUseName+"/ewdLog.txt";

var params = {
  poolSize: 4,
  httpPort: myPort,
  ewdPath: '/ewd/',
  webSockets: {
    enabled: true
  },
  database: {
    type: 'gtm',
    nodePath:"nodem",
    outputFilePath: outputFilePathName,
  },
  traceLevel: 8,
  silentStart: false,
  webServerRootPath: EWDTreeDirectory+'/www',
  logTo: 'file',
  logFile: logFileName,
  logHTTP: true,
  monitorInterval: 30000,
  management: {
    password: 'keepThisSecret!'
  }
};


ewd.start(params, function(gateway) {
    console.log("version = " + gateway.version());
  });
