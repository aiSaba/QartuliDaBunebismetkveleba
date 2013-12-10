package  {

	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.utils.*;
import flash.events.TimerEvent;
	
	import com.greensock.*; 
	import com.greensock.easing.*;

	public class shadowExam extends ResponsiveScene {
		
		private var m_sunPlaces:Array;
		private var m_sunPosition:int;
		private var m_things:Array;
		private var m_thingIndex:int;
		private var m_win:Boolean;
		private var tryCounter:int;

		public function shadowExam(){
			m_scene = zgarbi;
			tryCounter = 0;
		}
		
		override public function onReady():void {
			stop();
			var zgarbiSound:Sound = new Sound(new URLRequest("sounds/27.mp3")); 
			zgarbiSound.play();
			
			resizeHandler(null);
			setTimeout(onReady2, 2800);
		}
		
		 public function onReady2():void {
			 dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"));
			  nextFrame();
			 m_scene = scene;
			resizeHandler(null);
			trace("onReady");
			setSunPlaces();
			setThings();
			restart();
		}

 
 
		private function restart():void{
			m_win = false;
			m_scene.sun.visible = false;
			setShadowToGuess();
		}

 
		private function setSunPlaces():void{
			m_sunPlaces = [ m_scene.sunPlaces.place0,
							m_scene.sunPlaces.place1,
							m_scene.sunPlaces.place2,
							m_scene.sunPlaces.place3,
							m_scene.sunPlaces.place4];
			for(var  i = 0; i < m_sunPlaces.length; i++ )
				m_sunPlaces[i].addEventListener(MouseEvent.CLICK, onSunPlaceClickListener)			
		}

		private function setThings():void{
			m_things = [new Thing(m_scene.human),
						new Thing(m_scene.house),
						new Thing(m_scene.dog),
						new Thing(m_scene.tree),
						new Thing(m_scene.cat)];
		}

		function randRange(min:Number, max:Number):Number {
		    var randomNum:Number = Math.floor(Math.random() * (max - min)) + min;
		    return randomNum;
		}
 
		private function setShadowToGuess():void {
			tryCounter++;
			if (tryCounter == 6)
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleFalse"));
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame"));
				return;
			}
			m_sunPosition = randRange(0,m_sunPlaces.length);
			setActiveThing(randRange(0,m_things.length))
		}
		
		private function playSound(value:Boolean=true):void
		{
			var wSound:String = (value)?"correct.mp3":"error.mp3";
			var sound:Sound = new Sound(new URLRequest("sounds/"+wSound)); 
			sound.play();
		}

 
		private function setActiveThing(index:int):void{
			m_things[m_thingIndex].hide();
			m_thingIndex = index;
			m_things[m_thingIndex].show(m_sunPosition);
			m_things[m_thingIndex].shadowAt(m_sunPosition).alpha = 100;
			TweenMax.to(m_things[m_thingIndex].shadowAt(m_sunPosition),0.01,{autoAlpha:1}); 
		}


		private function onSunPlaceClickListener(event:Event):void {
			if(m_win) return;
			var position:int;
			switch(event.currentTarget.name){
				case "place0": position = 0; break;
				case "place1": position = 1; break;
				case "place2": position = 2; break;
				case "place3": position = 3; break;
				case "place4": position = 4; break;
			}
			if ( position == m_sunPosition ) {
				playSound(true)
				m_win = true;
				m_scene.sun.visible = true;
				m_scene.sun.x = m_sunPlaces[m_sunPosition].x + m_scene.sunPlaces.x;
				m_scene.sun.y = m_sunPlaces[m_sunPosition].y + m_scene.sunPlaces.y;
				for( var i = 0; i < m_sunPlaces.length; i++ ){
					m_sunPlaces[i].filters = [];
				}
				setTimeout(restart, 2000);
			}else {
				playSound(false)
				var dropShadow:DropShadowFilter = new DropShadowFilter(0, 0, 0xff0000, 1, 10, 10, 2, 2, false, false, false);
				m_sunPlaces[position].filters = [dropShadow];
			}
		}

	}
	
}
