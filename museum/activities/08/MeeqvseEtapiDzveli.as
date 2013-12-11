package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.*;
	import flash.events.DataEvent;
	import flash.events.MouseEvent;
	
	public class MeeqvseEtapiDzveli extends MovieClip
	{
		private var dzveli:MovieClip;
		
		private var Draging:StartStopHit3;
		private var Draging1:StartStopHitClass2;
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
		
		public function MeeqvseEtapiDzveli(_stageWidth:Number = 1024, _stageHeight:Number = 768)
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
			dzveli = new DzveliMc();
			addChild(dzveli);
			dzveli.x = _stageWidth / 2;
			dzveli.y = _stageHeight / 2;
			
			dzveli.height = _stageHeight / 1.5;
			dzveli.scaleX = dzveli.scaleY;
			
			wrongArray = [dzveli.me, dzveli.u, dzveli.ga, dzveli.gamo, dzveli.da, dzveli.mo, dzveli.es, dzveli.osan, dzveli.ovan, dzveli.ier, dzveli.ul, dzveli.ian, dzveli.a, dzveli.sae, dzveli.sao, dzveli.sie, dzveli.moo, dzveli.mel, dzveli.gaul]
			
			for (var i:int; i < wrongArray.length; i++)
			{
				wrongArray[i].buttonMode = true;
				wrongArray[i].addEventListener(MouseEvent.MOUSE_DOWN, wrongFunckHandler);
			}
			
			dzveli.ues.buttonMode = true;
			dzveli.i.buttonMode = true;
			dzveli.man.buttonMode = true;
			dzveli.eb.buttonMode = true;
			dzveli.ur.buttonMode = true;
			
			dzveli.ebcopy.visible = false;
			dzveli.urcopy.visible = false;
			dzveli.icopy.visible = false;
			
			dzveli.ucopy.visible = false;
			dzveli.escopy.visible = false;
			dzveli.icopy2.visible = false;
			
			dzveli.icopy3.visible = false;
			dzveli.mancopy.visible = false;
			
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
			Draging = new StartStopHit3(dzveli.eb, dzveli.ur, dzveli.i, dzveli.textBack);
			Draging.addEventListener(DataEvent.DATA, dispaCheventHandler, false, 0, true)
		}
		
		private function secont():void
		{
			trace("2");
			Draging1 = new StartStopHitClass2(dzveli.man, dzveli.i, dzveli.textBack);
			Draging1.addEventListener(DataEvent.DATA, dispaCheventHandler1, false, 0, true)
		}
		
		private function first():void
		{
			trace("3");
			Draging3 = new StartStopHitClass2(dzveli.ues, dzveli.i, dzveli.textBack);
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
			wrong.loadSound("error.mp3", 1)
			wrong.soundPlay();
		}
		
		private function dispaCheventHandler2(e:DataEvent):void
		{
			dzveli.textBack.mainTextBox.text = "ძველ";
			if (e.data == "showues")
			{
				dzveli.ucopy.visible = true;
				dzveli.escopy.visible = true;
			}
			if (e.data == "showi")
			{
				dzveli.icopy2.visible = true;
			}
			if (e.data == "ShecvaleTexti")
			{
				soundControl2 = new SoundControl;
				soundControl2.loadSound("correct.mp3", 1);
				addChild(soundControl2);
				soundControl2.soundPlay();
				bool1 = true;
				setTimeout(nextText, 2000);
			}
		}
		
		private function dispaCheventHandler1(e:DataEvent):void
		{
			
			dzveli.textBack.mainTextBox.text = "ძველ";
			if (e.data == "showman")
			{
				dzveli.mancopy.visible = true;
			}
			if (e.data == "i")
			{
				dzveli.icopy3.visible = true;
			}
			if (e.data == "ShecvaleTexti")
			{
				soundControl2 = new SoundControl;
				soundControl2.loadSound("correct.mp3", 1);
				addChild(soundControl2);
				soundControl2.soundPlay();
				
				bool2 = true;
				setTimeout(nextText, 2000);
			}
		}
		
		private function dispaCheventHandler(e:DataEvent):void
		{
			
			dzveli.textBack.mainTextBox.text = "ძველ";
			if (e.data == "showeb")
			{
				dzveli.ebcopy.visible = true;
			}
			if (e.data == "ur")
			{
				dzveli.urcopy.visible = true;
			}
			if (e.data == "i")
			{
				dzveli.icopy.visible = true;
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
			
			if (dzveli)
			{
				removeChild(dzveli);
				dzveli = null;
			}
		
		}
	
	}

}
