/*
 * FlexMonkey 1.0, Copyright 2008, 2009, 2010 by Gorilla Logic, Inc.
 * FlexMonkey 1.0 is distributed under the GNU General Public License, v2. 
 */
package com.gorillalogic.flexmonkey.codeGen {
	
	public interface IMonkeyCommandCodeGenerator {
		
		function getAS3(cmd:Object, cmdImports:Array):String;
	
	}
	
}