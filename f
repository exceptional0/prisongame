:root {
	--transparencycolor:			0,0,0;
	--transparencyalpha:			0.15;
	--messagetransparency:			0.5;
	--usechatbubbles: 				calc(var(--messagetransparency) / (var(--messagetransparency) + 0.00000000000000000000001));
	--guildchanneltransparency:		0.15;
	--chatinputtransparency:		0.0;
	--memberlisttransparency:		0.0;
	
	--font:							Whitney, Helvetica Neue, Helvetica, Arial, sans-serif;
	--textshadow:					transparent;
	
	--accentcolor:					190,78,180;
	--accentcolor2:					var(--accentcolor);
	--mentioncolor:					var(--accentcolor);
	--linkcolor:					var(--accentcolor);
	
	--successcolor: 				59,165,92;
	--warningcolor: 				250,166,26;
	--dangercolor: 					237,66,69;
	
	--textbrightest: 				255,255,255;
	--textbrighter: 				222,222,222;
	--textbright: 					200,200,200;
	--textdark: 					160,160,160;
	--textdarker: 					125,125,125;
	--textdarkest: 					90,90,90;
	
	--background:					url(https://mwittrien.github.io/BetterDiscordAddons/Themes/BasicBackground/_res/background.jpg);
	--backgroundposition:			center;
	--backgroundsize:				cover;
	--backgroundblur:				unset;
	
	--popout:						var(--background);
	--popoutposition:				var(--backgroundposition);
	--popoutsize:					var(--backgroundsize);
	--popoutblur:					var(--backgroundblur);
	
	--backdrop:						rgba(0,0,0,0.85);
	--backdropposition:				center;
	--backdropsize:					cover;
	--backdropblur:					unset;
	
	--bdfdb-green:					rgb(var(--successcolor));
	--bdfdb-yellow:					rgb(var(--warningcolor));
	--bdfdb-red:					rgb(var(--dangercolor));
}

.theme-light, .theme-dark {
	--text-positive: rgb(var(--successcolor));
	--text-warning: rgb(var(--warningcolor));
	--text-danger: rgb(var(--dangercolor));
	--info-positive-background: rgba(var(--successcolor),.1);
	--info-positive-foreground: rgb(var(--successcolor));
	--info-positive-text: #fff;
	--info-warning-background: rgba(var(--warningcolor),.1);
	--info-warning-foreground: rgb(var(--warningcolor));
	--info-warning-text: #fff;
	--info-danger-background: rgba(var(--dangercolor),.1);
	--info-danger-foreground: rgb(var(--dangercolor));
	--info-danger-text: #fff;
	--status-positive-background: rgb(var(--successcolor));
	--status-positive-text: #fff;
	--status-warning-background: rgb(var(--warningcolor));
	--status-warning-text: #fff;
	--status-danger-background: rgb(var(--dangercolor));
	--status-danger-text: #fff;
	--header-primary: rgb(var(--textbrightest));
	--header-secondary: rgb(var(--textbright));
	--text-normal: rgb(var(--textbrighter));
	--text-muted: rgb(var(--textdarker));
	--channels-default: rgb(var(--textdark));
	--interactive-normal: rgb(var(--textbright));
	--interactive-hover: rgb(var(--textbrighter));
	--interactive-active: rgb(var(--textbrightest));
	--interactive-muted: rgb(var(--textdarkest));
	--logo-primary: rgb(var(--textbrightest));
	--background-accent: rgba(var(--transparencycolor), .1);
	--background-primary: rgba(var(--transparencycolor), .2);
	--background-secondary: rgba(var(--transparencycolor), .3);
	--background-secondary-alt: rgba(var(--transparencycolor), .35);
	--background-tertiary: rgba(var(--transparencycolor), .4);
	--background-floating: rgba(var(--transparencycolor), .5);
	--background-modifier-accent: rgba(var(--textbrightest),.1);
	--elevation-low: 0 1px 5px 0 rgba(var(--transparencycolor), .3);
	--elevation-high: 0 2px 10px 0 rgba(var(--transparencycolor), .3);
	--font-primary: var(--font) !important;
	--font-display: var(--font) !important;
}

html {
	color: var(--header-primary);
}


/* ~~~~		0.		TABLE OF CONTENTS				~~~~ */
/*
	1.	TRANSPARENCY
	2.	BACKGROUND
	3.	TITLEBAR
	4.	GUILDLIST
	5.	CHANNELLIST
		1.	GUILDHEADER
		2.	CHANNELS
		3.	DMCHANNELS
		4.	ACCOUNT/VOICE/GOLIVE
	6.	CHAT
		1.	CHANNELHEADER
		2.	MESSAGES
			1.	MESSAGE
			2.	EMBEDS
			3.	NITROGIFT
			4.	INVITE
		3.	TEXTAREA
		4.	AUTOCOMPLETEMENU
		5.	MEMBERLIST
		6.	SEARCHPAGE
		7.	THREADS
		8.	CALL
		9.	UNAVAILABLESCREEN
	7.	PEOPLES
	8.	STORE/NITRO
	9.	LIBRARY
	10.	DISCOVERY/UNIHUB
	11.	USERSETTINGS
	12.	GUILDSETTINGS
	13.	MODALS
		1.	USERMODAL
		2.	GUILDADD/CREATION
		3.	REGIONSELECTMODAL
		4.	UPLOADMODAL
		5.	KEYBOARDSHORTCUTSMODAL
		6.	QUICKSWITCHER
		7.	INVITEMODAL/GROUPCREATE
		8.	LOGINSCREEN
		9.	TERMACCEPTMODAL
		10.	DOWNLOADAPPMODAL
		11.	GUILDBOOSTMODAL
		12.	REACTIONSMODAL
		13.	GUILDTEMPLATEMODAL
		14.	GUILDWELCOMEMODAL
		15.	GUILDRULESMODAL
		16.	GUILDFEEDBACKMODAL
		17.	SCREENSHAREMODAL
		18.	PHONEVERIFICATIONMODAL
		19.	NOTIFICATIONSMODAL
		20.	DISCOVERYENTRYMODAL
		21.	NITROFEATUREMODAL
	14.	POPOUTS
		1.	CONTEXTMENU
		2.	USERPOPOUT
		3.	EMOJIPICKER
		4.	PINS/MENTIONS
		5.	SEARCHPOPOUT
		6.	COLORPICKER
		7.	ADDROLE
		8.	EVERYONEMENTION
		9.	CHANNELFOLLOW
		10.	CHANNELFOLLOWINFO
		11.	EMOJIINFO
		12.	STREAMPREVIEW
		13.	STREAMINFO
		14.	PUBLICGUILDANNOUNCEMENT
		15.	RTCSTATUSPOPOUT
		16.	PHONE-/EMAILVALIDATION
		17.	QUICKSELECTPOPOUT
		18.	WARNINGPOPOUT
		19.	ACTIVETHREADLISTPOPOUT
	15.	GENERAL
		1.	TEXT
		2.	BUTTONS
		3.	INPUTS
		4.	SEARCHBARS
		5.	TAGS
		6.	ICONS
		7.	SCROLLBARS
		8.	NOTIFICATIONBAR
		9.	TOOLTIPS
	16.	BDSUPPORT
	17.	POWERCORDSUPPORT
	18.	PLUGINSUPPORT
		1.	BDFDB
		2.	DATEVIEWER
		3.	MEMBERCOUNT
		4.	LINENUMBERS
		5.	PERMISSIONVIEWER
		6.	DIRECTDOWNLOAD
		7.	BETTERFORMATINGREDUX
		8.	CHANNELHISTORY
		9.	CHANNELTABS
		10.	TYPINGINDICATOR
		11.	BADGESEVERYWHERE
	19.	UPDATENOTICE
	20.	WATERMARK
*/


/* ~~~~		1.		TRANSPARENCY					~~~~ */

body,														/* body														*/
#app-mount .app-1q1i1E,										/* app					container							*/
#app-mount .app-2rEoOp,										/* app					inner								*/
#app-mount .loading-Ags1CY,									/* app					i18n loading						*/
#app-mount .wrapper-1prNyd,									/* app					errorscreen							*/
#app-mount .bg-h5JY_x,										/* app					background							*/
#app-mount .layer-3QrUeG,									/* layer				container							*/
#app-mount .container-2wlB3z,									/* layer				container							*/
#app-mount .container-3w7J-x,								/* channels				inner								*/
#app-mount .privateChannels-1nO12o,							/* dmchannels												*/
#app-mount .panels-j1Uci_ > *,								/* account/voice		inner								*/
#app-mount .chat-3bRxxu,									/* chat					container							*/
#app-mount .threadSidebar-1o3BTy,							/* chat					thread sidebar						*/
#app-mount .wrapper-3vR61M,									/* chat					messages loading					*/
#app-mount .noChannel-Z1DQK7,								/* nochannel												*/
#app-mount .members-1998pB,									/* members													*/
#app-mount .members-1998pB > div,							/* members				content								*/
#app-mount .content-MLh4nU,									/* unavailable												*/
#app-mount .container-1D34oG,								/* peoples				old									*/
#app-mount .container-2cd8Mz,								/* peoples													*/
#app-mount .container-lRFx4q,								/* peoples				activity list						*/
#app-mount .applicationStore-1pNvnv,						/* nitro													*/
#app-mount .pageWrapper-1PgVDX,								/* guilddiscovery											*/
#app-mount .pageWrapper-1x6lGh,								/* unihub													*/
#app-mount .scrollerBase-289Jih,							/* scroller													*/
#app-mount .scroller-2FKFPG,								/* scroller old												*/
#app-mount .standardSidebarView-3F1I7i,						/* settings													*/
#app-mount .contentRegion-3nDuYy {							/* settings				content								*/
	background: transparent;
}

