package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.events.DataEvent;
	
	public class HitForE extends MovieClip
	{
		
		private var Hit:MovieClip;
		private var Drag:MovieClip;
		private var DragObjPoint:Point;
		private var teleskopi:String = "Teleskopi";
		
		public function HitForE(Hit:MovieClip, Drag:MovieClip)
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
			
			if (Drag.hitTestObject(Hit) || Hit.hitTestObject(Drag))
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "Showe2"));
				HHHH()
			}
			else
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
