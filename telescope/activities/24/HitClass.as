package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.events.DataEvent;
	
	public class HitClass extends MovieClip
	{
		
		private var Hit:MovieClip;
		private var Drag:MovieClip;
		private var DragObjPoint:Point;
		
		public function HitClass(Hit:MovieClip, Drag:MovieClip)
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
					case "T":
						dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "Showtt"));
						HHHH()
						break;
					case "e":
						dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "Showe"));													
						break;
					case "l":
						dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "Showl"));
						HHHH();
						break;
					case "s":
						dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "Shows"));
						HHHH();
						break;
					case "k":
						dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "Showk"));
						HHHH();
						break;
					case "o":
						dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "Showo"));
						HHHH();
						break;
					case "p":
						dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "Showp"));
						HHHH();
						break;
					case "i":
						dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "Showi"));
						HHHH();
						break;						
				}	
			}
			else if(e.currentTarget.name != "e")
			{
				HHHH()
			}
		}
		private function HHHH():void
		{		
			Drag.x = DragObjPoint.x;
			Drag.y = DragObjPoint.y;			
			Drag.stopDrag();
		}
		
		private function startDragHandler(e:MouseEvent):void
		{		
			
			Drag.startDrag();
			DragObjPoint.x = Drag.x;
			DragObjPoint.y = Drag.y;
		}
	
	}

}