/*
	This is a simple plugin, a bunch of functions that do simple things.
*/

#include "BonjourPlugin.pch"
#include "BonjourServer.h"


const char* PrintHello(){
	return "Hello";
}

int PrintANumber(){
	return 5;
}

int AddTwoIntegers(int a, int b) {
	return a + b;
}

float AddTwoFloats(float a, float b) {
	return a + b;
}

float AddTwoFloats2(float a, float b) {
	return a + b;
}

int vTest(int port) {
    return port ;
}

void startService(int port){
    BonjourServer* bonjourServer = [BonjourServer sharedManager];
    
    [bonjourServer startService:@"_osc._udp." name:@"osc" port:port domain:@"local"];
}

/*
void startService(char *type, char *name, int port, char *domain){
    BonjourServer* bonjourServer = [BonjourServer sharedManager];
    
    // サーバーからサービスをスタート
    NSString *typeString = [NSString stringWithCString: type encoding:NSUTF8StringEncoding];
    NSString *nameString = [NSString stringWithCString: name encoding:NSUTF8StringEncoding];
    NSString *domainString = [NSString stringWithCString: domain encoding:NSUTF8StringEncoding];
    
    [bonjourServer startService:typeString name:nameString port:port domain:domainString];
}
*/

void stopService(){
    BonjourServer* bonjourServer = [BonjourServer sharedManager];
    [bonjourServer stopService];
}



