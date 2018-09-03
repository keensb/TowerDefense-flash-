package script.path
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	/**
	 * 基础路径类
	 * @author YeXin
	 */
	public class BasePath extends Sprite
	{
		public function BasePath() 
		{
			for (var i = 0; i < this.numChildren; i++)
			{
				var child:DisplayObject = this.getChildAt(i);
				child.x = Math.round(child.x);
				child.y = Math.round(child.y);
			}
		}
		
	}

}