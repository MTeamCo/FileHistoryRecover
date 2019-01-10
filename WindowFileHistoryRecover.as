package
{
	import flash.display.Sprite;
	import flash.filesystem.File;
	
	public class WindowFileHistoryRecover extends Sprite
	{
		public function WindowFileHistoryRecover()
		{
			super();
			
			var fil:File = new File('D:\\Sepehr\\Ghadamshomar');
			renameFiles(fil);
			trace("Done");
		}
		
		private function renameFiles(fil:File):void
		{
			if(fil.isDirectory)
			{
				var files:Array = fil.getDirectoryListing() ;
				trace("Sub files : "+files);
				for(var i:int = 0 ; i<files.length ; i++)
				{
					renameFiles(files[i] as File);
				}
			}
			else
			{
				var firstName:String = fil.name ;
				var newName:String = fil.name.replace(/\s?\([\d]{4}_[\d]{2}_[\d]{2}\s[\d]{2}_[\d]{2}_[\d]{2}\sUTC\)\s?/,'') ;
				trace(firstName+" > "+newName);
				if(firstName!=newName)
				{
					var file2:File = fil.parent.resolvePath(newName);
					fil.copyTo(file2,true);
					fil.deleteFile();
					trace("File deleted");
				}
			}
		}
	}
}