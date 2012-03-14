"Vim syntax file
"Language: @wiki
"----
hi link Blue Comment
hi link Green Identifier
hi link Purple PreProc

hi link BrownB Statement
hi link GreenB Type

hi link PinkW Constant
hi link PurpleW Special

hi link PurpleU Underlined
hi link Clear Ignore
hi link FRed Error
hi link FYellow Todo

"----

syntax keyword Green hyper

syntax keyword Green BGCOLOR COLOR SIZE LEFT CENTER RIGHT

"syntax region PurpleW start=+\(^\|[^\\]\)(+hs=s+1 skip=+\\)+ end=+)+
"syntax region String start=+{+ skip=+\\}+ end=+}+
"syntax region String start=+"+ skip=+\\"+ end=+"+

"link
"todo : > URLだけ色を変えるようにする
syntax region Underlined start=+\[\[+ skip=+\\"+ end=+\]\]+

syntax match Purple /#\|&\|:/
"comment
syntax match Comment /\/\/.*/

"table
syntax match BrownB /|\~|\||<|\||/

"index
syntax match GreenB /^\*.*/
syntax match BrownB /^-/
syntax match BrownB /^+/

syntax match PurpleW /^ .*/hs=s+1
syntax match PinkW /^----$/

"color
syntax keyword PinkW aliceblue antiquewhite aqua cyan aquamarine azure beige bisque black blanchedalmond blue blueviolet brown burlywood cadetblue chartreuse chocolate coral cornflowerblue cornsilk crimson cyan aqua darkblue darkcyan darkgoldenrod darkgray darkgreen darkmagenta darkolivegreen darkorange darkorchid darkred darksalmon darkseagreen darkslateblue darkslategray darkturquoise darkviolet deeppink deepskyblue dimgray dodgerblue firebrick floralwhite forestgreen fuchsia magenta gainsboro ghostwhite gold goldenrod gray green greenyellow honeydew hotpink indianred indigo ivory khaki lavender lavenderblush lawngreen lemonchiffon lightblue lightcoral lightcyan lightgoldenrodyellow lightgreen lightgrey lightpink lightsalmon lightseagreen lightskyblue lightslategray lightsteelblue lightyellow lime limegreen linen magenta fuchsia maroon mediumaquamarine mediumblue mediumorchid mediumpurple mediumseagreen mediumslateblue mediumspringgreen mediumturquoise mediumvioletred midnightblue mistyrose moccasin navajowhite navy oldlace olive olivedrab orange orangered orchid palegoldenrod palegreen paleturquoise palevioletred papayawhip peachpuff peru pink plum powderblue purple red rosybrown royalblue saddlebrown salmon sandybrown seagreen seashell sienna silver skyblue slateblue slategray snow springgreen steelblue tan teal thistle tomato turquoise violet wheat white whitesmoke yellow yellowgreen black navy darkblue mediumblue blue darkgreen green teal darkcyan deepskyblue darkturquoise mediumspringgreen lime springgreen aqua cyan cyan aqua midnightblue dodgerblue lightseagreen forestgreen seagreen darkslategray limegreen mediumseagreen turquoise royalblue steelblue darkslateblue mediumturquoise indigo darkolivegreen cadetblue cornflowerblue slateblue mediumaquamarine dimgray olivedrab slategray lightslategray mediumslateblue lawngreen chartreuse aquamarine maroon purple olive gray skyblue lightskyblue blueviolet darkred darkmagenta saddlebrown darkseagreen lightgreen mediumpurple darkviolet palegreen darkorchid yellowgreen sienna brown darkgray lightblue greenyellow paleturquoise lightsteelblue powderblue firebrick darkgoldenrod mediumorchid rosybrown silver mediumvioletred indianred peru chocolate tan lightgrey thistle orchid goldenrod palevioletred crimson gainsboro plum burlywood lightcyan lavender darksalmon violet palegoldenrod lightcoral khaki aliceblue honeydew azure sandybrown wheat beige whitesmoke ghostwhite salmon antiquewhite linen lightgoldenrodyellow oldlace red fuchsia magenta magenta fuchsia deeppink orangered tomato hotpink coral darkorange lightsalmon orange lightpink pink gold peachpuff navajowhite moccasin bisque mistyrose blanchedalmond papayawhip lavenderblush seashell cornsilk lemonchiffon floralwhite snow yellow lightyellow ivory white

"plugin
syntax keyword Purple logined_mes region endregion exkp exk exp include_by_search link_editmenu2 link_editmenu recent_child recent_page_ref recent_ref memox this_page this_url pc mobile link_up pulldown_jump link_nourl topicpath navi link_upload furigana memo link_diff link_trackback forward link_forward back link_back link_rss link_tag link_backup link_ref link_edit tags tags_list new new2 new3 newimage list_read_only list_write_only list_by_search list_by_tag list_by_tagsearch taglist_by_search tag_cloud contents contents_line popular recent ref_list related trackback include include_cache splitinclude include_random list_newcreated ls lsd ls2 ls3 ls_line yetlist

"plugin
syntax keyword Purple areaedit tab t footnote sup sub s i small big strong tt table_edit address expand divclass cite q blockquote mark_reg mark_copy nowiki nolink underline u underdot javascript js co flash marquee space nbsp spanclass clear highlight codehighlight tex hr br asciiart aa font bgcolor strike right left center bold b nobold color html html2 include inc italic size sizex ruby div divid spanid spanstyle style divstyle math

"plugin
syntax keyword Purple link link2 blanklink anchor aname link_anchor link_aname mailto link_mail tel link_tel link_toppage link_newpage link_chmod link_chkind link_pagelist link_contact link_contributor link_parent link_path link_rss_tag link_rss_new link_pdf autolink linklist random random2 back link_close close homepage favorite link_atwiki link_atpedia link_wikipedia

"plugin
syntax keyword Purple twitter_widget_profile technorati bf blogsearch blogsearch2 showrss feedreader news gnews

"plugin
syntax keyword Purple newpage loginform mailform search serach2 search3 tagsearch tagsearch2 google comment comment_num comment_num2 pcomment vote vote2 vote3 tvote archive archive_log paint paintbbs irc

"plugin
syntax keyword Purple image ref blankimg random_img simpleapi_img lightbox pixiv

"plugin
syntax keyword Purple bgsound mp3blestar seeqpod

"plugin
syntax keyword Statement nicovideo2 gametrailers zoome mainichi_video sharkle jumpcut dogalog raguun minakuru_video peevee volumeone im_vlog myflux flipclip metacafe revver yahoo_video nifty_video lycosmix yahoo_videocast cliplife truveo myspacetv watchme ustream dailymotion eyevio amebavision askvideo veoh guba stage6 video googlevideo nicovideo_com nicovideo_mylist nicovideo youtube u2b jimakuin mncast

"plugin
syntax keyword Statement fclock date time update last_modified lastmod now today calendar counter count_members hatena_b_counter countdown countup

"plugin
syntax keyword Statement bookmark_yahoo bookmark_hatena bookmark_delicious bookmark_livedoor bookmark_nifty bookmark_fc2 bookmark_sphere bookmark_blinklist bookmark_tailrank bookmark_blogmarks bookmark_live bookmark_netscape bookmark_newsvine bookmark_pingking bookmark_magnolia bookmark_choix bookmark_newsing bookmark_digg bookmark_furl bookmark_technorati bookmark_buzzurl bookmark_pookmark bookmark_saaf bookmark_blogpeople_tags bookmark_blogpeople favorite homepage

"plugin
syntax keyword Statement amazon amazon2

"plugin
syntax keyword Statement atfb_icon atfb_hitokoto atfb_diary atfb_bbs atfb_bbs_list

"plugin
syntax keyword Statement thatsping nouken blogpet harbot twitter_badge twitter_badge_timeline twitter_badge_text flickr_badge mikunano mikunyano fullmiku dancing_miku science_and_you

"plugin
syntax keyword Statement flipbook_in online nifty_timeline wikiname wikiurl googlegadgets gg server google_calendar google_calendar_viewer img_slide include_js tumblr tooltip seibun link_reload reload count_pages slideshare icq gaugeset gauge chizuz googlemaps googlespreadsheets google_spsheet googlebooks count_childpages listbox hiduke setpagename settitle meta_description meta_keywords skype skype_status redirect nomenu nomenu2 setmenu setmenu2 arrow hatena_star presen qr alpslab_base alpslab_slide alpslab_video alpslab_route treemenu treemenu2 openclose openclose2 facebook_act facebook_coment facebook_like facebook_facepile facebook_live

"plugin
syntax keyword Statement border
