package script.cache 
{
	import script.tower.BuildingGround;
	/**
	 * ...
	 * @author YeXin
	 */
	public class GlobalData 
	{
		public static var currentSelectedGround:BuildingGround;
		public function GlobalData() 
		{
			throw new Error("不需要实例化");
		}
		
	}

}