package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.*;
	import flash.events.DataEvent;
	
	public class StartStopHitClass2 extends MovieClip
	{
		private var Drag:MovieClip
		private var Drag1:MovieClip;
		private var Hit:MovieClip
		
		private var StartCordinats:Point;
		private var StartCordinats1:Point;
		
		private var fordispach:Boolean;
		private var fordispach1:Boolean;
		
		public function StartStopHitClass2(_Drag:MovieClip, _Drag1:MovieClip, _Hit:MovieClip)
		{
			
			this.Drag = _Drag;
			this.Hit = _Hit;
			this.Drag1 = _Drag1;
			
			StartCordinats = new Point();
			StartCordinats.x = Drag.x;
			StartCordinats.y = Drag.y;
			StartCordinats1 = new Point;
			StartCordinats1.x = Drag1.x;
			StartCordinats1.y = Drag1.y;
			
			Drag.addEventListener(MouseEvent.MOUSE_DOWN, StartDragHandler)
			Drag.addEventListener(MouseEvent.MOUSE_UP, StopDragHandler)
			Drag1.addEventListener(MouseEvent.MOUSE_DOWN, StartDragHandler1)
			Drag1.addEventListener(MouseEvent.MOUSE_UP, StopDragHandler)
			fordispach = false;
			fordispach1 = false;
		
		}
		
		private function StopDragHandler(e:MouseEvent):void
		{
			
			if (Drag.hitTestObject(Hit))
			{
				Drag.visible = false;
				Drag.x = StartCordinats.x;
				Drag.y = StartCordinats.y;
				Drag.stopDrag();
				Drag.mouseEnabled = false;
				fordispach = true;
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "showian"));
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "showues"));
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "showman"));
			}
			else
			{
				Drag.x = StartCordinats.x;
				Drag.y = StartCordinats.y;
				Drag.stopDrag();
			}
			if (Drag1.hitTestObject(Hit))
			{
				Drag1.visible = false;
				Drag1.x = StartCordinats1.x;
				Drag1.y = StartCordinats1.y;
				Drag1.stopDrag();
				Drag1.mouseEnabled = false;
				fordispach1 = true;
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "showi"));
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "i"));
			}
			else
			{
				Drag1.x = StartCordinats1.x;
				Drag1.y = StartCordinats1.y;
				Drag1.stopDrag();
			}
			if (fordispach && fordispach1)
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ShecvaleTexti"));
			}
		}
		
		private function StartDragHandler(e:MouseEvent):void
		{
			Drag.startDrag();
			StartCordinats.x = Drag.x;
			StartCordinats.y = Drag.y;
		}
		
		private function StartDragHandler1(e:MouseEvent):void
		{
			
			Drag1.startDrag();
			StartCordinats1.x = Drag1.x;
			StartCordinats1.y = Drag1.y;
		
		}
		
		private function destroy():void
		{
			
			Drag.removeEventListener(MouseEvent.MOUSE_DOWN, StartDragHandler)
			Drag.removeEventListener(MouseEvent.MOUSE_UP, StopDragHandler)
		}
	
	}

}
