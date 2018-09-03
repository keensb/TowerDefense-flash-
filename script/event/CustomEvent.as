package script.event
{
	import flash.events.Event;
	
	/**
	 * 自定义事件类，主要用于传递全局数据
	 * @author YeXin
	 */
	public class CustomEvent extends Event 
	{
		public static const GROUND_SELECTED:String = "groundSelected";
		public var userData:*;
		public function CustomEvent(type:String, userData:*=null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			this.userData = userData;
		} 
		
		public override function clone():Event 
		{ 
			return new CustomEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("CustomEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}