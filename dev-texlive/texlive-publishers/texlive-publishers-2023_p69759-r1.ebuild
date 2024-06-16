# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

TEXLIVE_MODULE_CONTENTS="
	collection-publishers.r69759
	aastex.r58057
	abnt.r55471
	abntex2.r49248
	abntexto.r68837
	acmart.r69721
	acmconf.r15878
	active-conf.r15878
	adfathesis.r26048
	afparticle.r35900
	afthesis.r15878
	aguplus.r17156
	aiaa.r15878
	amnestyreport.r69439
	anonymous-acm.r55121
	aomart.r63442
	apa.r54080
	apa6.r67848
	apa6e.r23350
	apa7.r63974
	arsclassica.r45656
	articleingud.r38741
	asaetr.r15878
	ascelike.r29129
	asmeconf.r69742
	asmejour.r69722
	aucklandthesis.r51323
	bangorcsthesis.r61770
	bangorexam.r65140
	bath-bst.r63398
	beamer-fuberlin.r63161
	beamer-verona.r39180
	beilstein.r56193
	bfh-ci.r68828
	bgteubner.r54080
	bjfuthesis.r59809
	bmstu.r65897
	bmstu-iu8.r61937
	br-lex.r44939
	brandeis-dissertation.r67935
	brandeis-problemset.r50991
	brandeis-thesis.r68092
	buctthesis.r67818
	cascadilla.r25144
	cesenaexam.r44960
	chem-journal.r15878
	chifoot.r57312
	chs-physics-report.r54512
	cidarticle.r68976
	cje.r68656
	cjs-rcs-article.r69006
	classicthesis.r48041
	cleanthesis.r51472
	cmpj.r58506
	confproc.r29349
	contract.r69759
	cquthesis.r55643
	dccpaper.r67890
	dithesis.r34295
	ebook.r29466
	ebsthesis.r15878
	ejpecp.r60950
	ekaia.r49594
	elbioimp.r21758
	els-cas-templates.r62931
	elsarticle.r56999
	elteiktdk.r66821
	elteikthesis.r66820
	emisa.r60068
	erdc.r15878
	estcpmm.r17335
	etsvthor.r48186
	facture-belge-simple-sans-tva.r67573
	fbithesis.r21340
	fcavtex.r38074
	fcltxdoc.r24500
	fei.r65352
	ftc-notebook.r50043
	gaceta.r15878
	gammas.r56403
	geradwp.r63134
	gfdl.r65415
	gradstudentresume.r38832
	grant.r56852
	gsemthesis.r56291
	gzt.r63591
	h2020proposal.r38428
	hagenberg-thesis.r65819
	har2nat.r54080
	hecthese.r68584
	hep-paper.r67632
	heria.r69058
	hfutexam.r68829
	hfutthesis.r64025
	hithesis.r64005
	hitszbeamer.r54381
	hitszthesis.r61073
	hobete.r27036
	hu-berlin-bundle.r67128
	hustthesis.r42547
	icsv.r15878
	ieeeconf.r59665
	ieeepes.r17359
	ieeetran.r59672
	ijmart.r30958
	ijsra.r44886
	imac.r17347
	imtekda.r17667
	inkpaper.r54080
	iodhbwm.r57773
	iscram.r45801
	jacow.r63060
	jmlr.r61957
	jnuexam.r69161
	jourcl.r65290
	jourrr.r68556
	jpsj.r66115
	jwjournal.r69162
	kdgdocs.r24498
	kdpcover.r65150
	kfupm-math-exam.r63977
	kluwer.r54074
	ksp-thesis.r39080
	ku-template.r45935
	langsci.r65793
	langsci-avm.r66016
	limecv.r61199
	lion-msc.r55415
	llncs.r69629
	llncsconf.r63136
	lni.r69361
	lps.r21322
	matc3.r29845
	matc3mem.r35773
	mcmthesis.r69538
	mentis.r15878
	mitthesis.r68732
	mlacls.r67201
	mluexercise.r56927
	mnras.r68878
	modeles-factures-belges-assocs.r67840
	msu-thesis.r68480
	mucproc.r43445
	mugsthesis.r64259
	muling.r66741
	musuos.r24857
	muthesis.r23861
	mynsfc.r60280
	nature.r21819
	navydocs.r41643
	nddiss.r45107
	ndsu-thesis.r46639
	ndsu-thesis-2022.r63881
	nih.r15878
	nihbiosketch.r54191
	njustthesis.r62451
	njuthesis.r69051
	njuvisual.r65261
	nostarch.r67683
	novel.r69658
	nrc.r29027
	nwafuthesis.r66895
	nwejm.r64462
	onrannual.r17474
	opteng.r27331
	oststud.r67217
	oup-authoring-template.r64491
	philosophersimprint.r56954
	pittetd.r15878
	pkuthss.r64869
	powerdot-fuberlin.r52922
	powerdot-tuliplab.r47963
	pracjourn.r61719
	prociagssymp.r63242
	proposal.r40538
	prtec.r51919
	ptptex.r19440
	qrbill.r67724
	quantumarticle.r65242
	regulatory.r69611
	resphilosophica.r50935
	resumecls.r54815
	revtex.r67271
	revtex4.r56589
	revtex4-1.r56590
	rutitlepage.r62143
	ryersonsgsthesis.r50119
	ryethesis.r33945
	sageep.r15878
	sapthesis.r63810
	schule.r68483
	scientific-thesis-cover.r47923
	scripture.r69232
	scrjrnl.r27810
	sduthesis.r41401
	se2thesis.r68255
	seu-ml-assign.r62933
	seuthesis.r33042
	seuthesix.r40088
	shortmathj.r67201
	shtthesis.r62441
	smflatex.r58910
	soton.r16215
	sphdthesis.r34374
	spie.r15878
	sr-vorl.r59333
	srdp-mathematik.r69288
	stellenbosch.r68039
	stellenbosch-2.r68183
	suftesi.r68204
	sugconf.r58752
	tabriz-thesis.r51729
	technion-thesis-template.r49889
	texilikechaps.r28553
	texilikecover.r15878
	thesis-ekf.r60228
	thesis-gwu.r54287
	thesis-qom.r63524
	thesis-titlepage-fhac.r15878
	thuaslogos.r51347
	thubeamer.r61071
	thucoursework.r56435
	thuthesis.r67127
	tidyres.r67738
	timbreicmc.r49740
	tlc-article.r51431
	topletter.r48182
	toptesi.r56276
	tuda-ci.r69351
	tudscr.r64085
	tugboat.r68694
	tugboat-plain.r68695
	tui.r27253
	turabian.r36298
	uaclasses.r15878
	uafthesis.r57349
	uantwerpendocs.r66819
	ucalgmthesis.r66602
	ucbthesis.r51690
	ucdavisthesis.r40772
	ucph-revy.r69750
	ucsmonograph.r52698
	ucthesis.r15878
	udepcolor.r69701
	udes-genie-these.r68141
	uestcthesis.r36371
	ufrgscca.r69042
	uhhassignment.r44026
	uiucredborder.r29974
	uiucthesis.r15878
	ukbill.r69362
	ulthese.r60217
	umbclegislation.r41348
	umich-thesis.r15878
	umthesis.r15878
	unam-thesis.r51207
	unamthesis.r43639
	unbtex.r69681
	unifith.r60698
	unigrazpub.r64797
	unitn-bimrep.r45581
	univie-ling.r66728
	unizgklasa.r51647
	unswcover.r66115
	uol-physics-report.r65761
	uothesis.r25355
	uowthesis.r19700
	uowthesistitlepage.r54512
	urcls.r49903
	uspatent.r27744
	ut-thesis.r65767
	utexasthesis.r48648
	uvaletter.r66712
	uwa-colours.r60443
	uwa-letterhead.r64491
	uwa-pcf.r64491
	uwa-pif.r64491
	uwthesis.r15878
	vancouver.r59192
	wsemclassic.r31532
	xduthesis.r63116
	xduts.r66661
	xmuthesis.r56614
	yathesis.r66146
	yazd-thesis.r61719
	yb-book.r67188
	york-thesis.r23348
