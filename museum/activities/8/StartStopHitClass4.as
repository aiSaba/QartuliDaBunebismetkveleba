package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	//import com.greensock.*;
	import flash.geom.Point;
	import flash.utils.*;
	import flash.events.DataEvent;
	
	public class StartStopHitClass4 extends MovieClip
	{
		private var Drag:MovieClip
		private var Hit:MovieClip
		//private var Text:String;
		private var StartCordinats:Point;
		
		public function StartStopHitClass4(_Drag:MovieClip, _Hit:MovieClip)
		{
			
			this.Drag = _Drag;
			this.Hit = _Hit;
			//this.Text = _Text;
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
				Drag.visible = false;
				Drag.stopDrag();
				Drag.mouseEnabled = false;
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "sie"));
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "sao"));
				
			}
			else
			{
				Drag.x = StartCordinats.x;
				Drag.y = StartCordinats.y;
				Drag.stopDrag();
				
			}
			if (Drag.visible == false)
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
		
		private function destroy():void
		{			
			Drag.removeEventListener(MouseEvent.MOUSE_DOWN, StartDragHandler)
			Drag.removeEventListener(MouseEvent.MOUSE_UP, StopDragHandler)
		}
	
	}

}
