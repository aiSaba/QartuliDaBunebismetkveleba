package
{
	
	import com.greensock.BlitMask;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	import flash.filters.GlowFilter;
	import flash.events.DataEvent;
	
	public class AddBuildings extends MovieClip
	{
		
		private var all:MovieClip;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var first:Array;
		private var second:Array;
		private var line:Line;
		private var secondTarget:Object;
		private var counter:int = 0;
		private var checker:int = 0;
		private var finish:String = "f";
		
		public function AddBuildings(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init)
			initializationBuildings();
		}
		
		private function initializationBuildings():void
		{
			all = new All();
			all.x = _stageWidth / 2;
			all.y = _stageHeight / 2;
			all.height = _stageHeight / 1.5;
			all.scaleX = all.scaleY;
			addChild(all);
			
			first = [all.astronomi, all.teleskopi, all.mze, all.varskvlavi];
			second = [all.acimcimda, all.cxovrobda, all.mushaobda, all.idga, all.amovida, all.gaqra];
			
			secondTarget = new Object();
			roles();
		}
		
		private function roles():void
		{
			checker = 0;
			for (var i:int = 0; i < second.length; i++)
			{
				second[i].addEventListener(MouseEvent.MOUSE_DOWN, secondFunc);
				second[i].mouseEnabled = true;
			}
			for (var j:int = 0; j < first.length; j++)
			{
				if (counter != j)
				{
					first[j].alpha = 0.8;
				}
				else
				{
					first[j].alpha = 1;
				}
			}
		}
		
		private function secondFunc(e:MouseEvent):void
		{
			var sc:SoundControl = new SoundControl();
			secondTarget = e.currentTarget;
			var bl:Boolean = new Boolean();
			bl = true;
			if (first[counter] == first[0] && secondTarget == second[1])
			{
				checker++;
				bl = false;
				line = new Line(all, first[counter], secondTarget)
				addChild(line);
				second[1].mouseEnabled = false;
			}
			if (first[counter] == first[0] && secondTarget == second[2])
			{
				checker++;
				bl = false;
				line = new Line(all, first[counter], secondTarget)
				addChild(line);
				second[2].mouseEnabled = false;
			}
			if (checker == 2)
			{
				counter++;
				roles();
				return;
			}
			
			if (first[counter] == first[1] && secondTarget == second[3])
			{
				checker++;
				bl = false;
				line = new Line(all, first[counter], secondTarget)
				addChild(line);
				second[3].mouseEnabled = false;
			}
			if (first[counter] == first[1] && secondTarget == second[2])
			{
				checker++;
				bl = false;
				line = new Line(all, first[counter], secondTarget)
				addChild(line);
				second[2].mouseEnabled = false;
			}
			if (checker == 2)
			{
				counter++;
				roles();
				return;
			}
			
			if (first[counter] == first[2] && secondTarget == second[4])
			{
				checker++;
				bl = false;
				line = new Line(all, first[counter], secondTarget)
				addChild(line);
				if (checker == 1)
				{
					counter++;
					roles();
					return;
				}
			}
			
			if (first[counter] == first[3] && secondTarget == second[0])
			{
				checker++;
				bl = false;
				line = new Line(all, first[counter], secondTarget)
				addChild(line);
				if (checker == 1)
				{
					counter++;
					finish = "finish";
				}
			}
			
			if (finish == "finish")
			{
				sc.loadSound("correct.mp3", 1);
				sc.soundPlay();
				setTimeout(next, 2000)
			}
			
			if (bl)
			{
				sc.loadSound("error.mp3",1);
				sc.soundPlay();
			}
		}
		
		private function next():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"));
			destroy();
		}
		
		private function destroy():void
		{
			removeChild(all);
			all = null;
		}
	}

}
