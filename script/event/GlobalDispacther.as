package script.event
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	/**
	 * ...
	 * @author YeXin
	 */
	public class GlobalDispacther
	{
		private static var dispacther:EventDispatcher = new EventDispatcher();
		
		public function GlobalDispacther()
		{
			throw new Error("不需要实例化");
		}
		
		public static function dispatchEvent(event:Event):Boolean
		{
			return GlobalDispacther.dispacther.dispatchEvent(event);
		}
		
		public static function dispatchCustomEvent(type:String, userData:* = null):Boolean
		{
			var customEvent:CustomEvent = new CustomEvent(type, userData);
			return GlobalDispacther.dispacther.dispatchEvent(customEvent);
		}
		
		public static function dispatchControlEvent(type:String, userData:* = null):Boolean
		{
			var controlEvent:ControlEvent = new ControlEvent(type, userData);
			return GlobalDispacther.dispacther.dispatchEvent(controlEvent);
		}
		
		public static function hasEventListener(type:String):Boolean
		{
			return GlobalDispacther.dispacther.hasEventListener(type)
		}
		
		public static function willTrigger(type:String) : Boolean
		{
			 return GlobalDispacther.dispacther.willTrigger(type);
		}
		
		public static function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false) : void
		{
			 GlobalDispacther.dispacther.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public static function removeEventListener(type:String, listener:Function, useCapture:Boolean=false) : void
		{
			 GlobalDispacther.dispacther.removeEventListener(type, listener, useCapture);
		}
	
	}
}

