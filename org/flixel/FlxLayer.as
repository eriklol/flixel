package org.flixel
{
	//@desc		This is an organizational class that can update and render a bunch of FlxCore objects
	public class FlxLayer extends FlxCore
	{
		protected var _children:Array;

		//@desc		Constructor		
		virtual public function FlxLayer()
		{
			_children = new Array();
		}
		
		//@desc		Adds a new FlxCore subclass (FlxSprite, FlxBlock, etc) to the list of children
		//@param	Core	The object you want to add
		virtual public function add(Core:FlxCore):FlxCore
		{
			_children.push(Core);
			return Core;
		}
		
		//@desc		Automatically goes through and calls update on everything you added, override this function to handle custom input and perform collisions
		override public function update():void
		{
			super.update();
			var cl:uint = _children.length;
			for(var i:uint = 0; i < cl; i++)
				if((_children[i] != null) && _children[i].exists && _children[i].active) _children[i].update();
		}
		
		//@desc		Automatically goes through and calls render on everything you added, override this loop to do crazy graphical stuffs I guess?
		override public function render():void
		{
			super.render();
			var cl:uint = _children.length;
			for(var i:uint = 0; i < cl; i++)
				if((_children[i] != null) && _children[i].exists && _children[i].visible) _children[i].render();
		}
		
		//@desc		Override this function to handle any deleting or "shutdown" type operations you might need (such as removing traditional Flash children like Sprite objects)
		public function destroy():void { _children.length = 0; }
		
		//@desc		Returns the array of children
		public function children():Array { return _children; }
	}
}
