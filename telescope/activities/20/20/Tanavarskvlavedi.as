package  {
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	public class Tanavarskvlavedi extends MovieClip 
	{
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var all:MovieClip;
		
		
		
		public function Tanavarskvlavedi(_stageWidth:Number=1024, _stageHeight:Number=768) 
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, init);	
		}
		
		
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init)
			initObjects();
		}
		
		private function initObjects():void
		{
			all = new All();
			
			all.x = _stageWidth / 2;
			all.y = _stageHeight / 2;
			
			all.height = _stageHeight;
			all.scaleX = all.scaleY;
			
			all.man_naxat.visible = false;
			all.man_werti.visible = false;
			
			all.wertilebi.buttonMode = true;
			all.naxatebi.buttonMode = true;
			all.next.buttonMode = true;
			addChild(all);
			
			all.naxatebi.addEventListener(MouseEvent.MOUSE_DOWN, naxatiFunc);
			all.wertilebi.addEventListener(MouseEvent.MOUSE_DOWN, wertiliFunc);
			all.next.addEventListener(MouseEvent.MOUSE_DOWN, nextFunc);
		}
		
		private function nextFunc(e:MouseEvent):void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"));
			destroy();
		}
		
		private function wertiliFunc(e:MouseEvent):void 
		{
			if (!all.man_werti.visible)
			{
				all.man.visible = false;
				all.man_naxat.visible = false;
				all.man_werti.x = all.man.x;
				all.man_werti.y = all.man.y;
				all.man_werti.visible = true;
			}
			else
			{
				all.man.visible = true;
				//all.man_naxat.visible = true;
				all.man_werti.x = all.man.x;
				all.man_werti.y = all.man.y;
				all.man_werti.visible = false;	
			}
		}
		
		
		private function naxatiFunc(e:MouseEvent):void 
		{
			if (!all.man_naxat.visible)
			{
				all.man.visible = false;
				all.man_werti.visible = false;
				all.man_naxat.x = all.man.x;
				all.man_naxat.y = all.man.y;
				all.man_naxat.visible = true;
			}
			else
			{
				all.man.visible = true;
				//all.man_werti.visible = true;
				all.man_naxat.x = all.man.x;
				all.man_naxat.y = all.man.y;
				all.man_naxat.visible = false;
			}
			
		}
		
		
		
		
		private function destroy():void
		{
			all.naxatebi.removeEventListener(MouseEvent.MOUSE_DOWN, naxatiFunc);
			all.wertilebi.removeEventListener(MouseEvent.MOUSE_DOWN, wertiliFunc);
			all.next.removeEventListener(MouseEvent.MOUSE_DOWN, nextFunc);
			removeChild(all);
			all = null;
	
		} //end destroy
		
	}
	
}
