setup ; Set the configuration of EWD environment.
 set ^zewd("config","RootURL","gtm")="/ewd/"
 set ^zewd("config","applicationRootPath")="/INF362-EWD/Apps/"
 set ^zewd("config","backEndTechnology")="m"
 set ^zewd("config","defaultFormat")="pretty"
 set ^zewd("config","defaultTechnology")="gtm"
 set ^zewd("config","frontEndTechnology")="gtm"
 set ^zewd("config","jsScriptPath","gtm","mode")="fixed"
 set ^zewd("config","jsScriptPath","gtm","outputPath")="/INF362-EWD/resources"
 set ^zewd("config","jsScriptPath","gtm","path")="/resources/"
 set ^zewd("config","routinePath","gtm")="/INF362-EWD/gtm/r/"
 set ^zewd("config","sessionDatabase")="gtm"
 ; 
 zwrite ^zewd("config",*)

