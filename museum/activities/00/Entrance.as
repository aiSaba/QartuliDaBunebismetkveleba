package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.utils.setTimeout;
	import flash.events.DataEvent;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	
	public class Entrance extends MovieClip {
		
		private var entranceMc:MovieClip;
		private var dzveli:MovieClip;
		private var nivtebis:MovieClip;
		private var muzeumi:MovieClip;
		private var pipe:MovieClip;
		private var shoe:MovieClip;
		private var hummer:MovieClip;
		private var bowl:MovieClip;
		private var binocular:MovieClip;
		private var hat:MovieClip;
		private var roll:MovieClip;
		private var chest:MovieClip;
		private var shoes:MovieClip;
		private var music:MovieClip;
		private var gun:MovieClip;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		
		public function Entrance() 
		{
			
			addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true)	
		}
		
		private function init (ev:Event):void
		{
			if (stage)
			{
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
			}
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEntrance();
		}
		
		private function addEntrance():void
		{
			_stageHeight = stage.stageHeight;
			_stageWidth = stage.stageWidth;
			entranceMc = new EntranceMc() as MovieClip;
			entranceMc.leftColumn.alpha = 0;
			entranceMc.rightColumn.alpha = 0;
			entranceMc.roof.alpha = 0;
			entranceMc.height = _stageHeight/1.6;
			entranceMc.scaleX = entranceMc.scaleY;
			
			addChild(entranceMc);
			 
			entranceMc.alpha = 0;
			dzveli = entranceMc.roof.downRoof.dzveli;
			nivtebis = entranceMc.roof.downRoof.nivtebis;
			muzeumi = entranceMc.roof.downRoof.muzeumi;
			
			entranceMc.x = stage.stageWidth / 2;
			entranceMc.y = stage.stageHeight / 2;
		
			//movieclips
			pipe = entranceMc.allThings.pipe;
			shoe = entranceMc.allThings.shoe;
			hummer = entranceMc.allThings.hummer;
			bowl = entranceMc.allThings.bowl;
			binocular =  entranceMc.allThings.binocular;
			hat = entranceMc.allThings.hat;
			roll = entranceMc.allThings.roll;
			chest = entranceMc.allThings.chest;
			shoes =  entranceMc.allThings.shoes;
			music = entranceMc.allThings.music;
			gun = entranceMc.allThings.gun;
				
			addAllthings();
		}
		
		private function entranceMcAnimation():void
		{
		
			TweenMax.to(entranceMc.leftColumn, 0.3, { alpha:1 } );
			TweenMax.to(entranceMc.rightColumn, 0.3, { alpha:1 } );
			TweenMax.to(entranceMc.roof, 0.3, { alpha:1 } );
			
			var old_left_x:Number = entranceMc.leftColumn.x;
			var old_left_y:Number = entranceMc.leftColumn.y;
			TweenMax.fromTo (entranceMc.leftColumn, 2, { x:old_left_x, y:stage.stageWidth + entranceMc.leftColumn.height }, { x:old_left_x, y:old_left_y } );
			
			var old_right_x:Number = entranceMc.rightColumn.x;
			var old_right_y:Number = entranceMc.rightColumn.y;
			TweenMax.fromTo (entranceMc.rightColumn, 2, { x:old_right_x, y:stage.stageWidth + entranceMc.leftColumn.height }, { x:old_right_x, y:old_right_y } );
			
			var old_roof_x:Number = entranceMc.roof.x;
			var old_roof_y:Number = entranceMc.roof.y;
			TweenMax.fromTo (entranceMc.roof, 2, { x:old_roof_x, y: -stage.stageHeight - entranceMc.roof.height }, { x:old_roof_x, y:old_roof_y } );
			
			//TweenMax.to(entranceMc.allThings, 1, {scaleX:1, scaleY:1, ease:Back.easeOut});

			var old_nivtebis_x:Number = nivtebis.x;
			var old_nivtebis_y:Number = nivtebis.y;
			TweenMax.fromTo (nivtebis, 2.5, { x:stage.stageHeight + nivtebis.height, y:old_nivtebis_y }, { x:old_nivtebis_x, y:old_nivtebis_y , onComplete:wait } );			
			
			var old_dzveli_x:Number = dzveli.x;
			var old_dzveli_y:Number = dzveli.y;
			TweenMax.fromTo (dzveli, 2.5, { x: -stage.stageHeight - dzveli.height, y:old_dzveli_y }, { x:old_dzveli_x, y:old_dzveli_y } );			
			
			TweenMax.to(muzeumi, 1, { x:0, delay:1.5, paused:true } );
		}

		
		private function addAllthings():void
		{
			TweenMax.to(entranceMc, 0.3, { alpha:1 } );
			var old_pipe_x:Number = pipe.x;
			var old_pipe_y:Number = pipe.y;
			TweenMax.fromTo (pipe, 1.5, { x:old_pipe_x, y: -stage.stageHeight - pipe.height }, { x:old_pipe_x, y:old_pipe_y } );
			
			var old_shoe_x:Number = shoe.x;
			var old_shoe_y:Number = shoe.y;
			TweenMax.fromTo (shoe, 2.1, { x:old_shoe_x, y: -stage.stageHeight - shoe.height}, { x:old_shoe_x, y:old_shoe_y } );	
			
			var old_hummer_x:Number = hummer.x;
			var old_hummer_y:Number = hummer.y;
			TweenMax.fromTo (hummer, 1.3, { x:old_hummer_x, y: -stage.stageHeight - hummer.height }, { x:old_hummer_x, y:old_hummer_y } );
			
			var old_bowl_x:Number = bowl.x;
			var old_bowl_y:Number = bowl.y;
			TweenMax.fromTo (bowl, 1.0, { x:old_bowl_x, y: -stage.stageHeight - bowl.height }, { x:old_bowl_x, y:old_bowl_y } );
			
			var old_binocular_x:Number = binocular.x;
			var old_binocular_y:Number = binocular.y;
			TweenMax.fromTo (binocular, 1.1, { x:old_binocular_x, y: -stage.stageHeight - binocular.height }, { x:old_binocular_x, y:old_binocular_y } );
			
			var old_hat_x:Number = hat.x;
			var old_hat_y:Number = hat.y;
			TweenMax.fromTo (hat, 2.2, { x:old_hat_x, y: -stage.stageHeight - hat.height}, { x:old_hat_x, y:old_hat_y  , onComplete:entranceMcAnimation} );
			
			var old_roll_x:Number = roll.x;
			var old_roll_y:Number = roll.y;
			TweenMax.fromTo (roll, 1.9, { x:old_roll_x, y: -stage.stageHeight - roll.height}, { x:old_roll_x, y:old_roll_y } );
			
			var old_chest_x:Number = chest.x;
			var old_chest_y:Number = chest.y;
			TweenMax.fromTo (chest, 1.55, { x:old_chest_x, y: -stage.stageHeight - chest.height }, { x:old_chest_x, y:old_chest_y } );
			
			var old_shoes_x:Number = shoes.x;
			var old_shoes_y:Number = shoes.y;
			TweenMax.fromTo (shoes, 1.85, { x:old_shoes_x, y: -stage.stageHeight - shoes.height }, { x:old_shoes_x, y:old_shoes_y } );
			
			var old_music_x:Number = music.x;
			var old_music_y:Number = music.y;
			TweenMax.fromTo (music, 2.0, { x:old_music_x, y: -stage.stageHeight - music.height}, { x:old_music_x, y:old_music_y } );
			
			var old_gun_x:Number = gun.x;
			var old_gun_y:Number = gun.y;
			TweenMax.fromTo (gun, 1.8, { x:old_gun_x, y: -stage.stageHeight - gun.height }, { x:old_gun_x, y:old_gun_y } );
			
			
		}
		
		
		
		private function wait():void
		{
			setTimeout(end, 1000)
		}
		
		private function end():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame"));
			destroy();
		}
		
		private function destroy():void
		{
			
			TweenMax.killTweensOf(entranceMc.leftColumn);
			TweenMax.killTweensOf(entranceMc.rightColumn);
			TweenMax.killTweensOf(entranceMc);
			TweenMax.killTweensOf(entranceMc.roof);
			TweenMax.killTweensOf(nivtebis);
			TweenMax.killTweensOf(dzveli);
			TweenMax.killTweensOf(muzeumi);
			TweenMax.killTweensOf(pipe);
			TweenMax.killTweensOf(shoe);
			TweenMax.killTweensOf(hummer);
			TweenMax.killTweensOf(bowl);
			TweenMax.killTweensOf(binocular);
			TweenMax.killTweensOf(hat);
			TweenMax.killTweensOf(roll);
			TweenMax.killTweensOf(chest);
			TweenMax.killTweensOf(shoes);
			TweenMax.killTweensOf(music);
			TweenMax.killTweensOf(gun);
			if (entranceMc) 
			{
				removeChild(entranceMc)
				entranceMc=null;
			}
			
		}
	}
	
}
