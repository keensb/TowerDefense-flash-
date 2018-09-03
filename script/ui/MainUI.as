package script.ui 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import script.ui.subMenu.RoleMenu;
	
	/**
	 * ...
	 * @author YeXin
	 */
	public class MainUI extends MovieClip 
	{
		public var roleMenu:RoleMenu;
		public function MainUI() 
		{
			super();
			this.roleMenu.visible = false;
		}
		
		//显示角色菜单
		public function showRoleMenu():void 
		{
			this.roleMenu.visible = true;
		}
		
		//显示战争菜单
		public function showBattleMenu():void 
		{
			this.roleMenu.visible = false;
		}
		
	}

}