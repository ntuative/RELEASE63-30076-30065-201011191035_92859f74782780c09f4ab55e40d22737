package com.sulake.core.utils
{
   import com.sulake.core.Core;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   import flash.display.DisplayObject;
   import flash.display.FrameLabel;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class LibraryLoader extends EventDispatcher implements IDisposable
   {
      
      protected static const const_1486:uint = 1;
      
      protected static const const_1489:uint = 2;
      
      protected static const const_1488:uint = 4;
      
      protected static const const_1487:uint = 3;
      
      protected static const name_2:uint = 7;
      
      public static const const_1375:int = 5;
      
      public static const LIBRARY_LOADER_FINALIZE:String = "LIBRARY_LOADER_FINALIZE";
       
      
      protected var var_38:Loader;
      
      protected var var_17:LoaderContext;
      
      protected var var_337:int = 0;
      
      protected var var_247:URLRequest;
      
      protected var var_662:XML;
      
      protected var var_546:Class;
      
      protected var var_490:uint = 0;
      
      protected var _name:String;
      
      protected var var_1141:Boolean = false;
      
      protected var var_612:Boolean = false;
      
      protected var var_914:Boolean = false;
      
      protected var var_2568:String = "";
      
      protected var var_2566:String = "";
      
      protected var var_1844:int;
      
      protected var var_1140:int;
      
      protected var var_1139:int;
      
      protected var var_2657:uint = 0;
      
      protected var var_2567:Boolean = true;
      
      public function LibraryLoader(param1:LoaderContext = null, param2:Boolean = false, param3:Boolean = false)
      {
         if(param1 == null)
         {
            this.var_17 = new LoaderContext();
            this.var_17.applicationDomain = ApplicationDomain.currentDomain;
         }
         else
         {
            this.var_17 = param1;
         }
         this.var_914 = param2;
         this.var_612 = param3;
         this.var_337 = 0;
         this.var_38 = new Loader();
         this.var_38.contentLoaderInfo.addEventListener(Event.INIT,this.loadEventHandler);
         this.var_38.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadEventHandler);
         this.var_38.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.loadEventHandler);
         this.var_38.contentLoaderInfo.addEventListener(Event.UNLOAD,this.loadEventHandler);
         this.var_38.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,this.loadEventHandler);
         this.var_38.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.loadEventHandler);
         this.var_38.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.loadEventHandler);
         super();
      }
      
      protected static function parseNameFromUrl(param1:String) : String
      {
         var _loc2_:int = 0;
         _loc2_ = param1.indexOf("?",0);
         if(_loc2_ > -1)
         {
            param1 = param1.slice(0,_loc2_);
         }
         _loc2_ = param1.lastIndexOf(".");
         if(_loc2_ > -1)
         {
            param1 = param1.slice(0,_loc2_);
         }
         _loc2_ = param1.lastIndexOf("/");
         if(_loc2_ > -1)
         {
            param1 = param1.slice(_loc2_ + 1,param1.length);
         }
         return param1;
      }
      
      public function get url() : String
      {
         return !!this.var_247 ? this.var_247.url : null;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get ready() : Boolean
      {
         return this.var_1141;
      }
      
      public function get status() : int
      {
         return this.var_337;
      }
      
      public function get domain() : ApplicationDomain
      {
         return this.var_38.contentLoaderInfo.applicationDomain;
      }
      
      public function get request() : URLRequest
      {
         return this.var_247;
      }
      
      public function get resource() : Class
      {
         return this.var_546;
      }
      
      public function get manifest() : XML
      {
         return this.var_662;
      }
      
      public function get bytesTotal() : uint
      {
         return this.var_38.contentLoaderInfo.bytesTotal;
      }
      
      public function get bytesLoaded() : uint
      {
         return this.var_38.contentLoaderInfo.bytesLoaded;
      }
      
      public function get elapsedTime() : uint
      {
         return !!this.var_1141 ? uint(this.var_1140 - this.var_1844) : uint(getTimer() - this.var_1844);
      }
      
      public function get paused() : Boolean
      {
         return this.var_914;
      }
      
      protected function get content() : DisplayObject
      {
         return this.var_38.content;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DISPOSE,this.var_337,this.bytesTotal,this.bytesLoaded,this.elapsedTime));
            try
            {
               this.var_38.close();
            }
            catch(e:Error)
            {
            }
            try
            {
               this.var_38.unload();
            }
            catch(e:Error)
            {
            }
            this.var_38 = null;
            this.var_17 = null;
            this.var_546 = null;
            this.var_662 = null;
            super.dispose();
         }
      }
      
      public function load(param1:URLRequest, param2:int = 5) : void
      {
         this.var_1141 = false;
         this.var_247 = param1;
         this.var_1139 = param2;
         ErrorReportStorage.addDebugData("Library url","Library url " + param1.url);
         this._name = parseNameFromUrl(this.var_247.url);
         ErrorReportStorage.addDebugData("Library name","Library name " + this._name);
         if(!this.var_914)
         {
            this.var_914 = true;
            this.resume();
         }
      }
      
      public function resume() : void
      {
         if(this.var_914 && !_disposed)
         {
            this.var_914 = false;
            if(!this.var_1141 && this.var_247)
            {
               this.var_1140 = -1;
               this.var_1844 = getTimer();
               this.var_38.load(this.var_247,this.var_17);
            }
         }
      }
      
      public function hasDefinition(param1:String) : Boolean
      {
         var name:String = param1;
         try
         {
            return this.var_38.contentLoaderInfo.applicationDomain.hasDefinition(name);
         }
         catch(e:Error)
         {
            return false;
         }
      }
      
      public function getDefinition(param1:String) : Object
      {
         var name:String = param1;
         try
         {
            if(this.var_38.contentLoaderInfo.applicationDomain.hasDefinition(name))
            {
               return this.var_38.contentLoaderInfo.applicationDomain.getDefinition(name);
            }
         }
         catch(e:Error)
         {
         }
         return null;
      }
      
      protected function loadEventHandler(param1:Event) : void
      {
         var _loc2_:* = null;
         switch(param1.type)
         {
            case Event.INIT:
               this.debug("Load event INIT for file \"" + this.url + "\"");
               this.var_490 |= 0;
               break;
            case Event.COMPLETE:
               this.debug("Load event COMPLETE for file \"" + this.url + "\"");
               this.var_490 |= 0;
               break;
            case Event.ENTER_FRAME:
               break;
            case HTTPStatusEvent.HTTP_STATUS:
               this.var_337 = HTTPStatusEvent(param1).status;
               this.debug("Load event STATUS " + this.var_337 + " for file \"" + this.url + "\"");
               break;
            case Event.UNLOAD:
               this.debug("Load event UNLOAD for file \"" + this.url + "\"");
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_UNLOAD,this.var_337,this.bytesTotal,this.bytesLoaded,this.elapsedTime));
               break;
            case ProgressEvent.PROGRESS:
               this.debug("Load event PROGRESS for file \"" + this.url + "\"");
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,this.var_337,this.bytesTotal,this.bytesLoaded,this.elapsedTime));
               break;
            case IOErrorEvent.IO_ERROR:
               this.debug("Load event IO ERROR for file \"" + this.url + "\"");
               if(!this.handleHttpStatus(this.var_337))
               {
                  this.var_1140 = getTimer();
                  this.failure("IO Error, send or load operation failed for file \"" + this.url + "\"");
                  this.removeEventListeners();
               }
               break;
            case SecurityErrorEvent.SECURITY_ERROR:
               this.var_1140 = getTimer();
               this.failure("Security Error, security violation with file \"" + this.url + "\"");
               this.removeEventListeners();
               break;
            case TimerEvent.TIMER:
               _loc2_ = TimerEvent(param1).target as Timer;
               _loc2_.removeEventListener(TimerEvent.TIMER,this.loadEventHandler);
               _loc2_.stop();
               if(!_disposed)
               {
                  this.var_490 = LibraryLoader.name_2;
                  this.loadEventHandler(new Event(Event.COMPLETE));
               }
               return;
            default:
               Logger.log("LibraryLoader::loadEventHandler(" + param1 + ")");
         }
         if(this.var_490 == LibraryLoader.const_1487)
         {
            if(this.analyzeLibrary())
            {
               this.var_490 |= 0;
            }
         }
         if(this.var_490 == LibraryLoader.name_2)
         {
            this.var_1141 = true;
            this.var_1140 = getTimer();
            this.prepareLibrary();
            this.removeEventListeners();
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,this.var_337,this.bytesTotal,this.bytesLoaded,this.elapsedTime));
            dispatchEvent(new Event(LIBRARY_LOADER_FINALIZE));
         }
      }
      
      protected function analyzeLibrary() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         this.debug("Analyzing library \"" + this._name + "\", content " + (this.content is MovieClip ? "is" : "is not") + " a MovieClip");
         this.debug("\tBytes loaded: " + this.var_38.contentLoaderInfo.bytesLoaded + "/" + this.var_38.contentLoaderInfo.bytesTotal);
         if(this.content is MovieClip)
         {
            _loc1_ = this.content as MovieClip;
            _loc3_ = _loc1_.currentLabels;
            this.debug("\tLibrary \"" + this._name + "\" is in frame " + _loc1_.currentFrame + "(" + _loc1_.currentLabel + ")");
            if(_loc3_.length > 1)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  _loc2_ = _loc3_[_loc4_] as FrameLabel;
                  if(_loc2_.name == this._name)
                  {
                     if(_loc2_.frame != _loc1_.currentFrame)
                     {
                        _loc1_.addEventListener(Event.ENTER_FRAME,this.loadEventHandler);
                        return false;
                     }
                  }
                  _loc4_++;
               }
            }
         }
         return true;
      }
      
      protected function prepareLibrary() : void
      {
         var xmlClass:Class = null;
         this.debug("Preparing library \"" + this._name + "\"");
         this.var_546 = this.getDefinition(this._name) as Class;
         if(this.var_546 == null)
         {
            this.failure("Failed to find resource class \"" + this._name + "\" in library " + this.var_247.url + "!");
            return;
         }
         try
         {
            xmlClass = this.var_546.manifest as Class;
            if(xmlClass == null)
            {
               return;
            }
         }
         catch(e:Error)
         {
            failure("Failed to find embedded manifest.xml in library undefined!");
            return;
         }
         var bytes:ByteArray = new xmlClass() as ByteArray;
         try
         {
            this.var_662 = new XML(bytes.readUTFBytes(bytes.length));
         }
         catch(e:Error)
         {
            throw new Error("Failed to extract manifest.xml from library " + _name + "!\n" + e.message);
         }
      }
      
      protected function handleHttpStatus(param1:int) : Boolean
      {
         var statusCode:int = param1;
         if(statusCode == 0 || statusCode >= 400)
         {
            if(this.var_1139 > 0)
            {
               try
               {
                  this.var_38.close();
                  this.var_38.unload();
               }
               catch(e:Error)
               {
               }
               this.addRequestCounterToUrlRequest(this.var_247,const_1375 - this.var_1139);
               if(this.var_2567)
               {
                  this.var_247.requestHeaders.push(new URLRequestHeader("pragma","no-cache"));
                  this.var_247.requestHeaders.push(new URLRequestHeader("Cache-Control","no-cache"));
                  this.var_2567 = false;
               }
               this.var_38.load(this.var_247,this.var_17);
               --this.var_1139;
               return true;
            }
            this.failure("HTTP Error " + statusCode + " \"" + this.var_38.contentLoaderInfo.url + "\"");
            this.removeEventListeners();
         }
         return false;
      }
      
      protected function addRequestCounterToUrlRequest(param1:URLRequest, param2:int) : void
      {
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         var _loc11_:* = null;
         if(param1.url == null || param1.url == "")
         {
            return;
         }
         var _loc3_:Array = param1.url.split("?");
         var _loc4_:String = _loc3_[0];
         var _loc5_:String = "";
         if(_loc3_.length > 1)
         {
            _loc5_ = _loc3_[1];
         }
         var _loc7_:Array = _loc5_.split("&");
         _loc9_ = 0;
         while(_loc9_ < _loc7_.length)
         {
            _loc11_ = _loc7_[_loc9_];
            if(_loc11_.indexOf("counterparameter=") >= 0)
            {
               _loc11_ = "counterparameter=" + param2.toString();
               _loc7_[_loc9_] = _loc11_;
               _loc8_ = true;
            }
            _loc9_++;
         }
         if(!_loc8_)
         {
            _loc7_.push("counterparameter=" + param2);
         }
         var _loc10_:String = _loc4_;
         _loc9_ = 0;
         while(_loc9_ < _loc7_.length)
         {
            if(_loc9_ == 0)
            {
               _loc10_ = _loc10_ + "?" + _loc7_[_loc9_];
            }
            else
            {
               _loc10_ = _loc10_ + "&" + _loc7_[_loc9_];
            }
            _loc9_++;
         }
         param1.url = _loc10_;
      }
      
      protected function removeEventListeners() : void
      {
         if(this.var_38)
         {
            if(this.var_38.content != null)
            {
               this.var_38.content.removeEventListener(Event.ENTER_FRAME,this.loadEventHandler);
            }
            this.var_38.contentLoaderInfo.removeEventListener(Event.INIT,this.loadEventHandler);
            this.var_38.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.loadEventHandler);
            this.var_38.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,this.loadEventHandler);
            this.var_38.contentLoaderInfo.removeEventListener(Event.UNLOAD,this.loadEventHandler);
            this.var_38.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS,this.loadEventHandler);
            this.var_38.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.loadEventHandler);
            this.var_38.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.loadEventHandler);
         }
      }
      
      protected function debug(param1:String) : void
      {
         Core.warning(param1);
         this.var_2566 = param1;
         if(this.var_612)
         {
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DEBUG,this.var_337,this.bytesTotal,this.bytesLoaded,this.elapsedTime));
         }
      }
      
      protected function failure(param1:String) : void
      {
         Core.warning(param1);
         this.var_2568 = param1;
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,this.var_337,this.bytesTotal,this.bytesLoaded,this.elapsedTime));
         dispatchEvent(new Event(LIBRARY_LOADER_FINALIZE));
      }
      
      public function getLastDebugMessage() : String
      {
         return this.var_2566;
      }
      
      public function getLastErrorMessage() : String
      {
         return this.var_2568;
      }
   }
}
