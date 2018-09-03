package script
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import script.event.*;
	import script.ui.MainUI;
	
	/**
	 * ...
	 * @author YeXin
	 */
	public class MainStage extends Sprite
	{
		private var isPause:Boolean = false;
		
		public var mainUI:MainUI;
		public var mask_mc:MovieClip;
		public function MainStage()
		{
			GlobalDispacther.addEventListener(CustomEvent.GROUND_SELECTED, onGroundSelected);
			mask_mc.visible = false;
			
			mask_mc.addEventListener(MouseEvent.CLICK, maskClickHandler);
		}
		
		private function maskClickHandler(event:MouseEvent):void
		{
			isPause = false;
			GlobalDispacther.dispatchControlEvent(ControlEvent.GAME_RESUME);
			this.mainUI.showBattleMenu();
			mask_mc.visible = false;
		
		}
		
		private function onGroundSelected(event:CustomEvent):void
		{
			if (!isPause)
			{
				isPause = true;
				GlobalDispacther.dispatchControlEvent(ControlEvent.GAME_PAUSE);
				this.mainUI.showRoleMenu();
				mask_mc.visible = true;
			}
			else
			{
				isPause = false;
				GlobalDispacther.dispatchControlEvent(ControlEvent.GAME_RESUME);
				this.mainUI.showBattleMenu();
				mask_mc.visible = false;
			}
		
		}
	
	}

}