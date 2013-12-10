package
{
	
	import fl.motion.easing.Back;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.Mouse;
	
	public class Draw extends MovieClip
	{
		private var drawing:Boolean;
		private var bowl:MovieClip;
		private var mc:MovieClip;
		
		private var pointer:MovieClip;
		
		public function Draw(mc:MovieClip)
		{
			this.mc = mc;
			this.mask = mc.moonMask;
			addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true);
		}
		
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addObjects();
		}
		var startPointer:Point
		private function addObjects():void
		{
			/*bowl = new Bowl();
			   addChild(bowl);
			   bowl.x = Initialization._stage.stageWidth / 2;
			 bowl.y = Initialization._stage.stageHeight / 2*/
			
			 startPointer = new Point();
			 
			pointer = mc.pointer;
			
			startPointer.x= pointer.x;
			startPointer.y = pointer.y
			
			pointer.x = mouseX;
			pointer.y = mouseY;
			
		
			
			//Mouse.hide();
			ThirdStageController._stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler)
			ThirdStageController._stage.addEventListener(MouseEvent.MOUSE_DOWN, startDrawing);
			ThirdStageController._stage.addEventListener(MouseEvent.MOUSE_MOVE, draw);
			ThirdStageController._stage.addEventListener(MouseEvent.MOUSE_UP, stopDrawing);
			mc.takePhoto.addEventListener(MouseEvent.MOUSE_DOWN, scrFunc);
			
			drawing = false;
		}
		
		
		
		

		private function scrFunc(e:MouseEvent):void
		{
			var scr:Raghats = new Raghats(stage);
		}
		
		private function mouseMoveHandler(ev:MouseEvent):void
		{
			pointer.x = ev.stageX;
			pointer.y = ev.stageY;
		}
		
		private function draw(ev:MouseEvent):void
		{
			if (drawing)
			{
				if (mc.moon.hitTestObject(pointer))
				{
					Mouse.hide();
					pointer.visible = true;
				}
				else
				{
					pointer.visible = false;
				}

				graphics.lineTo(mouseX, mouseY);
			}
			else
			{
				Mouse.show();
				pointer.visible = true;
			}
		} // end Draw
		
		public function startDrawing(event:MouseEvent):void
		{
			graphics.lineStyle(3, 0x000000);
			graphics.moveTo(mouseX, mouseY);
			drawing = true;
		
		} // end startDrawing
		
		public function stopDrawing(event:MouseEvent):void
		{
			ThirdStageController._stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler)
			drawing = false;
			pointer.x = startPointer.x;
			pointer.y = startPointer.y;
		}
	
	}

}
