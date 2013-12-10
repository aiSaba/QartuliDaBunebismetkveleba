/*
human : human_MC
	figure : humanFigure_MC
	shadows : humanShadows_MC
		shadow0 : humanShadow0_MC 
		shadow1 : humanShadow1_MC
		shadow2 : humanShadow2_MC
		shadow3 : humanShadow3_MC
		shadow4 : humanShadow4_MC


house : house_MC
	figure : houseFigure_MC
	shadows : houseShadows_MC
		shadow0 : houseShadow0_MC 
		shadow1 : houseShadow1_MC
		shadow2 : houseShadow2_MC
		shadow3 : houseShadow3_MC
		shadow4 : houseShadow4_MC

tree : tree_MC
	figure : treeFigure_MC
	shadows : treeShadows_MC
		shadow0 : treeShadow0_MC 
		shadow1 : treeShadow1_MC
		shadow2 : treeShadow2_MC
		shadow3 : treeShadow3_MC
		shadow4 : treeShadow4_MC


cat : cat_MC
	figure : catFigure_MC
	shadows : catShadows_MC
		shadow0 : catShadow0_MC 
		shadow1 : catShadow1_MC
		shadow2 : catShadow2_MC
		shadow3 : catShadow3_MC
		shadow4 : catShadow4_MC



chair : dog_MC
	figure : dogFigure_MC
	shadows : dogShadows_MC
		shadow0 : dogShadow0_MC 
		shadow1 : dogShadow1_MC
		shadow2 : dogShadow2_MC
		shadow3 : dogShadow3_MC
		shadow4 : dogShadow4_MC


chair : chair_MC
	figure : chairFigure_MC
	shadows : chairShadows_MC
		shadow0 : chairShadow0_MC 
		shadow1 : chairShadow1_MC
		shadow2 : chairShadow2_MC
		shadow3 : chairShadow3_MC
		shadow4 : chairShadow4_MC


*/
package  {
	import flash.display.MovieClip;

	public class Thing {
		private var m_this:MovieClip;
		private var m_figure:MovieClip;
		private var m_shadows:Array;
		private var m_activeShadowIndex:int;
		
		public function Thing(thing:MovieClip){
			m_this = thing;
			m_figure = m_this.figure;
			m_shadows = [
				m_this.shadows.shadow0,
				m_this.shadows.shadow1,
				m_this.shadows.shadow2,
				m_this.shadows.shadow3,
				m_this.shadows.shadow4
			];
			m_activeShadowIndex = 0;
			hide();
		}
		
		public function hide():void {
			m_figure.alpha = 0;
			for(var i = 0; i<m_shadows.length;i++ ){
				m_shadows[i].alpha=0;
			}
		}
		
		public function show(shadowIndex:int):void{
			m_figure.alpha = 100;
			m_activeShadowIndex = shadowIndex;
			m_shadows[m_activeShadowIndex].alpha=100;
		}
		
		public function shadowAt(pos:int):MovieClip{
			return m_shadows[pos];
		}


		private function changeSunPosition(position:int):void{
			m_shadows[m_activeShadowIndex].alpha=0;
			m_activeShadowIndex = position;
			m_shadows[m_activeShadowIndex].alpha=100;

		}













	}
}