package {

	import com.gorillalogic.monkeylink.MonkeyLinkTestLauncher

	import flash.display.DisplayObject;
	import mx.events.FlexEvent;
	import testSuites.exampleTestSuite.ExampleTestSuite;

	[Mixin]
	public class FlexMonkeyTestController {

		private static const snapshotDirectory:String = "snapshots";

		public static function init(root:DisplayObject):void {
			root.addEventListener(FlexEvent.APPLICATION_COMPLETE, function():void {
				var suiteArray : Array = new Array();
				suiteArray.push(new ExampleTestSuite());

				MonkeyLinkTestLauncher.monkeyLinkTestLauncher.startTestLauncher(suiteArray, snapshotDirectory);
			});
		}

	}
}
