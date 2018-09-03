package script.tower
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import script.event.*;
	import script.cache.GlobalData;

	
	/**
	 * ...
	 * @author YeXin
	 */
	public class BuildingGround extends MovieClip
	{
		public var buildingType:uint = 0;
		public var buildingLevel:uint = 0;
		
		private var isPause:Boolean = false;
		
		public function BuildingGround()
		{
			this.buttonMode = true;
			
			this.addEventListener(MouseEvent.CLICK, boughtHandler);
			GlobalDispacther.addEventListener(ControlEvent.GAME_PAUSE, pauseHandler);
			GlobalDispacther.addEventListener(ControlEvent.GAME_RESUME, resumeHandler);
		}
		
		public function pauseHandler(event:ControlEvent):void
		{
			stop();
			isPause = true;
			sale_mc.stop();
		}
		
		private function resumeHandler(event:ControlEvent):void
		{
			isPause = false;
			if (sale_mc.currentFrame > 1 && sale_mc.currentFrame != sale_mc.totalFrames)
			{
				sale_mc.play();
			}
		}
		
		private function boughtHandler(e:MouseEvent):void
		{
			sale_mc.gotoAndPlay(2);
			this.removeEventListener(MouseEvent.CLICK, boughtHandler);
			this.addEventListener(MouseEvent.CLICK, buildHandler);
		}
		
		private function buildHandler(evt:MouseEvent):void
		{
			GlobalData.currentSelectedGround = this;
			GlobalDispacther.dispatchCustomEvent(CustomEvent.GROUND_SELECTED, evt.currentTarget);
		}
	
	}

}