package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.events.DataEvent;
	
	public class HitForA extends MovieClip
	{
		
		private var Hit:MovieClip;
		private var Drag:MovieClip;
		private var DragObjPoint:Point;
		private var obj:Object = ["hit4", "hit9"]
		
		public function HitForA(Hit:MovieClip, Drag:MovieClip)
		{
			this.Drag = Drag;
			this.Hit = Hit;
			
			DragObjPoint = new Point();
			DragObjPoint.x = Drag.x;
			DragObjPoint.y = Drag.y;		
			
			Drag.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler)
			Drag.addEventListener(MouseEvent.MOUSE_UP, stopDraghandler)
			//Drag.addEventListener(MouseEvent.MOUSE_MOVE, stopDraghandler);
		}
		
		
		private function stopDraghandler(e:MouseEvent):void
		{
			
			if (Drag.hitTestObject(Hit) && Hit.name == "hit4")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "Showa2"));
				MMMM()
			}
			if (Drag.hitTestObject(Hit) && Hit.name == "hit9")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "Showa3"));
				HHHH()
			}
			else if(Hit.name != "hit4")			
			{
				MMMM()
			}
		}
		
		private function HHHH():void
		{
			
			Drag.stopDrag();
			Drag.x = DragObjPoint.x;
			Drag.y = DragObjPoint.y;
		}
		private function MMMM():void
		{
			
			Drag.stopDrag();
			Drag.x = DragObjPoint.x;
			Drag.y = DragObjPoint.y;
		}
		
		private function startDragHandler(e:MouseEvent):void
		{
			Drag.startDrag();
			DragObjPoint.x = Drag.x;
			DragObjPoint.y = Drag.y;
		}
	
	}

}