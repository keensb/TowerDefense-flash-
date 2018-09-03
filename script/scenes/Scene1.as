package script.scenes
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import script.role.enemy.Kulou;
	
	/**
	 * ...
	 * @author YeXin
	 */
	public class Scene1 extends Sprite
	{
		public var path1_sp:Sprite;
		public var path2_sp:Sprite;
		public var path3_sp:Sprite;
		private var points_1:Vector.<Point> = new Vector.<Point>();
		private var points_2:Vector.<Point> = new Vector.<Point>();
		private var points_3:Vector.<Point> = new Vector.<Point>();
		
		private var roleContainer:Sprite = new Sprite();
		
		public function Scene1()
		{
			super();
			
			addChild(roleContainer);
			
			createPath();
			
			this.addEventListener(Event.ENTER_FRAME, depthHandler)
		}
		
		private function createPath():void
		{
			for (var i:int = 0; i < path1_sp.numChildren; i++)
			{
				var sp1:DisplayObject = path1_sp.getChildAt(i);
				var point1:Point = new Point(sp1.x, sp1.y);
				points_1.push(point1);
			}
			
			for (var j:int = 0; j < path2_sp.numChildren; j++)
			{
				var sp2:DisplayObject = path2_sp.getChildAt(j);
				var point2:Point = new Point(sp2.x, sp2.y);
				points_2.push(point2);
			}
			
			for (var k:int = 0; k < path3_sp.numChildren; k++)
			{
				var sp3:DisplayObject = path3_sp.getChildAt(k);
				var point3:Point = new Point(sp3.x, sp3.y);
				points_3.push(point3);
			}
			
			var kl:Kulou = new Kulou();
			roleContainer.addChild(kl);
			kl.scaleX = kl.scaleY = 0.5;
			kl.fllowPath(points_1);
			
			/*kl = new Kulou();
			roleContainer.addChild(kl);
			kl.scaleX = kl.scaleY = 0.5;
			kl.fllowPath(points_2);
			
			kl = new Kulou();
			roleContainer.addChild(kl);
			kl.scaleX = kl.scaleY = 0.5;
			kl.fllowPath(points_3);*/
		}
		
		private function depthHandler(event:Event):void
		{
			var children:Vector.<DisplayObject> = new Vector.<DisplayObject>();
			for (var i:int = 0; i < roleContainer.numChildren; i++)
			{
				children.push(roleContainer.getChildAt(i));
			}
			
			children.sort(function(a:DisplayObject,b:DisplayObject):Number
			{
				return a.y > b.y ? 1 : -1;
			})
			
			for (var j:int = 0; j < children.length; j++)
			{
				roleContainer.addChild(children[j]);
			}
			
		}
	
	}

}