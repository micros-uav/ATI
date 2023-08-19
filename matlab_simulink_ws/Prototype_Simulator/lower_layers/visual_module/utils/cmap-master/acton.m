
function cm = acton(n, varargin)
% Colormap: acton

%-- Parse inputs ---------------------------------------------------------%
if ~exist('n', 'var'); n = []; end
if isempty(n)
   f = get(groot,'CurrentFigure');
   if isempty(f)
      n = size(get(groot,'DefaultFigureColormap'),1);
   else
      n = size(f.Colormap,1);
   end
end
%-------------------------------------------------------------------------%

% Data for colormap:
cm = [
	0.180626921	0.129915982	0.300243720
	0.184609893	0.133361374	0.303782480
	0.188588178	0.136829135	0.307329506
	0.192546783	0.140323324	0.310900233
	0.196547941	0.143831650	0.314443030
	0.200488483	0.147340518	0.318014701
	0.204514588	0.150846348	0.321580506
	0.208493224	0.154369015	0.325153396
	0.212499150	0.157916044	0.328751893
	0.216523460	0.161487698	0.332345497
	0.220543454	0.164996948	0.335927681
	0.224525654	0.168579066	0.339540264
	0.228599479	0.172137964	0.343142836
	0.232626912	0.175705699	0.346748982
	0.236700409	0.179308918	0.350370146
	0.240737551	0.182887197	0.353977984
	0.244814388	0.186501556	0.357621637
	0.248929550	0.190103961	0.361237265
	0.253030379	0.193733149	0.364873491
	0.257149266	0.197343924	0.368523331
	0.261278087	0.200942305	0.372155316
	0.265425161	0.204605016	0.375810057
	0.269603182	0.208226439	0.379461473
	0.273782743	0.211880571	0.383123558
	0.277978543	0.215504941	0.386769002
	0.282204793	0.219154911	0.390434512
	0.286418418	0.222807346	0.394097259
	0.290685877	0.226458119	0.397768259
	0.294963764	0.230076771	0.401431068
	0.299282226	0.233732114	0.405094507
	0.303592142	0.237416462	0.408762042
	0.307941003	0.241039325	0.412435698
	0.312310950	0.244674953	0.416090240
	0.316729140	0.248352070	0.419755430
	0.321154918	0.251982966	0.423403315
	0.325598104	0.255609592	0.427068901
	0.330097390	0.259251155	0.430713486
	0.334616423	0.262862145	0.434348907
	0.339156293	0.266473500	0.437993134
	0.343714668	0.270084433	0.441615970
	0.348324912	0.273672697	0.445225979
	0.352962363	0.277245563	0.448835908
	0.357637788	0.280787057	0.452428901
	0.362328123	0.284341642	0.455993979
	0.367058139	0.287868107	0.459556664
	0.371817994	0.291392743	0.463085473
	0.376633364	0.294860877	0.466617359
	0.381461630	0.298321184	0.470118895
	0.386313691	0.301752494	0.473580804
	0.391226000	0.305174831	0.477034815
	0.396150962	0.308549240	0.480453338
	0.401118001	0.311869265	0.483837865
	0.406106329	0.315186587	0.487202282
	0.411120790	0.318454799	0.490523627
	0.416167527	0.321674030	0.493798898
	0.421235932	0.324851659	0.497038970
	0.426337299	0.327991908	0.500232965
	0.431472812	0.331069155	0.503383260
	0.436611703	0.334121397	0.506489532
	0.441778339	0.337097159	0.509546510
	0.446950834	0.340021471	0.512544023
	0.452153608	0.342887518	0.515484481
	0.457348901	0.345671988	0.518380988
	0.462560586	0.348416455	0.521200376
	0.467787692	0.351091016	0.523964673
	0.473007011	0.353679109	0.526669116
	0.478238149	0.356220682	0.529299583
	0.483458451	0.358663495	0.531857618
	0.488681983	0.361045992	0.534346968
	0.493892154	0.363355516	0.536776716
	0.499088674	0.365588727	0.539117014
	0.504283039	0.367732794	0.541384423
	0.509443660	0.369805396	0.543589508
	0.514595357	0.371792688	0.545715543
	0.519713668	0.373712344	0.547757711
	0.524818480	0.375533701	0.549728334
	0.529894510	0.377288382	0.551622660
	0.534937177	0.378951568	0.553430553
	0.539947585	0.380543925	0.555172758
	0.544933141	0.382040620	0.556844066
	0.549880057	0.383479536	0.558422596
	0.554790178	0.384818035	0.559949343
	0.559666204	0.386089514	0.561388403
	0.564499526	0.387290432	0.562767675
	0.569293629	0.388424752	0.564069674
	0.574053911	0.389477541	0.565293210
	0.578778134	0.390462693	0.566472830
	0.583457624	0.391391379	0.567578872
	0.588098966	0.392240246	0.568619583
	0.592717284	0.393034598	0.569605527
	0.597284198	0.393772234	0.570537663
	0.601813513	0.394455623	0.571418291
	0.606312572	0.395091097	0.572251952
	0.610785915	0.395679240	0.573036218
	0.615216240	0.396213571	0.573769207
	0.619633770	0.396704404	0.574462823
	0.624015391	0.397167990	0.575128911
	0.628373153	0.397605366	0.575766795
	0.632707135	0.398012046	0.576369782
	0.637028355	0.398390444	0.576941148
	0.641324786	0.398748474	0.577489538
	0.645618352	0.399093881	0.578027063
	0.649908243	0.399434626	0.578558947
	0.654185154	0.399779035	0.579085786
	0.658464231	0.400134789	0.579609208
	0.662752110	0.400503765	0.580132220
	0.667036230	0.400884939	0.580662823
	0.671339297	0.401281228	0.581210205
	0.675657727	0.401707961	0.581780092
	0.679990864	0.402184721	0.582378064
	0.684352139	0.402720381	0.583011149
	0.688750587	0.403316258	0.583686073
	0.693169688	0.403970486	0.584410097
	0.697618454	0.404696715	0.585192095
	0.702108766	0.405530313	0.586029888
	0.706646280	0.406447649	0.586932403
	0.711215570	0.407470005	0.587915038
	0.715826762	0.408614514	0.588983057
	0.720468510	0.409892055	0.590144661
	0.725159919	0.411292020	0.591406597
	0.729876410	0.412854949	0.592771628
	0.734623155	0.414551211	0.594233271
	0.739394608	0.416419164	0.595813392
	0.744168668	0.418443891	0.597513466
	0.748950331	0.420647907	0.599331483
	0.753727736	0.423021448	0.601262188
	0.758483922	0.425579048	0.603322432
	0.763196561	0.428302349	0.605490545
	0.767860730	0.431199245	0.607790440
	0.772459727	0.434245880	0.610184725
	0.776976507	0.437474028	0.612689322
	0.781381908	0.440823187	0.615295166
	0.785670085	0.444338071	0.617993338
	0.789818920	0.447950515	0.620775985
	0.793821223	0.451697843	0.623623966
	0.797645240	0.455528225	0.626524748
	0.801296362	0.459445127	0.629480061
	0.804757299	0.463415330	0.632478745
	0.808016226	0.467454577	0.635497856
	0.811068036	0.471521693	0.638538325
	0.813906469	0.475606675	0.641580355
	0.816538911	0.479697167	0.644622218
	0.818947050	0.483773140	0.647655678
	0.821153420	0.487855566	0.650670924
	0.823149506	0.491897712	0.653657097
	0.824942444	0.495898060	0.656620877
	0.826546580	0.499866934	0.659540738
	0.827957558	0.503800455	0.662431791
	0.829202281	0.507681261	0.665272548
	0.830272142	0.511500650	0.668084058
	0.831190329	0.515275513	0.670847417
	0.831962031	0.519007270	0.673567569
	0.832595184	0.522672115	0.676250195
	0.833109235	0.526298296	0.678890119
	0.833513256	0.529868239	0.681492409
	0.833814005	0.533389100	0.684062156
	0.834021185	0.536885319	0.686602432
	0.834145227	0.540322329	0.689112664
	0.834195635	0.543731437	0.691582889
	0.834181079	0.547106256	0.694027925
	0.834109579	0.550453072	0.696460868
	0.833988546	0.553768847	0.698860341
	0.833824766	0.557074121	0.701248360
	0.833624480	0.560345581	0.703619460
	0.833393856	0.563608845	0.705975594
	0.833139070	0.566852486	0.708318618
	0.832866257	0.570077303	0.710651468
	0.832581184	0.573310588	0.712971199
	0.832287905	0.576534675	0.715295081
	0.831989488	0.579747587	0.717610599
	0.831688636	0.582952430	0.719917847
	0.831388792	0.586172565	0.722220663
	0.831093953	0.589380344	0.724534066
	0.830807835	0.592613119	0.726840941
	0.830533642	0.595830703	0.729151711
	0.830273975	0.599066593	0.731464242
	0.830031192	0.602303701	0.733783950
	0.829807451	0.605550356	0.736100991
	0.829604626	0.608823021	0.738432158
	0.829424398	0.612085348	0.740763799
	0.829268420	0.615368740	0.743110827
	0.829138303	0.618676146	0.745453379
	0.829035593	0.621976465	0.747813760
	0.828961746	0.625307484	0.750172319
	0.828918100	0.628653070	0.752542595
	0.828905850	0.632007748	0.754931158
	0.828926036	0.635377936	0.757317285
	0.828979535	0.638769575	0.759713747
	0.829067066	0.642177709	0.762124066
	0.829189217	0.645596150	0.764546463
	0.829346485	0.649043777	0.766972586
	0.829539336	0.652496004	0.769410937
	0.829768283	0.655978052	0.771864141
	0.830033988	0.659465656	0.774318415
	0.830337089	0.662980622	0.776794332
	0.830678002	0.666499788	0.779268527
	0.831057054	0.670054096	0.781761386
	0.831473786	0.673611773	0.784261676
	0.831926255	0.677196148	0.786769976
	0.832413225	0.680781912	0.789285951
	0.832938865	0.684395743	0.791810095
	0.833506361	0.688031592	0.794350172
	0.834109196	0.691677047	0.796890896
	0.834744576	0.695339334	0.799452401
	0.835417243	0.699013653	0.802010366
	0.836126482	0.702712099	0.804585934
	0.836872009	0.706423277	0.807167261
	0.837652995	0.710144567	0.809754346
	0.838461719	0.713881065	0.812349568
	0.839310595	0.717638661	0.814954570
	0.840191855	0.721397163	0.817566227
	0.841100757	0.725185415	0.820184998
	0.842045084	0.728972958	0.822815714
	0.843015883	0.732783182	0.825446430
	0.844017121	0.736596767	0.828086753
	0.845051487	0.740429665	0.830737728
	0.846108559	0.744271310	0.833390146
	0.847196197	0.748128442	0.836048693
	0.848311688	0.751991895	0.838712075
	0.849455206	0.755866634	0.841385659
	0.850615052	0.759748471	0.844059563
	0.851805721	0.763645915	0.846739906
	0.853016830	0.767550284	0.849431867
	0.854248824	0.771471441	0.852124257
	0.855507540	0.775390412	0.854819188
	0.856778415	0.779324005	0.857516727
	0.858072079	0.783265377	0.860226311
	0.859386821	0.787217619	0.862937146
	0.860717012	0.791171430	0.865646770
	0.862067942	0.795136260	0.868370303
	0.863430762	0.799111599	0.871086467
	0.864804175	0.803085898	0.873811203
	0.866198518	0.807075662	0.876537893
	0.867604143	0.811065383	0.879271143
	0.869025386	0.815062660	0.882008667
	0.870448800	0.819064264	0.884748007
	0.871896477	0.823078003	0.887486796
	0.873344673	0.827095331	0.890232978
	0.874805556	0.831117923	0.892980980
	0.876275098	0.835141557	0.895732740
	0.877755079	0.839172825	0.898483051
	0.879238255	0.843207194	0.901239960
	0.880731536	0.847246456	0.903997103
	0.882229803	0.851290291	0.906760268
	0.883737460	0.855346284	0.909521780
	0.885244205	0.859396991	0.912287062
	0.886758729	0.863457667	0.915052650
	0.888274182	0.867515076	0.917826687
	0.889792614	0.871582085	0.920591737
	0.891315007	0.875649415	0.923371007
	0.892840021	0.879717766	0.926144194
	0.894367831	0.883796890	0.928918781
	0.895892549	0.887870389	0.931698802
	0.897421302	0.891954318	0.934479017
	0.898946034	0.896037181	0.937265967
	0.900471760	0.900123147	0.940051112
];

% Modify the colormap by interpolation to match number of waypoints.
cm = tools.interpolate(cm, n, varargin{:});

end
