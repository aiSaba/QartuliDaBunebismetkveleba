package
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Test extends MovieClip
	{
		
		private var all:MovieClip;
		private var clipsWidthsSum:int;
		private var diffWidth:Number;
		private var movArray:Array;
		private var stWidth:Number;
		
		public function Test(movArray:Array, stWidth:Number)
		{
			
			this.movArray = movArray;
			this.stWidth = stWidth;
			addEventListener(Event.ADDED_TO_STAGE, init)	
		}
		
		private function init(ev:Event)
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			align();
		}
		
		private function align():void
		{
		
			
			
			
			
			
			for (var j:int = 0; j < movArray.length; j++)
			{
				clipsWidthsSum += movArray[j].width;
				
			}
			
			
			diffWidth = ((stWidth - clipsWidthsSum)/5) ;
			
			
	
			for (var i:int = 0; i < movArray.length; i++)
			{
				
				if (i == 0)
				{
					movArray[0].x = -stWidth / 2 + diffWidth;
				}
				else
				{
					movArray[i].x = (movArray[i - 1].x +  diffWidth + movArray[i - 1].width) ;
				}
				
				

			}
		
		}
	
	}

}
