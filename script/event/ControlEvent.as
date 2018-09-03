package script.event
{
	import flash.events.Event;
	
	/**
	 * 控制事件类，主要用于控制全局角色的动作和游戏进程(如暂停游戏和继续游戏)
	 * @author YeXin
	 */
	public class ControlEvent extends Event 
	{
		public static const GAME_PAUSE:String = "gamePause";
		public static const GAME_RESUME:String = "gameResume";
		
		public var userData:*;
		public function ControlEvent(type:String, userData:*=null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			this.userData = userData;
		} 
		
		public override function clone():Event 
		{ 
			return new ControlEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ControlEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}