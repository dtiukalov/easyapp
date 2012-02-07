<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>TimeLine</TITLE>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<%@ include file="/app/pep/include/header.jsp"%>

	<SCRIPT type=text/javascript>
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-13163340-4' ]);
		_gaq.push([ '_trackPageview' ]);
	
		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</SCRIPT>
	
	<META name=GENERATOR content="MSHTML 8.00.7600.16891">
</HEAD>
<BODY>
	<DIV id=console></DIV>
	<DIV id=tl-container>
		<DIV class="tl-data tl-data-userId"></DIV>
		<DIV class="tl-data tl-data-secret-userId"></DIV>
		<DIV id=tl-image-preloader>
			<IMG alt="" src="<%=request.getContextPath()%>/app/js/timeline/black-opacity-95.png"> <IMG alt=""
				src="<%=request.getContextPath()%>/app/js/timeline/Day_of_Anger_marchers_in_street.jpg">
		</DIV>
		<DIV class=tl-timeline-info>
			<H2>With inspiring bravery and determination, the people of the
				Middle East are demanding to have their voices heard. We record the
				key events in their hopefully successful journey to democracy in
				this interactive multimedia timeline.</H2>
			<P class=tl-ah-about-text>You can navigate the timeline by
				dragging the viewfinder at the bottom of the timeline. You can also
				click anywhere in the time scale at the bottom to jump quickly to
				that point in time. ;xNLx;;xNLx;We have categorised events by
				country. Each country has its own colour: sky blue for Tunisia, red
				for Egypt, pink for Libya and orange for Bahrain. For further
				information (including videos and images) about a particular event,
				click the 'more' button.;xNLx;;xNLx;The information for this
				timeline has been obtained from numerous sources, including Al
				Jazeera, Wikipedia, Flickr and YouTube. Copyright over the images
				and videos on this timeline belongs with their respective owners.</P>
		</DIV>
		<DIV id=tl-stage-holder>
			<!--<img src="<%=request.getContextPath()%>/app/js/timeline/assets/ui/empty-image2.gif" alt="" id="tl-stage-image" />-->
			<DIV id=tl-stage-main-photo-credit></DIV>
			<DIV id=tl-stage-scale-blackener></DIV>
			<DIV class=tl-stage></DIV>
			<DIV class=tl-stage-fixed-position-content></DIV>
			<DIV id=tl-stage-date-displayer></DIV>
			<DIV class=tl-stage-border-top></DIV>
			<DIV class=tl-stage-border-bottom></DIV>
			<DIV class=tl-main-intro-block>
				<DIV class=tl-mib-inner>
					<DIV class=tl-mib-image-holder>
						<IMG src="<%=request.getContextPath()%>/app/js/timeline/empty-image.gif">

						<DIV class=tl-mib-image-mask>
							<SPAN></SPAN>
						</DIV>
					</DIV>
					<H3 class=tl-mib-headline></H3>
					<DIV class=tl-mib-content>
						<P></P>
					</DIV>
				</DIV>
			</DIV>
		</DIV>
		<DIV id=tl-slider-holder>
			<DIV id=tl-slider-scale-holder>
				<DIV id=tl-slider-scale>
					<CANVAS class=tl-scale-canvas height="52" width="5000"></CANVAS>
					<DIV id=tl-slider-scale-times-holder></DIV>
					<DIV id=tl-slider-markers-holder></DIV>
				</DIV>
			</DIV>
			<DIV id=tl-slider-dragger>
				<DIV class=tlsd-inner>
					<DIV class=tlsd-inner-inner>
						<DIV class="tlsd-corner tlsd-c-tl"></DIV>
						<DIV class="tlsd-corner tlsd-c-tr"></DIV>
						<DIV class="tlsd-corner tlsd-c-bl"></DIV>
						<DIV class="tlsd-corner tlsd-c-br"></DIV>
					</DIV>
				</DIV>
			</DIV>
		</DIV>
		<DIV id=tl-footer></DIV>

		<DIV id=tl-content-holder class=tl-main-content-block-holder>
			<DIV class=tl-mc-fade></DIV>
			<DIV class=tl-main-content-block>
				<DIV class=tl-mc-top-right>
					<DIV class=tl-mc-top-left>
						<DIV class=tl-mc-content>
							<DIV class=tl-mc-content-images-and-text>
								<DIV class=tl-ch-top-content>
									<UL class=tl-ch-media-list>
										<LI class=tl-ch-selected rel="images"><A
											href="http://www.tiki-toki.com/timeline/entry/55/The-Fight-for-Democracy-in-the-Middle-East/#"><EM>Images</EM>
												(<SPAN>7</SPAN>)</A></LI>
										<LI rel="videos"><A
											href="http://www.tiki-toki.com/timeline/entry/55/The-Fight-for-Democracy-in-the-Middle-East/#"><EM>Videos</EM>
												(<SPAN>2</SPAN>)</A></LI>
										<LI rel="audio"><A
											href="http://www.tiki-toki.com/timeline/entry/55/The-Fight-for-Democracy-in-the-Middle-East/#"><EM>Audio</EM>
												(<SPAN>1</SPAN>)</A></LI>
									</UL>
									<A class=tl-ch-close-content
										href="http://www.tiki-toki.com/timeline/entry/55/The-Fight-for-Democracy-in-the-Middle-East/#">Close</A>

									<H5 class=tl-ch-panel-date-display>10th August 2010</H5>
								</DIV>
								<DIV class="tl-ch-content-block tl-ch-gallery-block">
									<DIV class="tl-gallery ak-gallery">
										<DIV class="tl-g-main-content ak-gallery-stage-holder">
											<DIV class=ak-gallery-image-storage></DIV>
											<DIV class="tl-g-main-stage ak-gallery-stage"></DIV>
											<DIV class=tl-g-content-mask>
												<DIV class=tl-g-content-mask-inner></DIV>
												<DIV class=tl-g-gallery-controls>
													<A class=tl-g-gallery-control-left
														href="http://www.tiki-toki.com/timeline/entry/55/The-Fight-for-Democracy-in-the-Middle-East/#"></A><A
														class=tl-g-gallery-control-right
														href="http://www.tiki-toki.com/timeline/entry/55/The-Fight-for-Democracy-in-the-Middle-East/#"></A>
												</DIV>
											</DIV>
										</DIV>
										<DIV class=tl-g-thumb-holder>
											<DIV class=tl-g-thumb-stage></DIV>
											<A class=tl-g-thumb-control-left
												href="http://www.tiki-toki.com/timeline/entry/55/The-Fight-for-Democracy-in-the-Middle-East/#"></A><A
												class=tl-g-thumb-control-right
												href="http://www.tiki-toki.com/timeline/entry/55/The-Fight-for-Democracy-in-the-Middle-East/#"></A>
										</DIV>
									</DIV>
									<!-- /tl-gallery -->
								</DIV>
								<DIV class="tl-ch-content-block tl-ch-content-block-text">
									<DIV class="tl-ch-content-block-inner ajk-content-scroller">
										<DIV class="tl-ch-content-intro-block ajk-cs-carousel">
											<DIV class=ajk-cs-carousel-stage>
												<H3></H3>
												<P class=tl-ch-standfirst></P>
												<P class=tl-ch-author>By Alex</P>
												<DIV class=tl-ch-extra-info-text></DIV>
												<A
													class="tl-ch-full-story-link rt-button-medium rt-button-medium-long"
													href="http://www.tiki-toki.com/timeline/entry/55/The-Fight-for-Democracy-in-the-Middle-East/#"
													target=_top>Read full story</A>
											</DIV>
											<DIV class=ajk-cs-carousel-scroll-holder>
												<A class=ajk-cs-up-arrow
													href="http://www.tiki-toki.com/timeline/entry/55/The-Fight-for-Democracy-in-the-Middle-East/#"></A><A
													class=ajk-cs-down-arrow
													href="http://www.tiki-toki.com/timeline/entry/55/The-Fight-for-Democracy-in-the-Middle-East/#"></A>
												<DIV class=ajk-cs-scroll-bar>
													<SPAN></SPAN>
												</DIV>
											</DIV>
										</DIV>
									</DIV>
								</DIV>
							</DIV>
							<DIV class=tl-ch-video-content>
								<DIV class=tl-ch-vc-inner></DIV>
							</DIV>
						</DIV>
					</DIV>
				</DIV>
				<DIV class=tl-mc-bottom-right>
					<DIV class=tl-mc-bottom-left>
						<DIV class=tl-mc-footer-content>
							<DIV class="tl-ch-bc-inner tl-ch-next-prev-story">
								<P class=tl-ch-selected-story-num>x1 of x2 stories</P>
								<A class=tl-ch-prev-story
									href="http://www.tiki-toki.com/timeline/entry/55/The-Fight-for-Democracy-in-the-Middle-East/#"></A><A
									class=tl-ch-next-story
									href="http://www.tiki-toki.com/timeline/entry/55/The-Fight-for-Democracy-in-the-Middle-East/#"></A>
							</DIV>
							<A class="tl-ch-close-video rt-button-3 rt-button-3-long"
								href="http://www.tiki-toki.com/timeline/entry/55/The-Fight-for-Democracy-in-the-Middle-East/#">Close
								video</A> <A id=tl-ch-start-timeline-button
								class="tl-ch-start-timeline rt-button-3"
								href="http://www.tiki-toki.com/timeline/entry/55/The-Fight-for-Democracy-in-the-Middle-East/#">Continue</A>
						</DIV>
					</DIV>
				</DIV>
			</DIV>
		</DIV>
	</DIV>
	<SCRIPT type=text/javascript>
		var TLTimelineData = {
			host : "www.tiki-toki.com",
			homePage : false,
			showAdBlock : "false",
			id : 55,
			title : "The Fight for Democracy in the Middle East",
			urlFriendlyTitle : "The-Fight-for-Democracy-in-the-Middle-East",
			startDate : "2010-12-17 00:00:00",
			endDate : "2011-02-23 20:04:32",
			introText : "With inspiring bravery and determination, the people of the Middle East are demanding to have their voices heard. We record the key events in their hopefully successful journey to democracy in this interactive multimedia timeline.",
			introImage : "http://upload.wikimedia.org/wikipedia/commons/c/c5/Day_of_Anger_marchers_in_street.jpg",
			authorName : "Alex Kearns",
			backgroundImage : "http://farm6.static.flickr.com/5051/5452904725_90d7e0eea9_b.jpg",
			introImageCredit : "",
			backgroundImageCredit : "Photo credit: <a href=\"http://www.flickr.com/people/32834977@N03/\">Al Jazeera English</a>",
			feed : "",
			mainColour : "ED0003",
			zoom : "month-medium-day",
			initialFocus : "first",
			embedHash : "9085373548",
			embed : "false",
			secret : "false",
			public : "yes",
			dontDisplayIntroPanel : 0,
			openReadMoreLinks : 0,
			storyDateStatus : 0,
			storySpacing : 0,
			viewType : 0,
			showTitleBlock : 1,
			backgroundColour : "1a1a1a",
			storyDateFormat : "auto",
			topDateFormat : "auto",
			sliderDateFormat : "auto",
			language : "english",
			displayStripes : 1,
			htmlFormatting : 0,
			sliderBackgroundColour : "000000",
			sliderTextColour : "808080",
			sliderDetailsColour : "282828",
			sliderDraggerColour : "808080",
			headerBackgroundColour : "000000",
			headerTextColour : "808080",
			showGroupAuthorNames : "1",
			durHeadlineColour : "ffffff",
			categories : [ {
				id : 67,
				title : "Bahrain",
				colour : "FF5E00"
			}, {
				id : 65,
				title : "Egypt",
				colour : "ED0003"
			}, {
				id : 64,
				title : "Libya",
				colour : "C5585D"
			}, {
				id : 66,
				title : "Tunisia",
				colour : "728F99"
			} ],
			feeds : [],
			stories : [
					{
						id : 913,
						ownerId : "",
						ownerName : "",
						title : "Protests reach the Tunisian Capital Tunis",
						startDate : "2010-12-27 00:00:00",
						endDate : "2010-12-27 00:00:00",
						text : "Large scale demonstrations kick off in the Tunisian capital Tunis for the first time, as crowds of more than 1,000 take part in a rally in support of protests elsewhere in the country. The rally was broken up by security forces.",
						category : "66",
						dateFormat : "auto",
						externalLink : "",
						media : [ {
							id : 705,
							src : "http://www.youtube.com/watch?v=lq_oEXLaEUM&feature=related",
							caption : "Video credit: Al Jazeera",
							type : "Video",
							thumbPosition : "0,0",
							externalMediaThumb : "/assets/images/arab-uprising/protest1.jpg",
							externalMediaType : "youtube",
							externalMediaId : "lq_oEXLaEUM",
							orderIndex : 10
						} ]
					},
					{
						id : 914,
						ownerId : "",
						ownerName : "",
						title : "Further protests in Tunisia",
						startDate : "2010-12-29 00:00:00",
						endDate : "2010-12-29 00:00:00",
						text : " A demonstration in Gafsa organised by the Tunisian Federation of Labour Unions is broken up by police on 29 December but that does not stop the protests. The next day some 300 lawyers hold a rally close to the Government's Palace in the Tunisian capital and over following days numerous other protests take place across the country.",
						category : "66",
						dateFormat : "auto",
						externalLink : "",
						media : []
					},
					{
						id : 915,
						ownerId : "",
						ownerName : "",
						title : "Lawyers 'savagely beaten'",
						startDate : "2010-12-31 00:00:00",
						endDate : "2010-12-29 00:00:00",
						text : "Mokhtar Trifi, president of the Tunisian Human Rights League, complains that lawyers had been 'savagely beaten' by security forces following a series of demonstrations organised by the Tunisian National Lawyers Order. ",
						category : "66",
						dateFormat : "auto",
						externalLink : "",
						media : []
					},
					{
						id : 916,
						ownerId : "",
						ownerName : "",
						title : "Thala protests turn violent",
						startDate : "2011-01-03 00:00:00",
						endDate : "2010-12-27 00:00:00",
						text : "Violence breaks out in Thala - a 15,000 strong town in Tunisia - after a group of 250 mainly students are confronted by police. The security forces fired tear gas at the protesters, who responded by attacking the local office of the Tunisian governing party.",
						category : "66",
						dateFormat : "auto",
						externalLink : "",
						media : []
					},
					{
						id : 917,
						ownerId : "",
						ownerName : "",
						title : "Tunisian lawyers go on strike",
						startDate : "2011-01-06 00:00:00",
						endDate : "2011-01-06 00:00:00",
						text : "Tunisia's 8,000 lawyers call a strike in protest at the brutal crack down by the security forces. The Tunisian Human Rights League had earlier complained that lawyers taking part in protests in the capital had been 'savagely beaten'  by the police.",
						category : "66",
						dateFormat : "auto",
						externalLink : "",
						media : []
					},
					{
						id : 910,
						ownerId : "",
						ownerName : "",
						title : "Ben Ali flees to Saudia Arabia",
						startDate : "2011-01-14 00:00:00",
						endDate : "2011-01-14 00:00:00",
						text : "Against all the odds, protesters in Tunisia force long-time president Zine El Abidine Ben Ali to step down. His resignation follows weeks of protests in the north African country. Ben Ali had been in power for 23 years. He subsequently flees to Saudia Arabia.",
						category : "66",
						dateFormat : "auto",
						externalLink : "",
						media : []
					},
					{
						id : 911,
						ownerId : "",
						ownerName : "",
						title : "Tunisia police kill Protesters",
						startDate : "2010-12-24 00:00:00",
						endDate : "2010-12-18 19:47:44",
						text : "A crackdown on demonstrators in the Tunisian district of Bouziane results in two fatalities. Police claimed they acted in self defence in shooting the protesters. But any hope the government had that the crackdown would cow the protesters into submission were to be dashed, as even larger demonstrations were soon to sweep the country.",
						category : "66",
						dateFormat : "auto",
						externalLink : "",
						media : []
					},
					{
						id : 912,
						ownerId : "",
						ownerName : "",
						title : "Rapper El Général arrested",
						startDate : "2010-12-24 09:05:46",
						endDate : "2010-12-19 09:05:46",
						text : "A Tunisian rapper whose songs had been adopted by protesters is arrested. Hamada Ben Amor - who goes by the stage name El Général - had recently released rap protest song 'Tunisia our country'. He was released a few days later following a huge reaction from the Tunisian populace and his songs are now widely considered to be the \"anthems of the revolution\".",
						category : "66",
						dateFormat : "auto",
						externalLink : "",
						media : [ {
							id : 706,
							src : "http://www.youtube.com/watch?v=IeGlJ7OouR0",
							caption : "",
							type : "Video",
							thumbPosition : "0,0",
							externalMediaThumb : "/assets/images/arab-uprising/rapper1.jpg",
							externalMediaType : "youtube",
							externalMediaId : "IeGlJ7OouR0",
							orderIndex : 10
						} ]
					},
					{
						id : 772,
						ownerId : "",
						ownerName : "",
						title : "Gaddafi slates Tunisia revolt",
						startDate : "2011-01-16 00:00:00",
						endDate : "2010-01-16 00:00:00",
						text : "Libyan leader speaks out against the uprising in Tunisia, blaming wikileaks for sparking the unrest. Meanwhile, reports come in of unrest in his oil-rich north African country.",
						category : "64",
						dateFormat : "auto",
						externalLink : "http://www.guardian.co.uk/world/2011/jan/16/muammar-gaddafi-condemns-tunisia-uprising",
						media : [ {
							id : 697,
							src : "http://farm6.static.flickr.com/5247/5341607755_731a8225d6_m.jpg",
							caption : "Photo credit: <a href=\"http://www.flickr.com/people/61997808@N00/\">Ruby Goes</a>",
							type : "Image",
							thumbPosition : "0,0",
							externalMediaThumb : "",
							externalMediaType : "",
							externalMediaId : "",
							orderIndex : 10
						} ]
					},
					{
						id : 773,
						ownerId : "",
						ownerName : "",
						title : "Mohamed Bouazizi",
						startDate : "2010-12-17 00:00:00",
						endDate : "2011-01-17 00:00:00",
						text : "Street vendor Mohamed Ben Bouazizi (March 29 1984 - Jan 4 2011) sets himself on fire in protest at his treatment by the Tunisian authorities. His action sparks wide-spread protests across Tunisia against president Zine El Abidine Ben Ali and his governing party.",
						category : "66",
						dateFormat : "auto",
						externalLink : "",
						media : []
					},
					{
						id : 918,
						ownerId : "",
						ownerName : "",
						title : "'We are not afraid'",
						startDate : "2011-01-11 00:00:00",
						endDate : "2011-01-11 00:00:00",
						text : "Protesters in a working class district of Tunis reportedly chant \"We are not afraid. We are not afraid\" after police fire tear gas at them.",
						category : "66",
						dateFormat : "auto",
						externalLink : "",
						media : [ {
							id : 704,
							src : "http://www.youtube.com/watch?v=BPyvrWblA0I&feature=related",
							caption : "",
							type : "Video",
							thumbPosition : "0,0",
							externalMediaThumb : "/assets/images/arab-uprising/protest2.jpg",
							externalMediaType : "youtube",
							externalMediaId : "BPyvrWblA0I",
							orderIndex : 10
						} ]
					},
					{
						id : 919,
						ownerId : "",
						ownerName : "",
						title : "Military deployed",
						startDate : "2011-01-12 00:00:00",
						endDate : "2011-01-12 00:00:00",
						text : "The military is deployed across Tunisia in an attempt by the beleagured government and its leader Ben Ali to quell wide-spread unrest in the country. A night-time curfew is also imposed in the Tunisian capital Tunis.",
						category : "66",
						dateFormat : "auto",
						externalLink : "",
						media : []
					},
					{
						id : 920,
						ownerId : "",
						ownerName : "",
						title : "Egyptian sets himself ablaze outside parliament",
						startDate : "2011-01-17 00:00:00",
						endDate : "2011-01-17 00:00:00",
						text : "In the first signs of unrest in Egypt, a man sets himself on fire outside the country's parliament in protest at poor living conditions and lack of opportunity. Five others try to do the same. The self-immolations come exactly a month after Tunisian street vendor Mohamed Ben Bouazizi  set himself alight in Tunisia, sparking an uprising that led to the deposing of long-time president Ben Ali.",
						category : "65",
						dateFormat : "auto",
						externalLink : "",
						media : []
					},
					{
						id : 941,
						ownerId : "",
						ownerName : "",
						title : "Day of Revolt",
						startDate : "2011-01-25 00:00:00",
						endDate : "2011-01-18 16:16:12",
						text : "Protests break out throughout Egypt in what is dubbed the 'Day of Revolt' as the country's citizens express their anger at the government of President Hosni Mubarak. The biggest crowds are in Cairo, where tens of thousands of people gathered, but thousands also protest in other cities across country. The protests are mainly peaceful though police keep a close presence.",
						category : "65",
						dateFormat : "auto",
						externalLink : "",
						media : [ {
							id : 726,
							src : "http://upload.wikimedia.org/wikipedia/commons/c/c5/Day_of_Anger_marchers_in_street.jpg",
							caption : "Photo credit: <a href=\"http://www.flickr.com/photos/70225554@N00\">Muhammad Ghafari</a>",
							type : "Image",
							thumbPosition : "0,0",
							externalMediaThumb : "",
							externalMediaType : "",
							externalMediaId : "",
							orderIndex : 10
						} ]
					},
					{
						id : 942,
						ownerId : "",
						ownerName : "",
						title : "Friday of Rage",
						startDate : "2011-01-28 00:00:00",
						endDate : "2011-01-28 00:00:00",
						text : "Following four days of protests, hundreds of thousands demonstrate in Cairo and other Egyptian cities after Friday prayers. In what appears to be a deliberate attempt to intimidate the protesters, thousands of prisoners are allegedly released by the government, and given free reign on the streets of the capital after police are withdrawn. Despite the chaos, there are few reports of casualties. During the day, president Hosni Mubarak makes his first public statement about the protests.",
						category : "65",
						dateFormat : "auto",
						externalLink : "",
						media : []
					},
					{
						id : 943,
						ownerId : "",
						ownerName : "",
						title : "Egyptian military refuses to fire on protesters",
						startDate : "2011-01-29 00:00:00",
						endDate : "2011-01-28 00:00:00",
						text : "The military is deployed on the streets of Cairo and a curfew is imposed, but neither do much to quell the protests. If anything, the demonstrations are even larger. The army reportedly refuses to follow orders to fire live ammunition.",
						category : "65",
						dateFormat : "auto",
						externalLink : "",
						media : []
					},
					{
						id : 944,
						ownerId : "",
						ownerName : "",
						title : "Mubarak offers concessions",
						startDate : "2011-02-01 00:00:00",
						endDate : "2011-01-28 00:00:00",
						text : "As pressure on him to stand down builds, Egyptian president Mubarak addresses the nation on television. He promises he will not stand in the upcoming elections in September and also pledges to enact political reforms. But the demonstrators want nothing less than his immediate removal. Towards the end of the day, in a sign of what is to come, there are reports of sporadic clashes between pro-Mubarak supporters and the anti-governement protesters.",
						category : "65",
						dateFormat : "auto",
						externalLink : "",
						media : [ {
							id : 727,
							src : "http://upload.wikimedia.org/wikipedia/commons/b/b6/Hosni_Mubarak_ritratto.jpg",
							caption : "Photo credit: Presidenza della Repubblica",
							type : "Image",
							thumbPosition : "0,0",
							externalMediaThumb : "",
							externalMediaType : "",
							externalMediaId : "",
							orderIndex : 10
						} ]
					},
					{
						id : 945,
						ownerId : "",
						ownerName : "",
						title : "The battle for Tahrir Square",
						startDate : "2011-02-02 00:00:00",
						endDate : "2011-02-02 00:00:00",
						text : "Things turn nasty in Cairo's Tahrir Square after hundreds of supporters of Egyptian president Hosni Mubarak attack a large crowd of people demanding he steps down.",
						category : "65",
						dateFormat : "auto",
						externalLink : "",
						media : [ {
							id : 729,
							src : "http://www.youtube.com/watch?v=fHTl8kAEVxg",
							caption : "Video credit: Al Jazeera",
							type : "Video",
							thumbPosition : "0,0",
							externalMediaThumb : "/assets/images/arab-uprising/tahrir-violence1.jpg",
							externalMediaType : "youtube",
							externalMediaId : "fHTl8kAEVxg",
							orderIndex : 10
						} ]
					} ]
		}
	</SCRIPT>
</BODY>
</HTML>