"
TEXLIVE_MODULE_DOC_CONTENTS="
	aastex.doc.r58057
	abnt.doc.r55471
	abntex2.doc.r49248
	abntexto.doc.r68837
	acmart.doc.r69721
	acmconf.doc.r15878
	active-conf.doc.r15878
	adfathesis.doc.r26048
	afparticle.doc.r35900
	afthesis.doc.r15878
	aguplus.doc.r17156
	aiaa.doc.r15878
	amnestyreport.doc.r69439
	anonymous-acm.doc.r55121
	anufinalexam.doc.r26053
	aomart.doc.r63442
	apa.doc.r54080
	apa6.doc.r67848
	apa6e.doc.r23350
	apa7.doc.r63974
	arsclassica.doc.r45656
	articleingud.doc.r38741
	asaetr.doc.r15878
	ascelike.doc.r29129
	asmeconf.doc.r69742
	asmejour.doc.r69722
	aucklandthesis.doc.r51323
	bangorcsthesis.doc.r61770
	bangorexam.doc.r65140
	bath-bst.doc.r63398
	beamer-fuberlin.doc.r63161
	beamer-verona.doc.r39180
	beilstein.doc.r56193
	bfh-ci.doc.r68828
	bgteubner.doc.r54080
	bjfuthesis.doc.r59809
	bmstu.doc.r65897
	bmstu-iu8.doc.r61937
	br-lex.doc.r44939
	brandeis-dissertation.doc.r67935
	brandeis-problemset.doc.r50991
	brandeis-thesis.doc.r68092
	buctthesis.doc.r67818
	cascadilla.doc.r25144
	cesenaexam.doc.r44960
	chifoot.doc.r57312
	chs-physics-report.doc.r54512
	cidarticle.doc.r68976
	cje.doc.r68656
	cjs-rcs-article.doc.r69006
	classicthesis.doc.r48041
	cleanthesis.doc.r51472
	cmpj.doc.r58506
	confproc.doc.r29349
	contract.doc.r69759
	cquthesis.doc.r55643
	dccpaper.doc.r67890
	dithesis.doc.r34295
	ebook.doc.r29466
	ebsthesis.doc.r15878
	ecothesis.doc.r48007
	ejpecp.doc.r60950
	ekaia.doc.r49594
	elbioimp.doc.r21758
	els-cas-templates.doc.r62931
	elsarticle.doc.r56999
	elteiktdk.doc.r66821
	elteikthesis.doc.r66820
	emisa.doc.r60068
	erdc.doc.r15878
	estcpmm.doc.r17335
	etsvthor.doc.r48186
	facture-belge-simple-sans-tva.doc.r67573
	fbithesis.doc.r21340
	fcavtex.doc.r38074
	fcltxdoc.doc.r24500
	fei.doc.r65352
	ftc-notebook.doc.r50043
	gaceta.doc.r15878
	gammas.doc.r56403
	geradwp.doc.r63134
	gfdl.doc.r65415
	gradstudentresume.doc.r38832
	grant.doc.r56852
	gsemthesis.doc.r56291
	gzt.doc.r63591
	h2020proposal.doc.r38428
	hagenberg-thesis.doc.r65819
	har2nat.doc.r54080
	hecthese.doc.r68584
	hep-paper.doc.r67632
	heria.doc.r69058
	hfutexam.doc.r68829
	hfutthesis.doc.r64025
	hithesis.doc.r64005
	hitszbeamer.doc.r54381
	hitszthesis.doc.r61073
	hobete.doc.r27036
	hu-berlin-bundle.doc.r67128
	hustthesis.doc.r42547
	icsv.doc.r15878
	ieeeconf.doc.r59665
	ieeepes.doc.r17359
	ieeetran.doc.r59672
	ijmart.doc.r30958
	ijsra.doc.r44886
	imac.doc.r17347
	imtekda.doc.r17667
	inkpaper.doc.r54080
	iodhbwm.doc.r57773
	iscram.doc.r45801
	jacow.doc.r63060
	jmlr.doc.r61957
	jnuexam.doc.r69161
	jourcl.doc.r65290
	jourrr.doc.r68556
	jpsj.doc.r66115
	jwjournal.doc.r69162
	kdgdocs.doc.r24498
	kdpcover.doc.r65150
	kfupm-math-exam.doc.r63977
	kluwer.doc.r54074
	ksp-thesis.doc.r39080
	ku-template.doc.r45935
	langsci.doc.r65793
	langsci-avm.doc.r66016
	limecv.doc.r61199
	lion-msc.doc.r55415
	llncs.doc.r69629
	llncsconf.doc.r63136
	lni.doc.r69361
	lps.doc.r21322
	matc3.doc.r29845
	matc3mem.doc.r35773
	mcmthesis.doc.r69538
	mentis.doc.r15878
	mitthesis.doc.r68732
	mlacls.doc.r67201
	mluexercise.doc.r56927
	mnras.doc.r68878
	modeles-factures-belges-assocs.doc.r67840
	msu-thesis.doc.r68480
	mucproc.doc.r43445
	mugsthesis.doc.r64259
	muling.doc.r66741
	musuos.doc.r24857
	muthesis.doc.r23861
	mynsfc.doc.r60280
	nature.doc.r21819
	navydocs.doc.r41643
	nddiss.doc.r45107
	ndsu-thesis.doc.r46639
	ndsu-thesis-2022.doc.r63881
	nih.doc.r15878
	nihbiosketch.doc.r54191
	njustthesis.doc.r62451
	njuthesis.doc.r69051
	njuvisual.doc.r65261
	nostarch.doc.r67683
	novel.doc.r69658
	nrc.doc.r29027
	nwafuthesis.doc.r66895
	nwejm.doc.r64462
	onrannual.doc.r17474
	opteng.doc.r27331
	oststud.doc.r67217
	oup-authoring-template.doc.r64491
	philosophersimprint.doc.r56954
	pittetd.doc.r15878
	pkuthss.doc.r64869
	powerdot-fuberlin.doc.r52922
	powerdot-tuliplab.doc.r47963
	pracjourn.doc.r61719
	prociagssymp.doc.r63242
	proposal.doc.r40538
	prtec.doc.r51919
	ptptex.doc.r19440
	qrbill.doc.r67724
	quantumarticle.doc.r65242
	regulatory.doc.r69611
	resphilosophica.doc.r50935
	resumecls.doc.r54815
	revtex.doc.r67271
	revtex4.doc.r56589
	revtex4-1.doc.r56590
	rutitlepage.doc.r62143
	ryersonsgsthesis.doc.r50119
	ryethesis.doc.r33945
	sageep.doc.r15878
	sapthesis.doc.r63810
	schule.doc.r68483
	scientific-thesis-cover.doc.r47923
	scripture.doc.r69232
	scrjrnl.doc.r27810
	sduthesis.doc.r41401
	se2thesis.doc.r68255
	seu-ml-assign.doc.r62933
	seuthesis.doc.r33042
	seuthesix.doc.r40088
	shortmathj.doc.r67201
	shtthesis.doc.r62441
	smflatex.doc.r58910
	soton.doc.r16215
	sphdthesis.doc.r34374
	spie.doc.r15878
	sr-vorl.doc.r59333
	srdp-mathematik.doc.r69288
	stellenbosch.doc.r68039
	stellenbosch-2.doc.r68183
	suftesi.doc.r68204
	sugconf.doc.r58752
	tabriz-thesis.doc.r51729
	technion-thesis-template.doc.r49889
	thesis-ekf.doc.r60228
	thesis-gwu.doc.r54287
	thesis-qom.doc.r63524
	thesis-titlepage-fhac.doc.r15878
	thuaslogos.doc.r51347
	thubeamer.doc.r61071
	thucoursework.doc.r56435
	thuthesis.doc.r67127
	tidyres.doc.r67738
	timbreicmc.doc.r49740
	tlc-article.doc.r51431
	topletter.doc.r48182
	toptesi.doc.r56276
	tuda-ci.doc.r69351
	tudscr.doc.r64085
	tugboat.doc.r68694
	tugboat-plain.doc.r68695
	tui.doc.r27253
	turabian.doc.r36298
	uaclasses.doc.r15878
	uafthesis.doc.r57349
	uantwerpendocs.doc.r66819
	ucalgmthesis.doc.r66602
	ucbthesis.doc.r51690
	ucdavisthesis.doc.r40772
	ucph-revy.doc.r69750
	ucsmonograph.doc.r52698
	ucthesis.doc.r15878
	udepcolor.doc.r69701
	udes-genie-these.doc.r68141
	uestcthesis.doc.r36371
	ufrgscca.doc.r69042
	uhhassignment.doc.r44026
	uiucredborder.doc.r29974
	uiucthesis.doc.r15878
	ukbill.doc.r69362
	ulthese.doc.r60217
	umbclegislation.doc.r41348
	umich-thesis.doc.r15878
	umthesis.doc.r15878
	unam-thesis.doc.r51207
	unamth-template.doc.r68681
	unamthesis.doc.r43639
	unbtex.doc.r69681
	unifith.doc.r60698
	unigrazpub.doc.r64797
	unitn-bimrep.doc.r45581
	univie-ling.doc.r66728
	unizgklasa.doc.r51647
	unswcover.doc.r66115
	uol-physics-report.doc.r65761
	uothesis.doc.r25355
	uowthesis.doc.r19700
	uowthesistitlepage.doc.r54512
	urcls.doc.r49903
	uspatent.doc.r27744
	ut-thesis.doc.r65767
	utexasthesis.doc.r48648
	uvaletter.doc.r66712
	uwa-colours.doc.r60443
	uwa-letterhead.doc.r64491
	uwa-pcf.doc.r64491
	uwa-pif.doc.r64491
	uwthesis.doc.r15878
	vancouver.doc.r59192
	wsemclassic.doc.r31532
	xduthesis.doc.r63116
	xduts.doc.r66661
	xmuthesis.doc.r56614
	yathesis.doc.r66146
	yazd-thesis.doc.r61719
	yb-book.doc.r67188
	york-thesis.doc.r23348
