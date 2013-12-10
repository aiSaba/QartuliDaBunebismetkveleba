package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.events.DataEvent;
	
	public class HitClass1 extends MovieClip
	{
		
		private var Hit:MovieClip;
		private var Drag:MovieClip;
		private var DragObjPoint:Point;
		
		public function HitClass1(Hit:MovieClip, Drag:MovieClip)
		{
			this.Drag = Drag;
			this.Hit = Hit;
			
			DragObjPoint = new Point();
			DragObjPoint.x = Drag.x;
			DragObjPoint.y = Drag.y;
			
			Drag.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler)
			Drag.addEventListener(MouseEvent.MOUSE_UP, stopDraghandler)			
		}
		
		
		
		private function stopDraghandler(e:MouseEvent):void
		{
			if (Drag.hitTestObject(Hit))
			{
				switch(e.currentTarget.name)
				{
					case "g":
						dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "Showtt"));
						HHHH()
						break;
					case "a":
						
						dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "Showe"));													
						break;
					case "l":
						dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "Showl"));
						HHHH();
						break;
					case "q":
						dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "Shows"));
						HHHH();
						break;
					case "T":
						dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "Showk"));
						HHHH();
						break;
					case "i":
						dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "Showo"));
						HHHH();
						break;
					case "k":
						dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "Showp"));
						HHHH();
						break;									
				}	
			}
			else if(e.currentTarget.name != "a")
			{
				
				HHHH()
			}
		}
		private function HHHH():void
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