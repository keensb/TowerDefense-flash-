package script.role.enemy
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import script.event.*;
	
	/**
	 * ...
	 * @author YeXin
	 */
	public class BaseEnemy extends MovieClip
	{
		
		protected var path:Vector.<flash.geom.Point>;
		protected var direction:Number;
		protected var lastDirection:String;
		protected var pIndex:int = 0;
		protected var spd:Number = 2;
		protected var nextPoint:Point;
		
		private var isPause:Boolean = false;
		
		public function BaseEnemy()
		{
			super();
			
			GlobalDispacther.addEventListener(ControlEvent.GAME_PAUSE, pauseHandler);
			GlobalDispacther.addEventListener(ControlEvent.GAME_RESUME, resumeHandler);
		}
		
		public function pauseHandler(event:ControlEvent):void
		{
			stop();
			isPause = true;
		}
		
		private function resumeHandler(event:ControlEvent):void
		{
			play();
			isPause = false;
		}
		
		//为敌人添加前进路径
		public function fllowPath(path:Vector.<Point>):void
		{
			this.path = path.concat();
			
			this.x = path[0].x;
			this.y = path[0].y;
			
			findDirection();
			
			
			addEventListener(Event.ENTER_FRAME, frameHandler);
		}
		
		protected function frameHandler(event:Event):void
		{
			if (isPause) return;
			var distance = Point.distance(new Point(this.x, this.y), path[pIndex]);
			
			if (distance > spd)
			{
				this.x += spd * Math.cos(this.direction);
				this.y += spd * Math.sin(this.direction);
			}
			else
			{
				this.x = path[pIndex].x;
				this.y = path[pIndex].y;
				pIndex++;
			}
			
			findDirection();
		
		}
		
		protected function findDirection():void
		{
			if (!this.path) return;
			
			if (pIndex == this.path.length)
			{
				trace("敌军进城")
				destroy();
				return;
			}
			
			
			this.direction = Math.atan2(this.path[pIndex].y - this.y, this.path[pIndex].x - this.x);
			
			if (direction < 0)
			{
				direction += Math.PI * 2;
			}
			
			if (direction >= Math.PI * 7 / 4 || direction < Math.PI / 4)
			{
				if (lastDirection != "r")
				{
					lastDirection = "r";
					this.gotoAndPlay("r");
				}
				
			}
			
			else if (direction >= direction < Math.PI / 4 && direction < Math.PI * 3 / 4)
			{
				if (lastDirection != "f")
				{
					lastDirection = "f";
					this.gotoAndPlay("f");
				}
			}
			
			else if (direction >= direction < Math.PI * 3 / 4 && direction < Math.PI * 5 / 4)
			{
				if (lastDirection != "l")
				{
					lastDirection = "l";
					this.gotoAndPlay("l");
				}
			}
			
			else if (direction >= direction < Math.PI * 5 / 4 && direction < Math.PI * 7 / 4)
			{
				if (lastDirection != "b")
				{
					lastDirection = "b";
					this.gotoAndPlay("b");
				}
			}
		}
		
		private function destroy():void
		{
			removeEventListener(Event.ENTER_FRAME, frameHandler);
			if (this.parent)
			{
				this.parent.removeChild(this);
			}
			
			GlobalDispacther.removeEventListener(ControlEvent.GAME_PAUSE, pauseHandler);
			GlobalDispacther.removeEventListener(ControlEvent.GAME_RESUME, resumeHandler);
		}
	
	}

}