"
TEXLIVE_MODULE_SRC_CONTENTS="
	acmart.source.r69721
	acmconf.source.r15878
	active-conf.source.r15878
	adfathesis.source.r26048
	afparticle.source.r35900
	aiaa.source.r15878
	amnestyreport.source.r69439
	aomart.source.r63442
	apa6.source.r67848
	apa6e.source.r23350
	apa7.source.r63974
	articleingud.source.r38741
	bangorcsthesis.source.r61770
	bangorexam.source.r65140
	bath-bst.source.r63398
	beilstein.source.r56193
	bgteubner.source.r54080
	brandeis-dissertation.source.r67935
	brandeis-thesis.source.r68092
	buctthesis.source.r67818
	cesenaexam.source.r44960
	cidarticle.source.r68976
	cjs-rcs-article.source.r69006
	confproc.source.r29349
	contract.source.r69759
	cquthesis.source.r55643
	dccpaper.source.r67890
	ebsthesis.source.r15878
	ejpecp.source.r60950
	ekaia.source.r49594
	elbioimp.source.r21758
	elsarticle.source.r56999
	emisa.source.r60068
	erdc.source.r15878
	estcpmm.source.r17335
	fbithesis.source.r21340
	fcltxdoc.source.r24500
	fei.source.r65352
	geradwp.source.r63134
	gfdl.source.r65415
	grant.source.r56852
	gsemthesis.source.r56291
	gzt.source.r63591
	hecthese.source.r68584
	hep-paper.source.r67632
	heria.source.r69058
	hithesis.source.r64005
	hitszbeamer.source.r54381
	hitszthesis.source.r61073
	hu-berlin-bundle.source.r67128
	hustthesis.source.r42547
	icsv.source.r15878
	ieeeconf.source.r59665
	ijmart.source.r30958
	imtekda.source.r17667
	jmlr.source.r61957
	kdgdocs.source.r24498
	kdpcover.source.r65150
	kfupm-math-exam.source.r63977
	kluwer.source.r54074
	langsci-avm.source.r66016
	limecv.source.r61199
	lni.source.r69361
	lps.source.r21322
	matc3.source.r29845
	matc3mem.source.r35773
	mcmthesis.source.r69538
	mentis.source.r15878
	mlacls.source.r67201
	mluexercise.source.r56927
	mucproc.source.r43445
	mugsthesis.source.r64259
	muling.source.r66741
	musuos.source.r24857
	mynsfc.source.r60280
	navydocs.source.r41643
	nddiss.source.r45107
	njustthesis.source.r62451
	njuthesis.source.r69051
	njuvisual.source.r65261
	nostarch.source.r67683
	nrc.source.r29027
	nwafuthesis.source.r66895
	nwejm.source.r64462
	oststud.source.r67217
	philosophersimprint.source.r56954
	pittetd.source.r15878
	pracjourn.source.r61719
	proposal.source.r40538
	qrbill.source.r67724
	resphilosophica.source.r50935
	resumecls.source.r54815
	revtex.source.r67271
	revtex4.source.r56589
	revtex4-1.source.r56590
	rutitlepage.source.r62143
	ryethesis.source.r33945
	sageep.source.r15878
	scientific-thesis-cover.source.r47923
	scripture.source.r69232
	scrjrnl.source.r27810
	sduthesis.source.r41401
	se2thesis.source.r68255
	seuthesis.source.r33042
	seuthesix.source.r40088
	smflatex.source.r58910
	sr-vorl.source.r59333
	stellenbosch.source.r68039
	stellenbosch-2.source.r68183
	suftesi.source.r68204
	thesis-ekf.source.r60228
	thesis-titlepage-fhac.source.r15878
	thubeamer.source.r61071
	thucoursework.source.r56435
	thuthesis.source.r67127
	timbreicmc.source.r49740
	topletter.source.r48182
	toptesi.source.r56276
	tudscr.source.r64085
	tugboat.source.r68694
	uaclasses.source.r15878
	uantwerpendocs.source.r66819
	ucdavisthesis.source.r40772
	ucph-revy.source.r69750
	ucsmonograph.source.r52698
	udes-genie-these.source.r68141
	uhhassignment.source.r44026
	uiucredborder.source.r29974
	uiucthesis.source.r15878
	ulthese.source.r60217
	unigrazpub.source.r64797
	uol-physics-report.source.r65761
	uothesis.source.r25355
	ut-thesis.source.r65767
	uwa-colours.source.r60443
	uwa-letterhead.source.r64491
	uwa-pcf.source.r64491
	uwa-pif.source.r64491
	wsemclassic.source.r31532
	xduthesis.source.r63116
	xduts.source.r66661
	xmuthesis.source.r56614
	yathesis.source.r66146
	yb-book.source.r67188
	york-thesis.source.r23348
"

inherit texlive-module

DESCRIPTION="TeXLive Publisher styles, theses, etc."

LICENSE="Apache-2.0 Artistic-2 BSD CC-BY-4.0 CC-BY-SA-3.0 CC-BY-SA-4.0 CC0-1.0 FDL-1.1+ GPL-1+ GPL-2 GPL-2+ GPL-3 GPL-3+ LPPL-1.2 LPPL-1.3 LPPL-1.3a LPPL-1.3c MIT OFL-1.1 TeX-other-free public-domain"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~loong ~mips ~ppc ppc64 ~riscv ~s390 ~sparc x86"
COMMON_DEPEND="
	>=dev-texlive/texlive-latex-2023
"
RDEPEND="
	${COMMON_DEPEND}
"
DEPEND="
	${COMMON_DEPEND}
"
