package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_2607:int;
      
      private var var_310:RoomEventViewCtrl;
      
      private var var_232:Timer;
      
      private var var_159:RoomSettingsCtrl;
      
      private var var_231:RoomThumbnailCtrl;
      
      private var var_1013:TagRenderer;
      
      private var var_269:IWindowContainer;
      
      private var var_457:IWindowContainer;
      
      private var var_677:IWindowContainer;
      
      private var var_2283:IWindowContainer;
      
      private var var_2282:IWindowContainer;
      
      private var var_1289:IWindowContainer;
      
      private var var_905:ITextWindow;
      
      private var var_1050:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_832:ITextWindow;
      
      private var var_1290:ITextWindow;
      
      private var var_1048:ITextWindow;
      
      private var var_833:ITextWindow;
      
      private var var_1646:ITextWindow;
      
      private var var_233:IWindowContainer;
      
      private var var_831:IWindowContainer;
      
      private var var_1642:IWindowContainer;
      
      private var var_2008:ITextWindow;
      
      private var var_676:ITextWindow;
      
      private var _rateButton:IContainerButtonWindow;
      
      private var var_1288:IContainerButtonWindow;
      
      private var var_1284:IContainerButtonWindow;
      
      private var var_1291:IContainerButtonWindow;
      
      private var var_1286:IContainerButtonWindow;
      
      private var var_1287:IContainerButtonWindow;
      
      private var var_1643:IButtonWindow;
      
      private var var_1644:IButtonWindow;
      
      private var var_1645:IButtonWindow;
      
      private var var_830:IWindowContainer;
      
      private var var_1285:ITextWindow;
      
      private var var_1049:ITextFieldWindow;
      
      private var var_63:IWindowContainer;
      
      private var var_1047:IButtonWindow;
      
      private var var_834:IButtonWindow;
      
      private var var_2285:String;
      
      private var var_2284:String;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_310 = new RoomEventViewCtrl(this._navigator);
         this.var_159 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_231 = new RoomThumbnailCtrl(this._navigator);
         this.var_1013 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_159);
         this.var_232 = new Timer(6000,1);
         this.var_232.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.removeEventListener(HabboToolbarSetIconEvent.const_98,this.onToolbarIconState);
         }
         if(this.var_232)
         {
            this.var_232.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_232.reset();
            this.var_232 = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_232.reset();
         this.var_310.active = true;
         this.var_159.active = false;
         this.var_231.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_232.reset();
         this.var_159.load(param1);
         this.var_159.active = true;
         this.var_310.active = false;
         this.var_231.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_159.active = true;
         this.var_310.active = false;
         this.var_231.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_232.reset();
         this.var_159.active = false;
         this.var_310.active = false;
         this.var_231.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_924,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_232.reset();
         this.var_310.active = false;
         this.var_159.active = false;
         this.var_231.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(this._navigator.data.enteredGuestRoom.flatId);
         }
         this.refresh();
         this._window.visible = true;
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_49,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         this._window.parent.activate();
         this._window.activate();
         if(!param1)
         {
            this.var_232.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_232.reset();
         this.var_310.active = false;
         this.var_159.active = false;
         this.var_231.active = false;
         this.refresh();
         if(!this._window.visible)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_49,HabboToolbarIconEnum.ROOMINFO,this._window,false));
            this._window.parent.activate();
         }
         else
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_444,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info","buttons_container"],0,2);
         this._window.height = Util.getLowestPoint(this._window);
         this._window.y = this._window.desktop.height - this._window.height - 5;
         Logger.log("MAIN: " + this.var_269.rectangle + ", " + this.var_233.rectangle + ", " + this._window.rectangle);
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_269);
         this.var_269.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_159.refresh(this.var_269);
         this.var_231.refresh(this.var_269);
         Util.moveChildrenToColumn(this.var_269,["room_details","room_buttons"],0,2);
         this.var_269.height = Util.getLowestPoint(this.var_269);
         this.var_269.visible = true;
         Logger.log("XORP: " + this.var_457.visible + ", " + this.var_1289.visible + ", " + this.var_677.visible + ", " + this.var_677.rectangle + ", " + this.var_269.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_233);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_310.refresh(this.var_233);
         if(Util.hasVisibleChildren(this.var_233) && !(this.var_159.active || this.var_231.active))
         {
            Util.moveChildrenToColumn(this.var_233,["event_details","event_buttons"],0,2);
            this.var_233.height = Util.getLowestPoint(this.var_233);
            this.var_233.visible = true;
         }
         else
         {
            this.var_233.visible = false;
         }
         Logger.log("EVENT: " + this.var_233.visible + ", " + this.var_233.rectangle);
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","false") == "HabboWindowManagerCom_habbo_window_alert_xml";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_159.active && !this.var_231.active && !this.var_310.active)
         {
            this.var_830.visible = true;
            this.var_1049.text = this.getEmbedData();
         }
         else
         {
            this.var_830.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this.var_63)
         {
            return;
         }
         if(this.var_159.active)
         {
            this.var_63.visible = false;
            return;
         }
         this.var_63.visible = true;
         if(this.var_1047)
         {
            if(this.var_2285 == "exit_homeroom")
            {
               this.var_1047.caption = "${navigator.homeroom}";
            }
            else
            {
               this.var_1047.caption = "${navigator.hotelview}";
            }
         }
         if(this.var_834)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_834.visible = _loc1_;
            if(this.var_2284 == "0")
            {
               this.var_834.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_834.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_159.active || this.var_231.active)
         {
            return;
         }
         this.var_905.text = param1.roomName;
         this.var_905.height = this.var_905.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_832.text = param1.description;
         this.var_1013.refreshTags(this.var_457,param1.tags);
         this.var_832.visible = false;
         if(param1.description != "")
         {
            this.var_832.height = this.var_832.textHeight + 5;
            this.var_832.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1288,"facebook_logo_small",_loc3_,null,0);
         this.var_1288.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this._rateButton,"thumb_up",_loc4_,null,0);
         this._rateButton.visible = _loc4_;
         this.var_833.visible = !_loc4_;
         this.var_1646.visible = !_loc4_;
         this.var_1646.text = "" + this._navigator.data.currentRoomRating;
         this._navigator.refreshButton(this.var_457,"home",param2,null,0);
         this._navigator.refreshButton(this.var_457,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_457,["room_name","owner_name_cont","tags","room_desc","rating_cont"],this.var_905.y,0);
         this.var_457.visible = true;
         this.var_457.height = Util.getLowestPoint(this.var_457);
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_159.active || this.var_231.active)
         {
            return;
         }
         this.var_1050.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_1050.height = this.var_1050.textHeight + 5;
         this.var_1290.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1290.height = this.var_1290.textHeight + 5;
         Util.moveChildrenToColumn(this.var_677,["public_space_name","public_space_desc"],this.var_1050.y,0);
         this.var_677.visible = true;
         this.var_677.height = Math.max(86,Util.getLowestPoint(this.var_677));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_310.active)
         {
            return;
         }
         this.var_2008.text = param1.eventName;
         this.var_676.text = param1.eventDescription;
         this.var_1013.refreshTags(this.var_831,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_676.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_676.height = this.var_676.textHeight + 5;
            this.var_676.y = Util.getLowestPoint(this.var_831) + 2;
            this.var_676.visible = true;
         }
         this.var_831.visible = true;
         this.var_831.height = Util.getLowestPoint(this.var_831);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_159.active || this.var_231.active)
         {
            return;
         }
         this.var_1643.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1284.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this.var_1291.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1286.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1287.visible = this._navigator.data.canEditRoomSettings && param1;
         this.var_1289.visible = Util.hasVisibleChildren(this.var_1289);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_310.active)
         {
            return;
         }
         this.var_1644.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1645.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1642.visible = Util.hasVisibleChildren(this.var_1642);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details"));
         this._window.setParamFlag(HabboWindowParam.const_59,false);
         this._window.setParamFlag(HabboWindowParam.const_1315,true);
         this._window.visible = false;
         this.var_269 = IWindowContainer(this.find("room_info"));
         this.var_457 = IWindowContainer(this.find("room_details"));
         this.var_677 = IWindowContainer(this.find("public_space_details"));
         this.var_2283 = IWindowContainer(this.find("owner_name_cont"));
         this.var_2282 = IWindowContainer(this.find("rating_cont"));
         this.var_1289 = IWindowContainer(this.find("room_buttons"));
         this.var_905 = ITextWindow(this.find("room_name"));
         this.var_1050 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_832 = ITextWindow(this.find("room_desc"));
         this.var_1290 = ITextWindow(this.find("public_space_desc"));
         this.var_1048 = ITextWindow(this.find("owner_caption"));
         this.var_833 = ITextWindow(this.find("rating_caption"));
         this.var_1646 = ITextWindow(this.find("rating_txt"));
         this.var_233 = IWindowContainer(this.find("event_info"));
         this.var_831 = IWindowContainer(this.find("event_details"));
         this.var_1642 = IWindowContainer(this.find("event_buttons"));
         this.var_2008 = ITextWindow(this.find("event_name"));
         this.var_676 = ITextWindow(this.find("event_desc"));
         this.var_1288 = IContainerButtonWindow(this.find("facebook_like_button"));
         this._rateButton = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_1284 = IContainerButtonWindow(this.find("add_favourite_button"));
         this.var_1291 = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1286 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1287 = IContainerButtonWindow(this.find("unmake_home_button"));
         this.var_1643 = IButtonWindow(this.find("room_settings_button"));
         this.var_1644 = IButtonWindow(this.find("create_event_button"));
         this.var_1645 = IButtonWindow(this.find("edit_event_button"));
         this.var_830 = IWindowContainer(this.find("embed_info"));
         this.var_1285 = ITextWindow(this.find("embed_info_txt"));
         this.var_1049 = ITextFieldWindow(this.find("embed_src_txt"));
         this.var_63 = IWindowContainer(this.find("buttons_container"));
         this.var_1047 = IButtonWindow(this.find("exit_room_button"));
         this.var_834 = IButtonWindow(this.find("zoom_button"));
         Util.setProcDirectly(this.var_1284,this.onAddFavouriteClick);
         Util.setProcDirectly(this.var_1291,this.onRemoveFavouriteClick);
         Util.setProcDirectly(this.var_1643,this.onRoomSettingsClick);
         Util.setProcDirectly(this.var_1286,this.onMakeHomeClick);
         Util.setProcDirectly(this.var_1287,this.onUnmakeHomeClick);
         Util.setProcDirectly(this.var_1644,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1645,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1049,this.onEmbedSrcClick);
         Util.setProcDirectly(this._rateButton,this.onThumbUp);
         Util.setProcDirectly(this.var_1288,this.onFacebookLike);
         Util.setProcDirectly(this.var_834,this.onZoomClick);
         Util.setProcDirectly(this.var_1047,this.onExitRoomClick);
         this._navigator.refreshButton(this.var_1284,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1291,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1286,"home",true,null,0);
         this._navigator.refreshButton(this.var_1287,"home",true,null,0);
         this._window.findChildByName("close").procedure = this.onCloseButtonClick;
         Util.setProcDirectly(this.var_269,this.onHover);
         Util.setProcDirectly(this.var_233,this.onHover);
         this.var_1048.width = this.var_1048.textWidth;
         Util.moveChildrenToRow(this.var_2283,["owner_caption","owner_name"],this.var_1048.x,this.var_1048.y,3);
         this.var_833.width = this.var_833.textWidth;
         Util.moveChildrenToRow(this.var_2282,["rating_caption","rating_txt"],this.var_833.x,this.var_833.y,3);
         this.var_1285.height = this.var_1285.textHeight + 5;
         Util.moveChildrenToColumn(this.var_830,["embed_info_txt","embed_src_txt"],this.var_1285.y,2);
         this.var_830.height = Util.getLowestPoint(this.var_830) + 5;
         this.var_2607 = this._window.y + this._window.height;
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!this._navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function onFacebookLike(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_1049.setSelection(0,this.var_1049.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_39);
         _loc3_.iconId = HabboToolbarIconEnum.ZOOM;
         _loc3_.iconName = "ZOOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onExitRoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_39);
         _loc3_.iconId = HabboToolbarIconEnum.EXITROOM;
         _loc3_.iconName = "EXITROOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onToolbarIconState(param1:HabboToolbarSetIconEvent) : void
      {
         if(param1.type != HabboToolbarSetIconEvent.const_98)
         {
            return;
         }
         switch(param1.iconId)
         {
            case HabboToolbarIconEnum.ZOOM:
               this.var_2284 = param1.iconState;
               this.refreshButtons();
               break;
            case HabboToolbarIconEnum.EXITROOM:
               this.var_2285 = param1.iconState;
               this.refreshButtons();
         }
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         this.var_232.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_444,HabboToolbarIconEnum.ROOMINFO,this._window,false));
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
      
      public function registerToolbarEvents() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.addEventListener(HabboToolbarSetIconEvent.const_98,this.onToolbarIconState);
         }
      }
   }
}