#app-mount .scroller-2ZPeAD {								/* peoples				activity scroller					*/
	border: none;
}

#app-mount .sidebarRegion-VFTUkN,							/* settings				sidebar								*/
#app-mount .sidebar-_0OpfR {								/* sidebarlist			sidebar								*/
	background-color: rgba(var(--transparencycolor), calc(0.2 * (var(--transparencyalpha) / (var(--transparencyalpha) + 0.00000000000000000000001))));
}

#app-mount {												/* app-mount												*/
	background-color: rgba(var(--transparencycolor), var(--transparencyalpha));
}
#app-mount .wrapper-3NnKdC {								/* guilds				container							*/
	background-color: rgba(var(--transparencycolor), calc(var(--guildchanneltransparency) * 2));
}
#app-mount .sidebar-2K8pFh {								/* channels				container							*/
	background-color: rgba(var(--transparencycolor), var(--guildchanneltransparency));
}
#app-mount .panels-j1Uci_ {									/* account/voice		container							*/
	background-color: rgba(var(--transparencycolor), calc(var(--guildchanneltransparency) / 1.5));
}
#app-mount .container-1r6BKw.themed-ANHk51 {				/* channelheader		container							*/
	background-color: rgba(var(--transparencycolor), var(--guildchanneltransparency));
}
#app-mount .membersWrap-2h-GB4 {							/* members				container							*/
	background-color: rgba(var(--transparencycolor), var(--memberlisttransparency));
}
#app-mount .tabBar-fg4VK9 {									/* members				tabbar								*/
	background-color: rgba(var(--transparencycolor), var(--memberlisttransparency));
}
#app-mount .nowPlayingColumn-2sl4cE {						/* peoples				now playing							*/
	background-color: rgba(var(--transparencycolor), var(--memberlisttransparency));
}

