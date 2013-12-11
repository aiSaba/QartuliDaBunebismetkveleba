package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import adobe.utils.ProductManager;
	import flash.utils.*;
	import flash.events.DataEvent;
	import flash.events.MouseEvent;
	import com.greensock.*
	import com.greensock.easing.*
	
	public class MeeqvseEtapiSwrafi extends MovieClip
	{
		private var swrafi:MovieClip;
		
		private var Draging:StartStopHitClass4;
		private var Draging1:StartStopHitClass4;
		private var Draging3:StartStopHitClass2;
		
		private var wrongArray:Array;
		private var wrong:SoundControl;
		
		private var bool1:Boolean;
		private var bool2:Boolean;
		private var bool3:Boolean;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		private var randFuncArray:Array;
		
		private var soundControl2:SoundControl;
		
		private var randNumb:Number;
		
		public function MeeqvseEtapiSwrafi(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, initHandler)
		}
		
		private function initHandler(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, initHandler);
			initMeeqvseetapi();
		}
		
		private function initMeeqvseetapi():void
		{
			
			swrafi = new Swrafi();
			addChild(swrafi);
			
			swrafi.x = _stageWidth / 2;
			swrafi.y = _stageHeight / 2;
			
			swrafi.height = _stageHeight / 1.5;
			swrafi.scaleX = swrafi.scaleY;
			
			wrongArray = [swrafi.me, swrafi.u, swrafi.ga, swrafi.gamo, swrafi.da, swrafi.mo, swrafi.eb, swrafi.ur, swrafi.es, swrafi.man, swrafi.osan, swrafi.ovan, swrafi.ier, swrafi.ul, swrafi.ian, swrafi.a, swrafi.sae, swrafi.moo, swrafi.mel, swrafi.gaul]
			for (var i:int; i < wrongArray.length; i++)
			{
				wrongArray[i].buttonMode = true;
				wrongArray[i].addEventListener(MouseEvent.MOUSE_DOWN, wrongFunckHandler);
			}
			swrafi.sie.buttonMode = true;
			swrafi.sao.buttonMode = true;
			swrafi.ues.buttonMode = true;
			swrafi.i.buttonMode = true;
			
			swrafi.sicopy.visible = false;
			swrafi.ecopy.visible = false;
			
			swrafi.sacopy.visible = false;
			swrafi.ocopy.visible = false;
			
			swrafi.ucopy.visible = false;
			swrafi.escopy.visible = false;
			swrafi.icopy.visible = false;
			
			bool1 = false;
			bool2 = false;
			bool3 = false;
			
			randNumb = Math.round(Math.random() * 2);
			
			switch (randNumb)
			{
				case 0: 
					first();
					break;
				case 1: 
					secont();
					break
				case 2: 
					third();
					break;
			}
		
		}
		
		private function third():void
		{
			trace("1");
			Draging = new StartStopHitClass4(swrafi.sie, swrafi.textBack);
			Draging.addEventListener(DataEvent.DATA, dispaCheventHandler, false, 0, true)
		}
		
		private function secont():void
		{
			trace("2");
			Draging1 = new StartStopHitClass4(swrafi.sao, swrafi.textBack);
			Draging1.addEventListener(DataEvent.DATA, dispaCheventHandler1, false, 0, true)
		}
		
		private function first():void
		{
			trace("3");
			Draging3 = new StartStopHitClass2(swrafi.ues, swrafi.i, swrafi.textBack);
			Draging3.addEventListener(DataEvent.DATA, dispaCheventHandler2, false, 0, true)
		}
		
		private function wrongFunckHandler(e:MouseEvent):void
		{
			wrong = new SoundControl();
			addChild(wrong);
			if (wrong.soundIsPlaying())
			{
				return;
			}
			wrong.loadSound("error.mp3", .1)
			wrong.soundPlay();
		}
		
		private function dispaCheventHandler2(e:DataEvent):void
		{
			
			swrafi.textBack.mainTextBox.text = "სწრაფ";
			if (e.data == "showues")
			{
				swrafi.ucopy.visible = true;
				swrafi.escopy.visible = true;
			}
			if (e.data == "i")
			{
				swrafi.icopy.visible = true;
				
			}
			if (e.data == "ShecvaleTexti")
			{
				bool1 = true;
				soundControl2 = new SoundControl;
				soundControl2.loadSound("correct.mp3", 1);
				addChild(soundControl2);
				soundControl2.soundPlay();
				setTimeout(nextText, 2000);
			}
		}
		
		private function dispaCheventHandler1(e:DataEvent):void
		{
			
			swrafi.textBack.mainTextBox.text = "სწრაფ";
			if (e.data == "sao")
			{
				swrafi.sacopy.visible = true;
				swrafi.ocopy.visible = true;
			}
			if (e.data == "ShecvaleTexti")
			{
				bool2 = true;
				soundControl2 = new SoundControl;
				soundControl2.loadSound("correct.mp3", 1);
				addChild(soundControl2);
				soundControl2.soundPlay();
				setTimeout(nextText, 2000);
			}
		}
		
		private function dispaCheventHandler(e:DataEvent):void
		{
			
			swrafi.textBack.mainTextBox.text = "სწრაფ";
			if (e.data == "sie")
			{
				swrafi.sicopy.visible = true;
				swrafi.ecopy.visible = true;
			}
			if (e.data == "ShecvaleTexti")
			{
				bool3 = true;
				soundControl2 = new SoundControl;
				soundControl2.loadSound("correct.mp3", 1);
				addChild(soundControl2);
				soundControl2.soundPlay();
				setTimeout(nextText, 2000);
			}
		}
		
		private function nextText():void
		{
			if (bool1 || bool2 || bool3)
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "EndOFClass"));
				//setTimeout(destroy, 1000);
				destroy();
				
			}
		}
		
		private function destroy():void
		{
			
			if (swrafi)
			{
				removeChild(swrafi);
				swrafi = null;
			}
		
		}
	
	}

}
