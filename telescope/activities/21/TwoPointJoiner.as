package  {
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	
	
	public class TwoPointJoiner extends MovieClip {
		
		private var pointArr:Array;
		private var pathArr:Array;
		private var pointLen:Number;
		private var pathLen:Number;
		private var index:Number = 0;
		private var mc:MovieClip;
		private var all:MovieClip;
		private var line:Line;
		
		public function TwoPointJoiner(all:MovieClip, pointArr:Array, pathArr:Array ) 
		{
			this.all = all;
			//this.mc = mc;
			this.pointArr = pointArr;
			this.pathArr = pathArr;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			first();
		}
		
		private function first():void
		{
			pointLen = pointArr.length;
			pathLen = pathArr.length;
		
			for (var i = 2; i < pointLen; i++ )
			{
				pointArr[i].visible = false;
			}
			addLine();
		}
		
	
		private function addLine():void
		{
			line = new Line(all, pointArr[pathArr[index]], pointArr[pathArr[index + 1]]);
			line.addEventListener(DataEvent.DATA, clickedFunc, false, 0, true);
			addChild(line);
		}
		
		private function clickedFunc(ev:DataEvent):void
		{
			if (ev.data == "Clicked")
			{
				try {
					index += 2;
					if (index == pathLen)
					{
						trace("win");
						index = 0;
						dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "endStar"));
					}
					pointArr[pathArr[index+1]].visible = true;
					addLine();
					}
				catch (e:Error)
					{
						trace("error")
					}
			}
		}
		
		
		
	}
	
}