#app-mount .image-3zK3Wt {									/* app					errorscreen image					*/
	background-image: url(https://discord.com/assets/e9baf4b505eb54129f832556ea16538e.svg);
	opacity: 0.6;
}


/* ~~~~		2.		BACKGROUND						~~~~ */

body::before,
body::after {
	content: "";
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	pointer-events: none;
	z-index: -1;
}
body::before {
	background: var(--background) var(--backgroundposition)/var(--backgroundsize);
}
body::after {
	backdrop-filter: blur(var(--backgroundblur));
}
.layer-3QrUeG {
	z-index: 1000;
}
.container-16j22k::before,
.layer-3QrUeG ~ .layer-3QrUeG::before,
.root-3R2ngo::before,
.container-16j22k::after,
.layer-3QrUeG ~ .layer-3QrUeG::after,
.root-3R2ngo::after {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	pointer-events: none;
	z-index: -1;
}
.container-16j22k::before,
.layer-3QrUeG ~ .layer-3QrUeG::before,
.root-3R2ngo::before {
	background: var(--background) var(--backgroundposition)/var(--backgroundsize);
	background-attachment: fixed;
}
.container-16j22k::after,
.layer-3QrUeG ~ .layer-3QrUeG::after,
.root-3R2ngo::after {
	background-color: rgba(var(--transparencycolor), var(--transparencyalpha));
	backdrop-filter: blur(var(--backgroundblur));
}
.uploadArea-3QgLtW,
.backdrop-29yll0,
.backdrop-1wrmKB {
	background: transparent !important;
	opacity: 1 !important;
	animation: none !important;
}
.uploadArea-3QgLtW::before,
.backdrop-29yll0::before,
.backdrop-1wrmKB::before,
.uploadArea-3QgLtW::after,
.backdrop-29yll0::after,
.backdrop-1wrmKB::after {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	pointer-events: none;
	z-index: -2;
}
.uploadArea-3QgLtW::before,
.backdrop-29yll0::before,
.backdrop-1wrmKB::before {
	background: var(--backdrop) var(--backdropposition)/var(--backdropsize);
	background-attachment: fixed;
}
.uploadArea-3QgLtW::after,
.backdrop-29yll0::after,
.backdrop-1wrmKB::after {
	backdrop-filter: blur(var(--backdropblur));
}
.withLayer-RoELSG {
	z-index: -1;
}
