package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1535:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_182:MsgWithRequestId;
      
      private var var_591:RoomEventData;
      
      private var var_2441:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      private var var_2331:int;
      
      private var var_240:GuestRoomData;
      
      private var var_881:PublicRoomShortData;
      
      private var var_2438:int;
      
      private var var_2442:Boolean;
      
      private var var_2436:int;
      
      private var var_2440:Boolean;
      
      private var var_1747:int;
      
      private var var_2444:Boolean;
      
      private var var_1340:Array;
      
      private var var_1341:Array;
      
      private var var_2439:int;
      
      private var var_1339:int;
      
      private var _favouriteIds:Dictionary;
      
      private var var_1096:Boolean;
      
      private var var_2437:int;
      
      private var var_2443:int = 0;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         this.var_1340 = new Array();
         this.var_1341 = new Array();
         this._favouriteIds = new Dictionary();
         super();
         this._navigator = param1;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return this.var_240 != null && !this._currentRoomOwner;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return this.var_240 != null && this._currentRoomOwner;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         this.var_881 = null;
         this.var_240 = null;
         this._currentRoomOwner = false;
         if(param1.guestRoom)
         {
            this._currentRoomOwner = param1.owner;
         }
         else
         {
            this.var_881 = param1.publicSpace;
            this.var_591 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(this.var_591 != null)
         {
            this.var_591.dispose();
            this.var_591 = null;
         }
         if(this.var_881 != null)
         {
            this.var_881.dispose();
            this.var_881 = null;
         }
         if(this.var_240 != null)
         {
            this.var_240.dispose();
            this.var_240 = null;
         }
         this._currentRoomOwner = false;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(this.var_240 != null)
         {
            this.var_240.dispose();
         }
         this.var_240 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(this.var_591 != null)
         {
            this.var_591.dispose();
         }
         this.var_591 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return this.var_182 != null && this.var_182 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return this.var_182 != null && this.var_182 as GuestRoomSearchResultData != null;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return this.var_182 != null && this.var_182 as OfficialRoomsData != null;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         this.disposeCurrentMsg();
         this.var_182 = param1;
         this.var_1096 = false;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         this.disposeCurrentMsg();
         this.var_182 = param1;
         this.var_1096 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         this.disposeCurrentMsg();
         this.var_182 = param1;
         this.var_1096 = false;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(this.var_182 == null)
         {
            return;
         }
         this.var_182.dispose();
         this.var_182 = null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return this.var_182 as GuestRoomSearchResultData;
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return this.var_182 as PopularRoomTagsData;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return this.var_182 as OfficialRoomsData;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return this.var_591;
      }
      
      public function get avatarId() : int
      {
         return this.var_2331;
      }
      
      public function get eventMod() : Boolean
      {
         return this.var_2441;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return this._currentRoomOwner;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return this.var_240;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return this.var_881;
      }
      
      public function get hcMember() : Boolean
      {
         return this.var_2442;
      }
      
      public function get createdFlatId() : int
      {
         return this.var_2436;
      }
      
      public function get homeRoomId() : int
      {
         return this.var_1747;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return this.var_2440;
      }
      
      public function get currentRoomRating() : int
      {
         return this.var_2437;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return this.var_2438;
      }
      
      public function get settingsReceived() : Boolean
      {
         return this.var_2444;
      }
      
      public function get adIndex() : int
      {
         return this.var_2443;
      }
      
      public function set avatarId(param1:int) : void
      {
         this.var_2331 = param1;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         this.var_2436 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         this.var_2442 = param1;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         this.var_2441 = param1;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         this.var_2440 = param1;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         this.var_1747 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         this.var_2437 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         this.var_2438 = param1;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         this.var_2444 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         this.var_2443 = param1;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         this.var_1340 = param1;
         this.var_1341 = new Array();
         for each(_loc2_ in this.var_1340)
         {
            if(_loc2_.visible)
            {
               this.var_1341.push(_loc2_);
            }
         }
      }
      
      public function get allCategories() : Array
      {
         return this.var_1340;
      }
      
      public function get visibleCategories() : Array
      {
         return this.var_1341;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2439 = param1.limit;
         this.var_1339 = param1.favouriteRoomIds.length;
         this._favouriteIds = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this._favouriteIds[_loc2_] = "yes";
         }
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         this._favouriteIds[param1] = !!param2 ? "yes" : null;
         this.var_1339 += !!param2 ? 1 : -1;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = this.var_240.flatId;
         return this._favouriteIds[_loc1_] != null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(this.var_240 == null)
         {
            return false;
         }
         var _loc1_:int = this.var_240.flatId;
         return this.var_1747 == _loc1_;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return this._favouriteIds[param1] != null;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return this.var_1339 >= this.var_2439;
      }
      
      public function startLoading() : void
      {
         this.var_1096 = true;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_1096;
      }
   }
}
