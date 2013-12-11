package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.DataEvent;
	//import com.greensock.*;
	import flash.geom.Point;
	import flash.utils.*;
	
	public class StartStopHitClass extends MovieClip
	{
		private var Drag:MovieClip
		private var Hit:MovieClip
		private var StartCordinats:Point;
		private static var count:int;
		
		
		public function StartStopHitClass(_Drag:MovieClip, _Hit:MovieClip)
		{
			
			this.Drag = _Drag;
			this.Hit = _Hit;
			StartCordinats = new Point();
			StartCordinats.x = Drag.x;
			StartCordinats.y = Drag.y;
			
			Drag.addEventListener(MouseEvent.MOUSE_DOWN, StartDragHandler)
			Drag.addEventListener(MouseEvent.MOUSE_UP, StopDragHandler)
		}
		
		private function StopDragHandler(e:MouseEvent):void
		{
			
			if (Drag.hitTestObject(Hit))
			{
				Drag.x = Hit.x + Hit.width / 2;
				Drag.y = Hit.y + Hit.height / 2;
				Drag.stopDrag();
				Drag.mouseEnabled = false;
				
				Drag.removeEventListener(MouseEvent.MOUSE_DOWN, StartDragHandler)
				count++;
				
			}
			else
			{
				
				Drag.x = StartCordinats.x;
				Drag.y = StartCordinats.y;
				Drag.stopDrag();
				Drag.mouseEnabled = false;
			}	
			
			if (count == 4)
			{
				
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchi scenas"));
			}
		
		}
		
		private function StartDragHandler(e:MouseEvent):void
		{
			
			Drag.startDrag();
			StartCordinats.x = Drag.x;
			StartCordinats.y = Drag.y;
		
		}		
		private function destroy():void
		{
			
			Drag.removeEventListener(MouseEvent.MOUSE_DOWN, StartDragHandler)
			Drag.removeEventListener(MouseEvent.MOUSE_UP, StopDragHandler)
		}
	
	}

}
