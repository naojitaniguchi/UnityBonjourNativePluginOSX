UnityBonjourNativePluginOSX
===========================

Unity Native plugin to publish service via Bonjour on OSX

To Use plugin in Unity
Put BonjourPlugin.bundle to Assets/Plugins on Unity .

Sample Unity C# script, add this script to some Game Object in Unity

```
using UnityEngine;
using System.Collections;
using System;
using System.Runtime.InteropServices;

public class BonjourPlugin : MonoBehaviour {
	[DllImport ("BonjourPlugin")]
	private static extern void startService(int port);	

	[DllImport ("BonjourPlugin")]
	private static extern void stopService();	

	// Use this for initialization
	void Start () {
		startService( 12345 );
	}
	
	// Update is called once per frame
	void Update () {
	}
}
```
