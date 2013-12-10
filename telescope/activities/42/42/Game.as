package
{
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.*;
	import com.greensock.easing.*;
	
	public class Game extends MovieClip
	{
		private var kometa1:MovieClip;
		private var kometa2:MovieClip;
		private var kometa3:MovieClip;
		private var _Width:Number;
		private var _Height:Number;
		private var i:int = 2;
		private var j:int = 2;
		private var k:int = 2;
		private var bool1:Boolean = false;
		private var bool2:Boolean = false;
		private var bool3:Boolean = false;
		
		public function Game(_Width:Number = 1024, _Height:Number = 800)
		{
			this._Height = _Height;
			this._Width = _Width;
			addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initHandler();
		}
		
		private function initHandler():void
		{
			kometa1 = new Kometa1();
			kometa1.x = _Width / 2;
			kometa1.y = _Height / 2;
			kometa1.heigth = _Height / 1.2;
			kometa1.scaleX = kometa1.scaleY;
			addChild(kometa1);
			bool1 = true;
			kometa1.nextB.addEventListener(MouseEvent.MOUSE_DOWN, nextScenahandler)
			kometa1.backB.addEventListener(MouseEvent.MOUSE_DOWN, backScenahandler)
			kometa1.playPause.addEventListener(MouseEvent.MOUSE_DOWN, playHandler)
			kometa1.nextK.addEventListener(MouseEvent.MOUSE_DOWN, nextKHandler2)
			kometa1.preK.addEventListener(MouseEvent.MOUSE_DOWN, preKHandler3)
			
			kometa2 = new Kometa2();
			kometa2.x = _Width / 2;
			kometa2.y = _Height / 2;
			kometa2.width = _Width / 1.2;
			kometa2.scaleY = kometa2.scaleX;
			
			kometa3 = new Kometa3();
			kometa3.x = _Width / 2;
			kometa3.y = _Height / 2;
			kometa3.width = _Width / 1.2;
			kometa3.scaleY = kometa3.scaleX;
			
			kometa1.endofGame.addEventListener(MouseEvent.MOUSE_DOWN, endOfStage);
			
			
		}
		
		private function endOfStage(e:MouseEvent):void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfStage"));
		}
		
		// amas idzaxebs kometa 1
		
		private function preKHandler3(e:MouseEvent):void
		{
			if (kometa1)
			{
				bool1 = false;
				kometa1.nextB.removeEventListener(MouseEvent.MOUSE_DOWN, nextScenahandler)
				kometa1.backB.removeEventListener(MouseEvent.MOUSE_DOWN, backScenahandler)
				kometa1.playPause.removeEventListener(MouseEvent.MOUSE_DOWN, playHandler)
				kometa1.nextK.removeEventListener(MouseEvent.MOUSE_DOWN, nextKHandler2)
				kometa1.preK.removeEventListener(MouseEvent.MOUSE_DOWN, preKHandler3)
				removeChild(kometa1);				
				//kometa1 = null;
			}
			addChild(kometa3)
			bool3 = true;
			kometa3.nextB.addEventListener(MouseEvent.MOUSE_DOWN, nextScenahandler)
			kometa3.backB.addEventListener(MouseEvent.MOUSE_DOWN, backScenahandler)
			kometa3.playPause.addEventListener(MouseEvent.MOUSE_DOWN, playHandler)
			kometa3.nextK.addEventListener(MouseEvent.MOUSE_DOWN, nextKHandler1)
			kometa3.preK.addEventListener(MouseEvent.MOUSE_DOWN, preKHandler2)
			
			kometa3.endofGame.addEventListener(MouseEvent.MOUSE_DOWN, endOfStage);
		}
		
		private function nextKHandler2(e:MouseEvent):void
		{
			if (kometa1)
			{
				bool1 = false;
				kometa1.nextB.removeEventListener(MouseEvent.MOUSE_DOWN, nextScenahandler)
				kometa1.backB.removeEventListener(MouseEvent.MOUSE_DOWN, backScenahandler)
				kometa1.playPause.removeEventListener(MouseEvent.MOUSE_DOWN, playHandler)
				kometa1.nextK.removeEventListener(MouseEvent.MOUSE_DOWN, nextKHandler2)
				kometa1.preK.removeEventListener(MouseEvent.MOUSE_DOWN, preKHandler3)
				removeChild(kometa1);
				//kometa1 = null;
			}			
			addChild(kometa2);
			bool2 = true;
			kometa2.nextB.addEventListener(MouseEvent.MOUSE_DOWN, nextScenahandler)
			kometa2.backB.addEventListener(MouseEvent.MOUSE_DOWN, backScenahandler)
			kometa2.playPause.addEventListener(MouseEvent.MOUSE_DOWN, playHandler)
			kometa2.nextK.addEventListener(MouseEvent.MOUSE_DOWN, nextKHandler3)
			kometa2.preK.addEventListener(MouseEvent.MOUSE_DOWN, preKHandler1)
			kometa2.endofGame.addEventListener(MouseEvent.MOUSE_DOWN, endOfStage);
		}
		
		//amas idzaxebs kometa 3
		
		private function preKHandler2(e:MouseEvent):void
		{
			if (kometa3)
			{
				bool3 = false;
				kometa3.nextB.removeEventListener(MouseEvent.MOUSE_DOWN, nextScenahandler)
				kometa3.backB.removeEventListener(MouseEvent.MOUSE_DOWN, backScenahandler)
				kometa3.playPause.removeEventListener(MouseEvent.MOUSE_DOWN, playHandler)
				kometa3.nextK.removeEventListener(MouseEvent.MOUSE_DOWN, nextKHandler1)
				kometa3.preK.removeEventListener(MouseEvent.MOUSE_DOWN, preKHandler2)
				removeChild(kometa3);
				//kometa3 = null
			}
			addChild(kometa2);
			bool2 = true;
			kometa2.nextB.addEventListener(MouseEvent.MOUSE_DOWN, nextScenahandler)
			kometa2.backB.addEventListener(MouseEvent.MOUSE_DOWN, backScenahandler)
			kometa2.playPause.addEventListener(MouseEvent.MOUSE_DOWN, playHandler)
			kometa2.nextK.addEventListener(MouseEvent.MOUSE_DOWN, nextKHandler3)
			kometa2.preK.addEventListener(MouseEvent.MOUSE_DOWN, preKHandler1)
			kometa2.endofGame.addEventListener(MouseEvent.MOUSE_DOWN, endOfStage);
		}
		
		private function nextKHandler1(e:MouseEvent):void
		{
			if (kometa3)
			{
				bool3 = false;
				kometa3.nextB.removeEventListener(MouseEvent.MOUSE_DOWN, nextScenahandler)
				kometa3.backB.removeEventListener(MouseEvent.MOUSE_DOWN, backScenahandler)
				kometa3.playPause.removeEventListener(MouseEvent.MOUSE_DOWN, playHandler)
				kometa3.nextK.removeEventListener(MouseEvent.MOUSE_DOWN, nextKHandler3)
				kometa3.preK.removeEventListener(MouseEvent.MOUSE_DOWN, preKHandler1)
				removeChild(kometa3);
				//kometa3 = null
			}
			addChild(kometa1);
			bool1 = true;
			kometa1.nextB.addEventListener(MouseEvent.MOUSE_DOWN, nextScenahandler)
			kometa1.backB.addEventListener(MouseEvent.MOUSE_DOWN, backScenahandler)
			kometa1.playPause.addEventListener(MouseEvent.MOUSE_DOWN, playHandler)
			kometa1.nextK.addEventListener(MouseEvent.MOUSE_DOWN, nextKHandler2)
			kometa1.preK.addEventListener(MouseEvent.MOUSE_DOWN, preKHandler3)
			kometa1.endofGame.addEventListener(MouseEvent.MOUSE_DOWN, endOfStage);
		}
		
		//meore kometa idzaxebs am finqciebs
		private function preKHandler1(e:MouseEvent):void
		{
			if (kometa2)
			{
				bool2 = false;
				kometa2.nextB.removeEventListener(MouseEvent.MOUSE_DOWN, nextScenahandler)
				kometa2.backB.removeEventListener(MouseEvent.MOUSE_DOWN, backScenahandler)
				kometa2.playPause.removeEventListener(MouseEvent.MOUSE_DOWN, playHandler)
				kometa2.nextK.removeEventListener(MouseEvent.MOUSE_DOWN, nextKHandler3)
				kometa2.preK.removeEventListener(MouseEvent.MOUSE_DOWN, preKHandler1)
				removeChild(kometa2);
				//kometa2 = null
			}
			addChild(kometa1);
			bool1 = true;
			kometa1.nextB.addEventListener(MouseEvent.MOUSE_DOWN, nextScenahandler)
			kometa1.backB.addEventListener(MouseEvent.MOUSE_DOWN, backScenahandler)
			kometa1.playPause.addEventListener(MouseEvent.MOUSE_DOWN, playHandler)
			kometa1.nextK.addEventListener(MouseEvent.MOUSE_DOWN, nextKHandler2)
			kometa1.preK.addEventListener(MouseEvent.MOUSE_DOWN, preKHandler3)
			kometa1.endofGame.addEventListener(MouseEvent.MOUSE_DOWN, endOfStage);
		}
		
		private function nextKHandler3(e:MouseEvent):void
		{
			if (kometa2)
			{
				bool2 = false;
				kometa2.nextB.removeEventListener(MouseEvent.MOUSE_DOWN, nextScenahandler)
				kometa2.backB.removeEventListener(MouseEvent.MOUSE_DOWN, backScenahandler)
				kometa2.playPause.removeEventListener(MouseEvent.MOUSE_DOWN, playHandler)
				kometa2.nextK.removeEventListener(MouseEvent.MOUSE_DOWN, nextKHandler3)
				kometa2.preK.removeEventListener(MouseEvent.MOUSE_DOWN, preKHandler1)
				removeChild(kometa2);
				//kometa2 = null
			}
			addChild(kometa3);
			bool3 = true;
			kometa3.nextB.addEventListener(MouseEvent.MOUSE_DOWN, nextScenahandler)
			kometa3.backB.addEventListener(MouseEvent.MOUSE_DOWN, backScenahandler)
			kometa3.playPause.addEventListener(MouseEvent.MOUSE_DOWN, playHandler)
			kometa3.nextK.addEventListener(MouseEvent.MOUSE_DOWN, nextKHandler1)
			kometa3.preK.addEventListener(MouseEvent.MOUSE_DOWN, preKHandler2)	
			kometa3.endofGame.addEventListener(MouseEvent.MOUSE_DOWN, endOfStage);
		}
		
		//////animations
		
		private function playHandler(e:MouseEvent):void
		{
			if (kometa1 && bool1)
			{
				TweenMax.fromTo(kometa1, 1, {frame: 1}, {frame: 12});
			}
			if (kometa2 && bool2)
			{
				TweenMax.fromTo(kometa2, 1, {frame: 1}, {frame: 12});
			}
			if (kometa3 && bool3)
			{
				TweenMax.fromTo(kometa3, 1, {frame: 1}, {frame: 12});
			}
		
		}
		
		private function backScenahandler(e:MouseEvent):void
		{
			if (kometa1 && bool1)
			{
				if (i == 0)
				{
					i = 2;
					return;
				}
				kometa1.gotoAndStop(i--);
			}
			if (kometa2 && bool2)
			{
				if (j == 0)
				{
					j = 2;
					return;
				}
				kometa2.gotoAndStop(j--);
			}
			if (kometa3 && bool3)
			{
				if (k == 0)
				{
					k = 2;
					return;
				}
				kometa3.gotoAndStop(k--);
			}
		
		}
		
		private function nextScenahandler(e:MouseEvent):void
		{
			if (kometa1 && bool1)
			{				
				if (i == 13)
				{
					i = 11;
					return;
				}
				kometa1.gotoAndStop(i++);
			}
			if (kometa2 && bool2)
			{				
				if (j == 13)
				{
					j = 11;
					return;
				}
				kometa2.gotoAndStop(j++);
			}
			if (kometa3 && bool3)
			{				
				if (k == 13)
				{
					k = 11;
					return;
				}
				kometa3.gotoAndStop(k++);
			}
		
		}
	}

}
