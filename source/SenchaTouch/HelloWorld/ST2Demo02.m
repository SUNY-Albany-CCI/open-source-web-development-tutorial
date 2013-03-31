getHello(sessid) ;
 do setSessionValue^%zewdAPI("hello","Hello World! This is the OSEHRA VM",sessid)
 quit ""

initAccess(sessid) ;
 do enableGetPage^%zewdAPI("hwFragment05",sessid)
 quit ""

