//Maya ASCII 2018ff09 scene
//Name: interior_shaders.ma
//Last modified: Tue, Jul 21, 2020 12:22:25 AM
//Codeset: 1252
requires maya "2018ff09";
requires -nodeType "aiOptions" -nodeType "aiAOVDriver" -nodeType "aiAOVFilter" -nodeType "aiUtility"
		 -nodeType "aiStandardSurface" "mtoa" "4.0.3.1";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2018";
fileInfo "version" "2018";
fileInfo "cutIdentifier" "201903222215-65bada0e52";
fileInfo "osv" "Microsoft Windows 8 Home Premium Edition, 64-bit  (Build 9200)\n";
fileInfo "license" "student";
createNode transform -s -n "persp";
	rename -uid "A82A34F9-45DF-959C-2151-B18671F3C9D9";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 28 21 28 ;
	setAttr ".r" -type "double3" -27.938352729602379 44.999999999999972 -5.172681101354183e-14 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "126871AB-4AA7-827F-F0B3-3090E9F10647";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 44.82186966202994;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "52051B16-4F66-EC85-EA29-F0ABEABEB999";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "F84CA6CE-48EB-48FA-6AE4-61AD0FAD7436";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "30C53ADE-400D-323E-2507-DCB7A4BE7711";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "2FFE3B71-4E3B-3CD1-2B2A-9FB058EFBD48";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "E691D6E9-40F7-9E0C-F2AF-69BD2E0A07F7";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "7EC46825-47B7-7B6A-EB7D-80B26DDD96E3";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode place2dTexture -n "REC__place2dTexture178";
	rename -uid "A02F4ADE-4E7C-F2E0-E0E7-2F95AD90BA4B";
createNode place2dTexture -n "REC__place2dTexture177";
	rename -uid "95F1AD71-498E-4C21-CB79-CFA4CC65D723";
createNode place2dTexture -n "REC__place2dTexture179";
	rename -uid "63218B1D-4E53-5D72-A07E-3B942C7AA9D5";
createNode file -n "am215_interior_V1_001_1";
	rename -uid "33044A4C-4308-00B1-45F2-2592E4D57844";
	setAttr ".ftn" -type "string" "D:/AndreJukebox/MAYA//sourceimages/SETS/buildings/Textures_4096/am215_interior_V5_001.jpg";
	setAttr ".cs" -type "string" "Output - sRGB";
	setAttr ".ifr" yes;
createNode file -n "am215_interior_V3_001_1";
	rename -uid "1E70F437-45A6-B16B-DD19-FFA7807F501B";
	setAttr ".ftn" -type "string" "D:/AndreJukebox/MAYA//sourceimages/SETS/buildings/Textures_4096/am215_interior_V2_001.jpg";
	setAttr ".cs" -type "string" "Output - sRGB";
	setAttr ".ifr" yes;
createNode file -n "am215_interior_V4_001_1";
	rename -uid "FBF0847C-4E63-7983-1D8F-5E90A28B857E";
	setAttr ".ftn" -type "string" "D:/AndreJukebox/MAYA//sourceimages/SETS/buildings/Textures_4096/am215_interior_V3_001.jpg";
	setAttr ".cs" -type "string" "Output - sRGB";
	setAttr ".ifr" yes;
createNode place2dTexture -n "REC__place2dTexture181";
	rename -uid "FA527B7E-4E02-5FE7-1054-EABA70B5BBB2";
createNode file -n "am215_interior_V2_001_1";
	rename -uid "7AA54FFD-4B4B-629A-9B00-EA8FC4A0362F";
	setAttr ".ftn" -type "string" "D:/AndreJukebox/MAYA//sourceimages/SETS/buildings/Textures_4096/am215_interior_V4_001.jpg";
	setAttr ".cs" -type "string" "Output - sRGB";
	setAttr ".ifr" yes;
createNode file -n "am215_interior_V5_001_1";
	rename -uid "9ED06AC2-4F4D-6B60-8F1D-B3A7EE0B59D4";
	setAttr ".ftn" -type "string" "D:/AndreJukebox/MAYA//sourceimages/SETS/buildings/Textures_4096/am215_interior_V1_001.jpg";
	setAttr ".cs" -type "string" "Output - sRGB";
	setAttr ".ifr" yes;
createNode place2dTexture -n "REC__place2dTexture180";
	rename -uid "748345FE-4A9F-D12F-DEFC-6AB054A84A7E";
createNode aiUtility -n "am215_interior_V5_SHD";
	rename -uid "F4D37BBC-46A7-B844-D976-7D83ED43F989";
	setAttr ".shade_mode" 2;
createNode aiUtility -n "am215_interior_V2_SHD";
	rename -uid "7D4D0475-4276-F315-5C55-5A9B7F269055";
	setAttr ".shade_mode" 2;
createNode aiUtility -n "am215_interior_V1_SHD";
	rename -uid "CA95C2C2-43AD-EF30-8405-CD845B040B4D";
	setAttr ".shade_mode" 2;
createNode aiUtility -n "am215_interior_V3_SHD";
	rename -uid "840649C8-469C-1E16-1586-00B0308642F2";
	setAttr ".shade_mode" 2;
createNode file -n "AM215_Shop_interior_V1_1";
	rename -uid "21628E3C-4E1C-93E9-27DB-E3B3EF968651";
	setAttr ".ftn" -type "string" "D:/AndreJukebox/MAYA//sourceimages/SETS/buildings/Textures_4096/AM215_Shop_interior_V1.png";
	setAttr ".cs" -type "string" "ACES - ACES2065-1";
createNode aiUtility -n "am215_shop_interior_V1_SHD";
	rename -uid "E8F2D793-4843-182C-7FF8-27BF35350F5D";
createNode aiUtility -n "am215_interior_V4_SHD";
	rename -uid "1B039F0F-43EA-BD12-8BE1-CD8FACA726F7";
	setAttr ".shade_mode" 2;
createNode place2dTexture -n "place2dTexture226";
	rename -uid "9D418462-4CE8-24B6-B2CA-7D958B7C5E45";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "AA8CA331-4BAC-5947-3161-5B83678B5320";
	setAttr -s 18 ".lnk";
	setAttr -s 18 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "8EAEC3A1-44B4-1AC3-2BE5-5798CE6FC1CC";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "232389C5-4F5E-FFAB-36D7-78ADB28079E4";
createNode displayLayerManager -n "layerManager";
	rename -uid "FE759DDC-4A82-4A14-B24E-25802D6A3BC6";
createNode displayLayer -n "defaultLayer";
	rename -uid "CDC2C3B6-4964-45F0-3D46-3A88719E3018";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "E807AB5D-41AD-2221-7726-F0B2A6E5117A";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "AA05C2CB-43AB-BA9D-307C-CD8DCE84146F";
	setAttr ".g" yes;
createNode place2dTexture -n "place2dTexture205";
	rename -uid "CCE407DC-4C60-F0BE-7F89-2EB28D7B9AB6";
createNode place2dTexture -n "place2dTexture206";
	rename -uid "238AEE3B-4B7E-DBFE-95E5-ADB3ED9CFF18";
createNode file -n "AM215_props_Shop_exposition_V2_1";
	rename -uid "B9DD358C-42FF-F0B9-0BCB-F69592E38379";
	setAttr ".ftn" -type "string" "D:/AndreJukebox/MAYA//sourceimages/SETS/buildings/Textures_1024/AM215_props_Shop_exposition_V2.png";
	setAttr ".cs" -type "string" "Output - sRGB";
	setAttr ".ifr" yes;
createNode file -n "AM215_props_Shop_exposition_V1_1";
	rename -uid "5A08AAB9-4143-E4C2-8E75-FAA6D0D9A57C";
	setAttr ".ftn" -type "string" "D:/AndreJukebox/MAYA//sourceimages/SETS/buildings/Textures_1024/AM215_props_Shop_exposition_V1.png";
	setAttr ".cs" -type "string" "Output - sRGB";
	setAttr ".ifr" yes;
createNode file -n "AM215_props_Shop_exposition_V9_1";
	rename -uid "3CBB2373-40C6-0B51-F418-EF90F1EED4D9";
	setAttr ".ftn" -type "string" "D:/AndreJukebox/MAYA//sourceimages/SETS/buildings/Textures_1024/AM215_props_Shop_exposition_V9.png";
	setAttr ".cs" -type "string" "Output - sRGB";
	setAttr ".ifr" yes;
createNode place2dTexture -n "place2dTexture207";
	rename -uid "061BAB58-45EC-0A05-649C-F0B186817804";
createNode file -n "AM215_props_Shop_exposition_V3_1";
	rename -uid "3D5DA1CE-4997-72C6-8C84-11B7856B397F";
	setAttr ".ftn" -type "string" "D:/AndreJukebox/MAYA//sourceimages/SETS/buildings/Textures_1024/AM215_props_Shop_exposition_V3.png";
	setAttr ".cs" -type "string" "Output - sRGB";
	setAttr ".ifr" yes;
createNode place2dTexture -n "place2dTexture204";
	rename -uid "53689DA1-4022-3285-12BE-6D91BD7E733F";
createNode aiStandardSurface -n "AM215_props_Shop_exposition_V01_SHD";
	rename -uid "B1831F0B-463C-6588-AE28-0AB9A645648A";
	setAttr ".base" 1;
	setAttr ".specular" 0;
createNode aiStandardSurface -n "AM215_props_Shop_exposition_V03_SHD";
	rename -uid "9F194251-4FAB-F16E-292F-0DAFD358EE9D";
	setAttr ".base" 1;
	setAttr ".specular" 0;
createNode aiStandardSurface -n "AM215_props_Shop_exposition_V02_SHD";
	rename -uid "49F34F60-4DA8-EDF0-2C8A-61B190C12864";
	setAttr ".base" 1;
	setAttr ".specular" 0;
createNode aiStandardSurface -n "AM215_props_Shop_exposition_V09_SHD";
	rename -uid "AEC8368E-41E5-22A5-9CD9-3FB56095B7B9";
	setAttr ".base" 1;
	setAttr ".specular" 0;
createNode shadingEngine -n "AM215_props_Shop_exposition_V1_SHDSG";
	rename -uid "23EF8D54-44F0-B202-EE0B-E39294B87302";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode shadingEngine -n "AM215_props_Shop_exposition_V9_SHDSG";
	rename -uid "D11CEDC3-4217-DF7A-7AE0-92B79E99254F";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode shadingEngine -n "AM215_props_Shop_exposition_V2_SHDSG";
	rename -uid "9FFB72D2-443B-3F11-6AB4-5A8D539BD28E";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode shadingEngine -n "AM215_props_Shop_exposition_V3_SHDSG";
	rename -uid "5131A17D-4EA0-758A-8445-9CB09E8C4E4C";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo90";
	rename -uid "7E804788-4677-D80C-D6C9-52A3C202B4EA";
createNode materialInfo -n "materialInfo93";
	rename -uid "4EA87772-4746-CABD-5A79-7FBCAEE67817";
createNode materialInfo -n "materialInfo92";
	rename -uid "C07815E4-463D-AE87-F654-58A85A820148";
createNode materialInfo -n "materialInfo66";
	rename -uid "8E746458-4748-BFAD-59E8-0CA499F4207F";
createNode shadingEngine -n "AM215_props_Shop_exposition_V6_SHDSG";
	rename -uid "DEE876DF-4B1A-3C0F-33FC-D289A821E888";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode shadingEngine -n "AM215_props_Shop_exposition_V5_SHDSG";
	rename -uid "699610FB-4478-0906-5DD7-D6885E99B87A";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode aiStandardSurface -n "AM215_props_Shop_exposition_V06_SHD";
	rename -uid "D834032F-44DC-B182-14E0-84834B7755BC";
	setAttr ".base" 1;
	setAttr ".specular" 0;
createNode aiStandardSurface -n "AM215_props_Shop_exposition_V5_SHD";
	rename -uid "DA6D2639-4B2A-8F54-4EFC-DDB78F8AA445";
	setAttr ".base" 1;
	setAttr ".specular" 0;
createNode file -n "am215_props_Shop_exposition_V6_1";
	rename -uid "7F84A517-40D7-A91C-2D71-E18B9FFC6DAC";
	setAttr ".ftn" -type "string" "D:/AndreJukebox/MAYA//sourceimages/SETS/buildings/Textures_1024/am215_props_Shop_exposition_V6.png";
	setAttr ".cs" -type "string" "Utility - Raw";
createNode file -n "AM215_props_Shop_exposition_V5";
	rename -uid "54DBA5F1-4337-8878-9956-D3A794AACCEF";
	setAttr ".ftn" -type "string" "D:/AndreJukebox/MAYA//sourceimages/SETS/buildings/Textures_1024/AM215_props_Shop_exposition_V5.png";
	setAttr ".cs" -type "string" "Output - sRGB";
	setAttr ".ifr" yes;
createNode place2dTexture -n "place2dTexture194";
	rename -uid "2898C246-4A06-336D-DDB9-4682D1E27D76";
createNode place2dTexture -n "place2dTexture208";
	rename -uid "77D2068A-4470-AFFB-8384-73B5BC5678BB";
createNode materialInfo -n "materialInfo94";
	rename -uid "B01F28FA-4A98-B65F-615A-5680B7AC1C02";
createNode materialInfo -n "materialInfo95";
	rename -uid "6D824ED0-42B8-E287-A23A-1F8CFE29AAAD";
createNode script -n "uiConfigurationScriptNode";
	rename -uid "520AE5CD-49E5-27E7-70EE-0894825D6A26";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -docTag \"RADRENDER\" \n            -editorChanged \"DCF_updateViewportList;updateModelPanelBar\" \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n"
		+ "            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n"
		+ "            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n"
		+ "            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -docTag \"RADRENDER\" \n            -editorChanged \"DCF_updateViewportList;updateModelPanelBar\" \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n"
		+ "            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n"
		+ "            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n"
		+ "            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -docTag \"RADRENDER\" \n            -editorChanged \"DCF_updateViewportList;updateModelPanelBar\" \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n"
		+ "            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n"
		+ "            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n"
		+ "            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -docTag \"RADRENDER\" \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n"
		+ "            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 0\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 0\n            -nurbsCurves 0\n            -nurbsSurfaces 0\n            -polymeshes 1\n            -subdivSurfaces 0\n            -planes 0\n            -lights 0\n            -cameras 0\n"
		+ "            -controlVertices 0\n            -hulls 0\n            -grid 1\n            -imagePlane 0\n            -joints 0\n            -ikHandles 0\n            -deformers 0\n            -dynamics 0\n            -particleInstancers 0\n            -fluids 0\n            -hairSystems 0\n            -follicles 0\n            -nCloths 0\n            -nParticles 0\n            -nRigids 0\n            -dynamicConstraints 0\n            -locators 0\n            -manipulators 1\n            -pluginShapes 0\n            -dimensions 0\n            -handles 0\n            -pivots 0\n            -textures 0\n            -strokes 0\n            -motionTrails 0\n            -clipGhosts 0\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 896\n            -height 694\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 0 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n"
		+ "            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n"
		+ "            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n"
		+ "            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n"
		+ "            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n"
		+ "                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n"
		+ "                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n"
		+ "                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 1\n                -autoFitTime 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -showCurveNames 0\n                -showActiveCurveNames 0\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                -valueLinesToggle 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n"
		+ "                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n"
		+ "                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n"
		+ "                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n"
		+ "                -autoFitTime 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n"
		+ "                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n"
		+ "                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n"
		+ "                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n"
		+ "                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n"
		+ "\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -docTag \\\"RADRENDER\\\" \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 0\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 0\\n    -nurbsCurves 0\\n    -nurbsSurfaces 0\\n    -polymeshes 1\\n    -subdivSurfaces 0\\n    -planes 0\\n    -lights 0\\n    -cameras 0\\n    -controlVertices 0\\n    -hulls 0\\n    -grid 1\\n    -imagePlane 0\\n    -joints 0\\n    -ikHandles 0\\n    -deformers 0\\n    -dynamics 0\\n    -particleInstancers 0\\n    -fluids 0\\n    -hairSystems 0\\n    -follicles 0\\n    -nCloths 0\\n    -nParticles 0\\n    -nRigids 0\\n    -dynamicConstraints 0\\n    -locators 0\\n    -manipulators 1\\n    -pluginShapes 0\\n    -dimensions 0\\n    -handles 0\\n    -pivots 0\\n    -textures 0\\n    -strokes 0\\n    -motionTrails 0\\n    -clipGhosts 0\\n    -greasePencils 0\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 896\\n    -height 694\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 0 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -docTag \\\"RADRENDER\\\" \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 0\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 0\\n    -nurbsCurves 0\\n    -nurbsSurfaces 0\\n    -polymeshes 1\\n    -subdivSurfaces 0\\n    -planes 0\\n    -lights 0\\n    -cameras 0\\n    -controlVertices 0\\n    -hulls 0\\n    -grid 1\\n    -imagePlane 0\\n    -joints 0\\n    -ikHandles 0\\n    -deformers 0\\n    -dynamics 0\\n    -particleInstancers 0\\n    -fluids 0\\n    -hairSystems 0\\n    -follicles 0\\n    -nCloths 0\\n    -nParticles 0\\n    -nRigids 0\\n    -dynamicConstraints 0\\n    -locators 0\\n    -manipulators 1\\n    -pluginShapes 0\\n    -dimensions 0\\n    -handles 0\\n    -pivots 0\\n    -textures 0\\n    -strokes 0\\n    -motionTrails 0\\n    -clipGhosts 0\\n    -greasePencils 0\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 896\\n    -height 694\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 0 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "6BD2D46E-4084-5A14-574F-989359D9C8C7";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "90667285-4525-636E-17F4-178245DF2839";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -598.80950001497217 -747.7357871024135 ;
	setAttr ".tgi[0].vh" -type "double2" 558.333311147161 765.59292924997737 ;
	setAttr -s 6 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -484.28570556640625;
	setAttr ".tgi[0].ni[0].y" 651.4285888671875;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" 208.57142639160156;
	setAttr ".tgi[0].ni[1].y" -27.142856597900391;
	setAttr ".tgi[0].ni[1].nvs" 2387;
	setAttr ".tgi[0].ni[2].x" -177.14285278320313;
	setAttr ".tgi[0].ni[2].y" 674.28570556640625;
	setAttr ".tgi[0].ni[2].nvs" 1923;
	setAttr ".tgi[0].ni[3].x" -174.28572082519531;
	setAttr ".tgi[0].ni[3].y" -48.571430206298828;
	setAttr ".tgi[0].ni[3].nvs" 1923;
	setAttr ".tgi[0].ni[4].x" -481.42855834960938;
	setAttr ".tgi[0].ni[4].y" -71.428573608398438;
	setAttr ".tgi[0].ni[4].nvs" 1923;
	setAttr ".tgi[0].ni[5].x" 208.57142639160156;
	setAttr ".tgi[0].ni[5].y" 695.71429443359375;
	setAttr ".tgi[0].ni[5].nvs" 2387;
createNode place2dTexture -n "place2dTexture211";
	rename -uid "52E30E6B-4AA8-61EA-0F9D-0F981EA3BE9B";
createNode place2dTexture -n "place2dTexture209";
	rename -uid "5CB4A831-4DB7-C520-DFD3-5AA5D95B0124";
createNode file -n "am215_props_Shop_exposition_V4_1";
	rename -uid "32D66CEB-4AA1-07C6-A7DE-4AB21C181D35";
	setAttr ".ftn" -type "string" "D:/AndreJukebox/MAYA//sourceimages/SETS/buildings/Textures_1024/am215_props_Shop_exposition_V4.png";
	setAttr ".cs" -type "string" "Output - sRGB";
	setAttr ".ifr" yes;
createNode file -n "am215_props_Shop_exposition_V8_1";
	rename -uid "0BB13EFB-4C2F-AEF7-1630-62A89DAF812D";
	setAttr ".ftn" -type "string" "D:/AndreJukebox/MAYA//sourceimages/SETS/buildings/Textures_1024/am215_props_Shop_exposition_V8.png";
	setAttr ".cs" -type "string" "Output - sRGB";
createNode file -n "am215_props_Shop_exposition_V10_1";
	rename -uid "5C63BAAC-4A0C-4CA6-A986-1897338FB717";
	setAttr ".ftn" -type "string" "D:/AndreJukebox/MAYA//sourceimages/SETS/buildings/Textures_1024/am215_props_Shop_exposition_V10.png";
	setAttr ".cs" -type "string" "Output - sRGB";
	setAttr ".ifr" yes;
createNode place2dTexture -n "place2dTexture210";
	rename -uid "002DF525-4577-E175-968C-B891EF149E74";
createNode aiStandardSurface -n "AM215_props_Shop_exposition_V10_SHD";
	rename -uid "00D2C195-4D3F-F786-4FAD-5BA2DD97A0EB";
	setAttr ".base" 1;
	setAttr ".specular" 0;
createNode aiStandardSurface -n "AM215_props_Shop_exposition_V08_SHD";
	rename -uid "EF9EAFCB-403A-1A73-29CB-38BD852E80F7";
	setAttr ".base" 1;
	setAttr ".specular" 0;
createNode aiStandardSurface -n "AM215_props_Shop_exposition_V04_SHD";
	rename -uid "D73A79FA-421E-AC18-F895-CC92034CCB60";
	setAttr ".base" 1;
	setAttr ".specular" 0;
createNode shadingEngine -n "AM215_props_Shop_exposition_V4_SHDSG";
	rename -uid "F470B308-42A4-5129-725D-75BAA2E026E6";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode shadingEngine -n "AM215_props_Shop_exposition_V8_SHDSG";
	rename -uid "5E5AC9E1-411C-F40D-159F-DF98758F4367";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode shadingEngine -n "AM215_props_Shop_exposition_V10_SHDSG";
	rename -uid "D0A4D9DB-481D-8458-5A04-AB8717C95C5A";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo96";
	rename -uid "D70A220C-427F-DE3D-2DCD-9FA698EBB7E6";
createNode materialInfo -n "materialInfo97";
	rename -uid "55835185-4FF1-EAC8-2A6E-9FA05C907696";
createNode materialInfo -n "materialInfo98";
	rename -uid "F003B39F-4075-7B3C-2FC9-87A9F1C91571";
createNode file -n "AM215_props_Shop_exposition_V7_1";
	rename -uid "72972C5F-46A8-E49C-9BCD-3E95496D3508";
	setAttr ".ftn" -type "string" "D:/AndreJukebox/MAYA//sourceimages/SETS/buildings/Textures_1024/AM215_props_Shop_exposition_V7.png";
	setAttr ".cs" -type "string" "Output - sRGB";
	setAttr ".ifr" yes;
createNode place2dTexture -n "place2dTexture212";
	rename -uid "F7C296A5-4B7F-EB94-1B2E-1A818B0FBB05";
createNode aiStandardSurface -n "AM215_props_Shop_exposition_V07_SHD";
	rename -uid "D6A58EAD-4ABE-156A-3364-01AE293EFFC2";
	setAttr ".base" 1;
	setAttr ".specular" 0;
createNode shadingEngine -n "AM215_props_Shop_exposition_V7_SHDSG";
	rename -uid "8A601F9B-4E31-FA9F-A678-5195EF6E8114";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo99";
	rename -uid "4A9AD6E1-4E64-3BE8-944E-2CB02E8C1804";
createNode aiOptions -s -n "defaultArnoldRenderOptions";
	rename -uid "DF961523-46F5-87B4-B394-5EAB972D519A";
	setAttr ".version" -type "string" "4.0.3.1";
createNode aiAOVFilter -s -n "defaultArnoldFilter";
	rename -uid "45C223BE-4A65-3273-06E5-C992DFEE9337";
createNode aiAOVDriver -s -n "defaultArnoldDriver";
	rename -uid "DFF4A194-4F78-A4BB-F70D-EA8AA248A68A";
createNode aiAOVDriver -s -n "defaultArnoldDisplayDriver";
	rename -uid "67454EE1-410F-A81B-80E2-35B024A21CAE";
	setAttr ".output_mode" 0;
	setAttr ".ai_translator" -type "string" "maya";
createNode shadingEngine -n "am215_interior_V1_SHDSG";
	rename -uid "AA7C29AF-43BC-1F86-2293-0D8252EDC3CA";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "pasted__materialInfo98";
	rename -uid "EA9C1385-4E41-6CA1-5387-64B42D4A3460";
createNode shadingEngine -n "am215_interior_V2_SHDSG";
	rename -uid "2D548D37-4AAE-F229-4B2C-2C9E02219C42";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "pasted__pasted__materialInfo98";
	rename -uid "89D2E6AD-49EE-7B8F-DE3B-05BA73B63CE5";
createNode shadingEngine -n "am215_interior_V3_SHDSG";
	rename -uid "755F7501-475F-8A05-2548-53808A670520";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "pasted__pasted__materialInfo99";
	rename -uid "98800B37-45E1-7262-57AB-0FAF455703C0";
createNode shadingEngine -n "am215_interior_V4_SHDSG";
	rename -uid "C096C9F6-48CD-07C2-A268-4C92E93BD08E";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "pasted__pasted__materialInfo100";
	rename -uid "832A1416-4FCF-B74E-3DD8-79813074D718";
createNode shadingEngine -n "am215_interior_V5_SHDSG";
	rename -uid "1D29EE74-4FF7-A235-244F-D68D11BC1BD9";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "pasted__pasted__materialInfo101";
	rename -uid "B2E7CACA-43CF-8911-755C-2EBE8695CF53";
createNode shadingEngine -n "AM215_Shop_interior_V1_SHDSG";
	rename -uid "B9D4FF64-44DE-2E6E-FD1A-C8B1F8B954A4";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "pasted__pasted__materialInfo102";
	rename -uid "AF0D7E83-490B-D563-D662-C392D3EC1087";
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo1";
	rename -uid "E9B49C8E-4B11-A06D-5274-8EB2826E91CB";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" 2891.6069146238965 2825.5908339299322 ;
	setAttr ".tgi[0].vh" -type "double2" 4235.4568385787206 3605.3894632724259 ;
	setAttr -s 4 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 3620;
	setAttr ".tgi[0].ni[0].y" 3290;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" 3927.142822265625;
	setAttr ".tgi[0].ni[1].y" 3267.142822265625;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" 3312.857177734375;
	setAttr ".tgi[0].ni[2].y" 3290;
	setAttr ".tgi[0].ni[2].nvs" 1923;
	setAttr ".tgi[0].ni[3].x" 3005.71435546875;
	setAttr ".tgi[0].ni[3].y" 3267.142822265625;
	setAttr ".tgi[0].ni[3].nvs" 1923;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 18 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 20 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 16 ".u";
select -ne :defaultRenderingList1;
select -ne :defaultTextureList1;
	setAttr -s 16 ".tx";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :defaultColorMgtGlobals;
	setAttr ".cme" no;
	setAttr ".cfp" -type "string" "C:/FileManager/OCIO/aces_1.0.3/config.ocio";
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
connectAttr ":defaultColorMgtGlobals.cme" "am215_interior_V1_001_1.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "am215_interior_V1_001_1.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "am215_interior_V1_001_1.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "am215_interior_V1_001_1.ws";
connectAttr "REC__place2dTexture177.c" "am215_interior_V1_001_1.c";
connectAttr "REC__place2dTexture177.tf" "am215_interior_V1_001_1.tf";
connectAttr "REC__place2dTexture177.rf" "am215_interior_V1_001_1.rf";
connectAttr "REC__place2dTexture177.mu" "am215_interior_V1_001_1.mu";
connectAttr "REC__place2dTexture177.mv" "am215_interior_V1_001_1.mv";
connectAttr "REC__place2dTexture177.s" "am215_interior_V1_001_1.s";
connectAttr "REC__place2dTexture177.wu" "am215_interior_V1_001_1.wu";
connectAttr "REC__place2dTexture177.wv" "am215_interior_V1_001_1.wv";
connectAttr "REC__place2dTexture177.re" "am215_interior_V1_001_1.re";
connectAttr "REC__place2dTexture177.of" "am215_interior_V1_001_1.of";
connectAttr "REC__place2dTexture177.r" "am215_interior_V1_001_1.ro";
connectAttr "REC__place2dTexture177.n" "am215_interior_V1_001_1.n";
connectAttr "REC__place2dTexture177.vt1" "am215_interior_V1_001_1.vt1";
connectAttr "REC__place2dTexture177.vt2" "am215_interior_V1_001_1.vt2";
connectAttr "REC__place2dTexture177.vt3" "am215_interior_V1_001_1.vt3";
connectAttr "REC__place2dTexture177.vc1" "am215_interior_V1_001_1.vc1";
connectAttr "REC__place2dTexture177.o" "am215_interior_V1_001_1.uv";
connectAttr "REC__place2dTexture177.ofs" "am215_interior_V1_001_1.fs";
connectAttr ":defaultColorMgtGlobals.cme" "am215_interior_V3_001_1.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "am215_interior_V3_001_1.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "am215_interior_V3_001_1.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "am215_interior_V3_001_1.ws";
connectAttr "REC__place2dTexture178.c" "am215_interior_V3_001_1.c";
connectAttr "REC__place2dTexture178.tf" "am215_interior_V3_001_1.tf";
connectAttr "REC__place2dTexture178.rf" "am215_interior_V3_001_1.rf";
connectAttr "REC__place2dTexture178.mu" "am215_interior_V3_001_1.mu";
connectAttr "REC__place2dTexture178.mv" "am215_interior_V3_001_1.mv";
connectAttr "REC__place2dTexture178.s" "am215_interior_V3_001_1.s";
connectAttr "REC__place2dTexture178.wu" "am215_interior_V3_001_1.wu";
connectAttr "REC__place2dTexture178.wv" "am215_interior_V3_001_1.wv";
connectAttr "REC__place2dTexture178.re" "am215_interior_V3_001_1.re";
connectAttr "REC__place2dTexture178.of" "am215_interior_V3_001_1.of";
connectAttr "REC__place2dTexture178.r" "am215_interior_V3_001_1.ro";
connectAttr "REC__place2dTexture178.n" "am215_interior_V3_001_1.n";
connectAttr "REC__place2dTexture178.vt1" "am215_interior_V3_001_1.vt1";
connectAttr "REC__place2dTexture178.vt2" "am215_interior_V3_001_1.vt2";
connectAttr "REC__place2dTexture178.vt3" "am215_interior_V3_001_1.vt3";
connectAttr "REC__place2dTexture178.vc1" "am215_interior_V3_001_1.vc1";
connectAttr "REC__place2dTexture178.o" "am215_interior_V3_001_1.uv";
connectAttr "REC__place2dTexture178.ofs" "am215_interior_V3_001_1.fs";
connectAttr ":defaultColorMgtGlobals.cme" "am215_interior_V4_001_1.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "am215_interior_V4_001_1.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "am215_interior_V4_001_1.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "am215_interior_V4_001_1.ws";
connectAttr "REC__place2dTexture179.c" "am215_interior_V4_001_1.c";
connectAttr "REC__place2dTexture179.tf" "am215_interior_V4_001_1.tf";
connectAttr "REC__place2dTexture179.rf" "am215_interior_V4_001_1.rf";
connectAttr "REC__place2dTexture179.mu" "am215_interior_V4_001_1.mu";
connectAttr "REC__place2dTexture179.mv" "am215_interior_V4_001_1.mv";
connectAttr "REC__place2dTexture179.s" "am215_interior_V4_001_1.s";
connectAttr "REC__place2dTexture179.wu" "am215_interior_V4_001_1.wu";
connectAttr "REC__place2dTexture179.wv" "am215_interior_V4_001_1.wv";
connectAttr "REC__place2dTexture179.re" "am215_interior_V4_001_1.re";
connectAttr "REC__place2dTexture179.of" "am215_interior_V4_001_1.of";
connectAttr "REC__place2dTexture179.r" "am215_interior_V4_001_1.ro";
connectAttr "REC__place2dTexture179.n" "am215_interior_V4_001_1.n";
connectAttr "REC__place2dTexture179.vt1" "am215_interior_V4_001_1.vt1";
connectAttr "REC__place2dTexture179.vt2" "am215_interior_V4_001_1.vt2";
connectAttr "REC__place2dTexture179.vt3" "am215_interior_V4_001_1.vt3";
connectAttr "REC__place2dTexture179.vc1" "am215_interior_V4_001_1.vc1";
connectAttr "REC__place2dTexture179.o" "am215_interior_V4_001_1.uv";
connectAttr "REC__place2dTexture179.ofs" "am215_interior_V4_001_1.fs";
connectAttr ":defaultColorMgtGlobals.cme" "am215_interior_V2_001_1.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "am215_interior_V2_001_1.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "am215_interior_V2_001_1.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "am215_interior_V2_001_1.ws";
connectAttr "REC__place2dTexture181.c" "am215_interior_V2_001_1.c";
connectAttr "REC__place2dTexture181.tf" "am215_interior_V2_001_1.tf";
connectAttr "REC__place2dTexture181.rf" "am215_interior_V2_001_1.rf";
connectAttr "REC__place2dTexture181.mu" "am215_interior_V2_001_1.mu";
connectAttr "REC__place2dTexture181.mv" "am215_interior_V2_001_1.mv";
connectAttr "REC__place2dTexture181.s" "am215_interior_V2_001_1.s";
connectAttr "REC__place2dTexture181.wu" "am215_interior_V2_001_1.wu";
connectAttr "REC__place2dTexture181.wv" "am215_interior_V2_001_1.wv";
connectAttr "REC__place2dTexture181.re" "am215_interior_V2_001_1.re";
connectAttr "REC__place2dTexture181.of" "am215_interior_V2_001_1.of";
connectAttr "REC__place2dTexture181.r" "am215_interior_V2_001_1.ro";
connectAttr "REC__place2dTexture181.n" "am215_interior_V2_001_1.n";
connectAttr "REC__place2dTexture181.vt1" "am215_interior_V2_001_1.vt1";
connectAttr "REC__place2dTexture181.vt2" "am215_interior_V2_001_1.vt2";
connectAttr "REC__place2dTexture181.vt3" "am215_interior_V2_001_1.vt3";
connectAttr "REC__place2dTexture181.vc1" "am215_interior_V2_001_1.vc1";
connectAttr "REC__place2dTexture181.o" "am215_interior_V2_001_1.uv";
connectAttr "REC__place2dTexture181.ofs" "am215_interior_V2_001_1.fs";
connectAttr ":defaultColorMgtGlobals.cme" "am215_interior_V5_001_1.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "am215_interior_V5_001_1.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "am215_interior_V5_001_1.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "am215_interior_V5_001_1.ws";
connectAttr "REC__place2dTexture180.c" "am215_interior_V5_001_1.c";
connectAttr "REC__place2dTexture180.tf" "am215_interior_V5_001_1.tf";
connectAttr "REC__place2dTexture180.rf" "am215_interior_V5_001_1.rf";
connectAttr "REC__place2dTexture180.mu" "am215_interior_V5_001_1.mu";
connectAttr "REC__place2dTexture180.mv" "am215_interior_V5_001_1.mv";
connectAttr "REC__place2dTexture180.s" "am215_interior_V5_001_1.s";
connectAttr "REC__place2dTexture180.wu" "am215_interior_V5_001_1.wu";
connectAttr "REC__place2dTexture180.wv" "am215_interior_V5_001_1.wv";
connectAttr "REC__place2dTexture180.re" "am215_interior_V5_001_1.re";
connectAttr "REC__place2dTexture180.of" "am215_interior_V5_001_1.of";
connectAttr "REC__place2dTexture180.r" "am215_interior_V5_001_1.ro";
connectAttr "REC__place2dTexture180.n" "am215_interior_V5_001_1.n";
connectAttr "REC__place2dTexture180.vt1" "am215_interior_V5_001_1.vt1";
connectAttr "REC__place2dTexture180.vt2" "am215_interior_V5_001_1.vt2";
connectAttr "REC__place2dTexture180.vt3" "am215_interior_V5_001_1.vt3";
connectAttr "REC__place2dTexture180.vc1" "am215_interior_V5_001_1.vc1";
connectAttr "REC__place2dTexture180.o" "am215_interior_V5_001_1.uv";
connectAttr "REC__place2dTexture180.ofs" "am215_interior_V5_001_1.fs";
connectAttr "am215_interior_V5_001_1.oc" "am215_interior_V5_SHD.color";
connectAttr "am215_interior_V2_001_1.oc" "am215_interior_V2_SHD.color";
connectAttr "am215_interior_V1_001_1.oc" "am215_interior_V1_SHD.color";
connectAttr "am215_interior_V3_001_1.oc" "am215_interior_V3_SHD.color";
connectAttr ":defaultColorMgtGlobals.cme" "AM215_Shop_interior_V1_1.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "AM215_Shop_interior_V1_1.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "AM215_Shop_interior_V1_1.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "AM215_Shop_interior_V1_1.ws";
connectAttr "place2dTexture226.c" "AM215_Shop_interior_V1_1.c";
connectAttr "place2dTexture226.tf" "AM215_Shop_interior_V1_1.tf";
connectAttr "place2dTexture226.rf" "AM215_Shop_interior_V1_1.rf";
connectAttr "place2dTexture226.mu" "AM215_Shop_interior_V1_1.mu";
connectAttr "place2dTexture226.mv" "AM215_Shop_interior_V1_1.mv";
connectAttr "place2dTexture226.s" "AM215_Shop_interior_V1_1.s";
connectAttr "place2dTexture226.wu" "AM215_Shop_interior_V1_1.wu";
connectAttr "place2dTexture226.wv" "AM215_Shop_interior_V1_1.wv";
connectAttr "place2dTexture226.re" "AM215_Shop_interior_V1_1.re";
connectAttr "place2dTexture226.of" "AM215_Shop_interior_V1_1.of";
connectAttr "place2dTexture226.r" "AM215_Shop_interior_V1_1.ro";
connectAttr "place2dTexture226.n" "AM215_Shop_interior_V1_1.n";
connectAttr "place2dTexture226.vt1" "AM215_Shop_interior_V1_1.vt1";
connectAttr "place2dTexture226.vt2" "AM215_Shop_interior_V1_1.vt2";
connectAttr "place2dTexture226.vt3" "AM215_Shop_interior_V1_1.vt3";
connectAttr "place2dTexture226.vc1" "AM215_Shop_interior_V1_1.vc1";
connectAttr "place2dTexture226.o" "AM215_Shop_interior_V1_1.uv";
connectAttr "place2dTexture226.ofs" "AM215_Shop_interior_V1_1.fs";
connectAttr "AM215_Shop_interior_V1_1.oc" "am215_shop_interior_V1_SHD.color";
connectAttr "am215_interior_V4_001_1.oc" "am215_interior_V4_SHD.color";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "AM215_props_Shop_exposition_V3_SHDSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "AM215_props_Shop_exposition_V1_SHDSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "AM215_props_Shop_exposition_V2_SHDSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "AM215_props_Shop_exposition_V9_SHDSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "AM215_props_Shop_exposition_V6_SHDSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "AM215_props_Shop_exposition_V5_SHDSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "AM215_props_Shop_exposition_V4_SHDSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "AM215_props_Shop_exposition_V8_SHDSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "AM215_props_Shop_exposition_V10_SHDSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "AM215_props_Shop_exposition_V7_SHDSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "am215_interior_V1_SHDSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "am215_interior_V2_SHDSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "am215_interior_V3_SHDSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "am215_interior_V4_SHDSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "am215_interior_V5_SHDSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "AM215_Shop_interior_V1_SHDSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "AM215_props_Shop_exposition_V3_SHDSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "AM215_props_Shop_exposition_V1_SHDSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "AM215_props_Shop_exposition_V2_SHDSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "AM215_props_Shop_exposition_V9_SHDSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "AM215_props_Shop_exposition_V6_SHDSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "AM215_props_Shop_exposition_V5_SHDSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "AM215_props_Shop_exposition_V4_SHDSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "AM215_props_Shop_exposition_V8_SHDSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "AM215_props_Shop_exposition_V10_SHDSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "AM215_props_Shop_exposition_V7_SHDSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "am215_interior_V1_SHDSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "am215_interior_V2_SHDSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "am215_interior_V3_SHDSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "am215_interior_V4_SHDSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "am215_interior_V5_SHDSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "AM215_Shop_interior_V1_SHDSG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr ":defaultColorMgtGlobals.cme" "AM215_props_Shop_exposition_V2_1.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "AM215_props_Shop_exposition_V2_1.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "AM215_props_Shop_exposition_V2_1.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "AM215_props_Shop_exposition_V2_1.ws";
connectAttr "place2dTexture206.c" "AM215_props_Shop_exposition_V2_1.c";
connectAttr "place2dTexture206.tf" "AM215_props_Shop_exposition_V2_1.tf";
connectAttr "place2dTexture206.rf" "AM215_props_Shop_exposition_V2_1.rf";
connectAttr "place2dTexture206.mu" "AM215_props_Shop_exposition_V2_1.mu";
connectAttr "place2dTexture206.mv" "AM215_props_Shop_exposition_V2_1.mv";
connectAttr "place2dTexture206.s" "AM215_props_Shop_exposition_V2_1.s";
connectAttr "place2dTexture206.wu" "AM215_props_Shop_exposition_V2_1.wu";
connectAttr "place2dTexture206.wv" "AM215_props_Shop_exposition_V2_1.wv";
connectAttr "place2dTexture206.re" "AM215_props_Shop_exposition_V2_1.re";
connectAttr "place2dTexture206.of" "AM215_props_Shop_exposition_V2_1.of";
connectAttr "place2dTexture206.r" "AM215_props_Shop_exposition_V2_1.ro";
connectAttr "place2dTexture206.n" "AM215_props_Shop_exposition_V2_1.n";
connectAttr "place2dTexture206.vt1" "AM215_props_Shop_exposition_V2_1.vt1";
connectAttr "place2dTexture206.vt2" "AM215_props_Shop_exposition_V2_1.vt2";
connectAttr "place2dTexture206.vt3" "AM215_props_Shop_exposition_V2_1.vt3";
connectAttr "place2dTexture206.vc1" "AM215_props_Shop_exposition_V2_1.vc1";
connectAttr "place2dTexture206.o" "AM215_props_Shop_exposition_V2_1.uv";
connectAttr "place2dTexture206.ofs" "AM215_props_Shop_exposition_V2_1.fs";
connectAttr ":defaultColorMgtGlobals.cme" "AM215_props_Shop_exposition_V1_1.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "AM215_props_Shop_exposition_V1_1.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "AM215_props_Shop_exposition_V1_1.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "AM215_props_Shop_exposition_V1_1.ws";
connectAttr "place2dTexture205.c" "AM215_props_Shop_exposition_V1_1.c";
connectAttr "place2dTexture205.tf" "AM215_props_Shop_exposition_V1_1.tf";
connectAttr "place2dTexture205.rf" "AM215_props_Shop_exposition_V1_1.rf";
connectAttr "place2dTexture205.mu" "AM215_props_Shop_exposition_V1_1.mu";
connectAttr "place2dTexture205.mv" "AM215_props_Shop_exposition_V1_1.mv";
connectAttr "place2dTexture205.s" "AM215_props_Shop_exposition_V1_1.s";
connectAttr "place2dTexture205.wu" "AM215_props_Shop_exposition_V1_1.wu";
connectAttr "place2dTexture205.wv" "AM215_props_Shop_exposition_V1_1.wv";
connectAttr "place2dTexture205.re" "AM215_props_Shop_exposition_V1_1.re";
connectAttr "place2dTexture205.of" "AM215_props_Shop_exposition_V1_1.of";
connectAttr "place2dTexture205.r" "AM215_props_Shop_exposition_V1_1.ro";
connectAttr "place2dTexture205.n" "AM215_props_Shop_exposition_V1_1.n";
connectAttr "place2dTexture205.vt1" "AM215_props_Shop_exposition_V1_1.vt1";
connectAttr "place2dTexture205.vt2" "AM215_props_Shop_exposition_V1_1.vt2";
connectAttr "place2dTexture205.vt3" "AM215_props_Shop_exposition_V1_1.vt3";
connectAttr "place2dTexture205.vc1" "AM215_props_Shop_exposition_V1_1.vc1";
connectAttr "place2dTexture205.o" "AM215_props_Shop_exposition_V1_1.uv";
connectAttr "place2dTexture205.ofs" "AM215_props_Shop_exposition_V1_1.fs";
connectAttr ":defaultColorMgtGlobals.cme" "AM215_props_Shop_exposition_V9_1.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "AM215_props_Shop_exposition_V9_1.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "AM215_props_Shop_exposition_V9_1.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "AM215_props_Shop_exposition_V9_1.ws";
connectAttr "place2dTexture207.c" "AM215_props_Shop_exposition_V9_1.c";
connectAttr "place2dTexture207.tf" "AM215_props_Shop_exposition_V9_1.tf";
connectAttr "place2dTexture207.rf" "AM215_props_Shop_exposition_V9_1.rf";
connectAttr "place2dTexture207.mu" "AM215_props_Shop_exposition_V9_1.mu";
connectAttr "place2dTexture207.mv" "AM215_props_Shop_exposition_V9_1.mv";
connectAttr "place2dTexture207.s" "AM215_props_Shop_exposition_V9_1.s";
connectAttr "place2dTexture207.wu" "AM215_props_Shop_exposition_V9_1.wu";
connectAttr "place2dTexture207.wv" "AM215_props_Shop_exposition_V9_1.wv";
connectAttr "place2dTexture207.re" "AM215_props_Shop_exposition_V9_1.re";
connectAttr "place2dTexture207.of" "AM215_props_Shop_exposition_V9_1.of";
connectAttr "place2dTexture207.r" "AM215_props_Shop_exposition_V9_1.ro";
connectAttr "place2dTexture207.n" "AM215_props_Shop_exposition_V9_1.n";
connectAttr "place2dTexture207.vt1" "AM215_props_Shop_exposition_V9_1.vt1";
connectAttr "place2dTexture207.vt2" "AM215_props_Shop_exposition_V9_1.vt2";
connectAttr "place2dTexture207.vt3" "AM215_props_Shop_exposition_V9_1.vt3";
connectAttr "place2dTexture207.vc1" "AM215_props_Shop_exposition_V9_1.vc1";
connectAttr "place2dTexture207.o" "AM215_props_Shop_exposition_V9_1.uv";
connectAttr "place2dTexture207.ofs" "AM215_props_Shop_exposition_V9_1.fs";
connectAttr ":defaultColorMgtGlobals.cme" "AM215_props_Shop_exposition_V3_1.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "AM215_props_Shop_exposition_V3_1.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "AM215_props_Shop_exposition_V3_1.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "AM215_props_Shop_exposition_V3_1.ws";
connectAttr "place2dTexture204.c" "AM215_props_Shop_exposition_V3_1.c";
connectAttr "place2dTexture204.tf" "AM215_props_Shop_exposition_V3_1.tf";
connectAttr "place2dTexture204.rf" "AM215_props_Shop_exposition_V3_1.rf";
connectAttr "place2dTexture204.mu" "AM215_props_Shop_exposition_V3_1.mu";
connectAttr "place2dTexture204.mv" "AM215_props_Shop_exposition_V3_1.mv";
connectAttr "place2dTexture204.s" "AM215_props_Shop_exposition_V3_1.s";
connectAttr "place2dTexture204.wu" "AM215_props_Shop_exposition_V3_1.wu";
connectAttr "place2dTexture204.wv" "AM215_props_Shop_exposition_V3_1.wv";
connectAttr "place2dTexture204.re" "AM215_props_Shop_exposition_V3_1.re";
connectAttr "place2dTexture204.of" "AM215_props_Shop_exposition_V3_1.of";
connectAttr "place2dTexture204.r" "AM215_props_Shop_exposition_V3_1.ro";
connectAttr "place2dTexture204.n" "AM215_props_Shop_exposition_V3_1.n";
connectAttr "place2dTexture204.vt1" "AM215_props_Shop_exposition_V3_1.vt1";
connectAttr "place2dTexture204.vt2" "AM215_props_Shop_exposition_V3_1.vt2";
connectAttr "place2dTexture204.vt3" "AM215_props_Shop_exposition_V3_1.vt3";
connectAttr "place2dTexture204.vc1" "AM215_props_Shop_exposition_V3_1.vc1";
connectAttr "place2dTexture204.o" "AM215_props_Shop_exposition_V3_1.uv";
connectAttr "place2dTexture204.ofs" "AM215_props_Shop_exposition_V3_1.fs";
connectAttr "AM215_props_Shop_exposition_V1_1.oc" "AM215_props_Shop_exposition_V01_SHD.base_color"
		;
connectAttr "AM215_props_Shop_exposition_V3_1.oc" "AM215_props_Shop_exposition_V03_SHD.base_color"
		;
connectAttr "AM215_props_Shop_exposition_V2_1.oc" "AM215_props_Shop_exposition_V02_SHD.base_color"
		;
connectAttr "AM215_props_Shop_exposition_V9_1.oc" "AM215_props_Shop_exposition_V09_SHD.base_color"
		;
connectAttr "AM215_props_Shop_exposition_V01_SHD.out" "AM215_props_Shop_exposition_V1_SHDSG.ss"
		;
connectAttr "AM215_props_Shop_exposition_V09_SHD.out" "AM215_props_Shop_exposition_V9_SHDSG.ss"
		;
connectAttr "AM215_props_Shop_exposition_V02_SHD.out" "AM215_props_Shop_exposition_V2_SHDSG.ss"
		;
connectAttr "AM215_props_Shop_exposition_V03_SHD.out" "AM215_props_Shop_exposition_V3_SHDSG.ss"
		;
connectAttr "AM215_props_Shop_exposition_V1_SHDSG.msg" "materialInfo90.sg";
connectAttr "AM215_props_Shop_exposition_V01_SHD.msg" "materialInfo90.m";
connectAttr "AM215_props_Shop_exposition_V1_1.msg" "materialInfo90.t" -na;
connectAttr "AM215_props_Shop_exposition_V9_SHDSG.msg" "materialInfo93.sg";
connectAttr "AM215_props_Shop_exposition_V09_SHD.msg" "materialInfo93.m";
connectAttr "AM215_props_Shop_exposition_V9_1.msg" "materialInfo93.t" -na;
connectAttr "AM215_props_Shop_exposition_V2_SHDSG.msg" "materialInfo92.sg";
connectAttr "AM215_props_Shop_exposition_V02_SHD.msg" "materialInfo92.m";
connectAttr "AM215_props_Shop_exposition_V2_1.msg" "materialInfo92.t" -na;
connectAttr "AM215_props_Shop_exposition_V3_SHDSG.msg" "materialInfo66.sg";
connectAttr "AM215_props_Shop_exposition_V03_SHD.msg" "materialInfo66.m";
connectAttr "AM215_props_Shop_exposition_V3_1.msg" "materialInfo66.t" -na;
connectAttr "AM215_props_Shop_exposition_V06_SHD.out" "AM215_props_Shop_exposition_V6_SHDSG.ss"
		;
connectAttr "AM215_props_Shop_exposition_V5_SHD.out" "AM215_props_Shop_exposition_V5_SHDSG.ss"
		;
connectAttr "am215_props_Shop_exposition_V6_1.oc" "AM215_props_Shop_exposition_V06_SHD.base_color"
		;
connectAttr "AM215_props_Shop_exposition_V5.oc" "AM215_props_Shop_exposition_V5_SHD.base_color"
		;
connectAttr ":defaultColorMgtGlobals.cme" "am215_props_Shop_exposition_V6_1.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "am215_props_Shop_exposition_V6_1.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "am215_props_Shop_exposition_V6_1.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "am215_props_Shop_exposition_V6_1.ws";
connectAttr "place2dTexture194.c" "am215_props_Shop_exposition_V6_1.c";
connectAttr "place2dTexture194.tf" "am215_props_Shop_exposition_V6_1.tf";
connectAttr "place2dTexture194.rf" "am215_props_Shop_exposition_V6_1.rf";
connectAttr "place2dTexture194.mu" "am215_props_Shop_exposition_V6_1.mu";
connectAttr "place2dTexture194.mv" "am215_props_Shop_exposition_V6_1.mv";
connectAttr "place2dTexture194.s" "am215_props_Shop_exposition_V6_1.s";
connectAttr "place2dTexture194.wu" "am215_props_Shop_exposition_V6_1.wu";
connectAttr "place2dTexture194.wv" "am215_props_Shop_exposition_V6_1.wv";
connectAttr "place2dTexture194.re" "am215_props_Shop_exposition_V6_1.re";
connectAttr "place2dTexture194.of" "am215_props_Shop_exposition_V6_1.of";
connectAttr "place2dTexture194.r" "am215_props_Shop_exposition_V6_1.ro";
connectAttr "place2dTexture194.n" "am215_props_Shop_exposition_V6_1.n";
connectAttr "place2dTexture194.vt1" "am215_props_Shop_exposition_V6_1.vt1";
connectAttr "place2dTexture194.vt2" "am215_props_Shop_exposition_V6_1.vt2";
connectAttr "place2dTexture194.vt3" "am215_props_Shop_exposition_V6_1.vt3";
connectAttr "place2dTexture194.vc1" "am215_props_Shop_exposition_V6_1.vc1";
connectAttr "place2dTexture194.o" "am215_props_Shop_exposition_V6_1.uv";
connectAttr "place2dTexture194.ofs" "am215_props_Shop_exposition_V6_1.fs";
connectAttr ":defaultColorMgtGlobals.cme" "AM215_props_Shop_exposition_V5.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "AM215_props_Shop_exposition_V5.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "AM215_props_Shop_exposition_V5.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "AM215_props_Shop_exposition_V5.ws";
connectAttr "place2dTexture208.c" "AM215_props_Shop_exposition_V5.c";
connectAttr "place2dTexture208.tf" "AM215_props_Shop_exposition_V5.tf";
connectAttr "place2dTexture208.rf" "AM215_props_Shop_exposition_V5.rf";
connectAttr "place2dTexture208.mu" "AM215_props_Shop_exposition_V5.mu";
connectAttr "place2dTexture208.mv" "AM215_props_Shop_exposition_V5.mv";
connectAttr "place2dTexture208.s" "AM215_props_Shop_exposition_V5.s";
connectAttr "place2dTexture208.wu" "AM215_props_Shop_exposition_V5.wu";
connectAttr "place2dTexture208.wv" "AM215_props_Shop_exposition_V5.wv";
connectAttr "place2dTexture208.re" "AM215_props_Shop_exposition_V5.re";
connectAttr "place2dTexture208.of" "AM215_props_Shop_exposition_V5.of";
connectAttr "place2dTexture208.r" "AM215_props_Shop_exposition_V5.ro";
connectAttr "place2dTexture208.n" "AM215_props_Shop_exposition_V5.n";
connectAttr "place2dTexture208.vt1" "AM215_props_Shop_exposition_V5.vt1";
connectAttr "place2dTexture208.vt2" "AM215_props_Shop_exposition_V5.vt2";
connectAttr "place2dTexture208.vt3" "AM215_props_Shop_exposition_V5.vt3";
connectAttr "place2dTexture208.vc1" "AM215_props_Shop_exposition_V5.vc1";
connectAttr "place2dTexture208.o" "AM215_props_Shop_exposition_V5.uv";
connectAttr "place2dTexture208.ofs" "AM215_props_Shop_exposition_V5.fs";
connectAttr "AM215_props_Shop_exposition_V6_SHDSG.msg" "materialInfo94.sg";
connectAttr "AM215_props_Shop_exposition_V06_SHD.msg" "materialInfo94.m";
connectAttr "am215_props_Shop_exposition_V6_1.msg" "materialInfo94.t" -na;
connectAttr "AM215_props_Shop_exposition_V5_SHDSG.msg" "materialInfo95.sg";
connectAttr "AM215_props_Shop_exposition_V5_SHD.msg" "materialInfo95.m";
connectAttr "AM215_props_Shop_exposition_V5.msg" "materialInfo95.t" -na;
connectAttr "place2dTexture208.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "AM215_props_Shop_exposition_V06_SHD.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "AM215_props_Shop_exposition_V5.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "am215_props_Shop_exposition_V6_1.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "place2dTexture194.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[4].dn"
		;
connectAttr "AM215_props_Shop_exposition_V5_SHD.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[5].dn"
		;
connectAttr ":defaultColorMgtGlobals.cme" "am215_props_Shop_exposition_V4_1.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "am215_props_Shop_exposition_V4_1.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "am215_props_Shop_exposition_V4_1.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "am215_props_Shop_exposition_V4_1.ws";
connectAttr "place2dTexture209.c" "am215_props_Shop_exposition_V4_1.c";
connectAttr "place2dTexture209.tf" "am215_props_Shop_exposition_V4_1.tf";
connectAttr "place2dTexture209.rf" "am215_props_Shop_exposition_V4_1.rf";
connectAttr "place2dTexture209.mu" "am215_props_Shop_exposition_V4_1.mu";
connectAttr "place2dTexture209.mv" "am215_props_Shop_exposition_V4_1.mv";
connectAttr "place2dTexture209.s" "am215_props_Shop_exposition_V4_1.s";
connectAttr "place2dTexture209.wu" "am215_props_Shop_exposition_V4_1.wu";
connectAttr "place2dTexture209.wv" "am215_props_Shop_exposition_V4_1.wv";
connectAttr "place2dTexture209.re" "am215_props_Shop_exposition_V4_1.re";
connectAttr "place2dTexture209.of" "am215_props_Shop_exposition_V4_1.of";
connectAttr "place2dTexture209.r" "am215_props_Shop_exposition_V4_1.ro";
connectAttr "place2dTexture209.n" "am215_props_Shop_exposition_V4_1.n";
connectAttr "place2dTexture209.vt1" "am215_props_Shop_exposition_V4_1.vt1";
connectAttr "place2dTexture209.vt2" "am215_props_Shop_exposition_V4_1.vt2";
connectAttr "place2dTexture209.vt3" "am215_props_Shop_exposition_V4_1.vt3";
connectAttr "place2dTexture209.vc1" "am215_props_Shop_exposition_V4_1.vc1";
connectAttr "place2dTexture209.o" "am215_props_Shop_exposition_V4_1.uv";
connectAttr "place2dTexture209.ofs" "am215_props_Shop_exposition_V4_1.fs";
connectAttr ":defaultColorMgtGlobals.cme" "am215_props_Shop_exposition_V8_1.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "am215_props_Shop_exposition_V8_1.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "am215_props_Shop_exposition_V8_1.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "am215_props_Shop_exposition_V8_1.ws";
connectAttr "place2dTexture210.c" "am215_props_Shop_exposition_V8_1.c";
connectAttr "place2dTexture210.tf" "am215_props_Shop_exposition_V8_1.tf";
connectAttr "place2dTexture210.rf" "am215_props_Shop_exposition_V8_1.rf";
connectAttr "place2dTexture210.mu" "am215_props_Shop_exposition_V8_1.mu";
connectAttr "place2dTexture210.mv" "am215_props_Shop_exposition_V8_1.mv";
connectAttr "place2dTexture210.s" "am215_props_Shop_exposition_V8_1.s";
connectAttr "place2dTexture210.wu" "am215_props_Shop_exposition_V8_1.wu";
connectAttr "place2dTexture210.wv" "am215_props_Shop_exposition_V8_1.wv";
connectAttr "place2dTexture210.re" "am215_props_Shop_exposition_V8_1.re";
connectAttr "place2dTexture210.of" "am215_props_Shop_exposition_V8_1.of";
connectAttr "place2dTexture210.r" "am215_props_Shop_exposition_V8_1.ro";
connectAttr "place2dTexture210.n" "am215_props_Shop_exposition_V8_1.n";
connectAttr "place2dTexture210.vt1" "am215_props_Shop_exposition_V8_1.vt1";
connectAttr "place2dTexture210.vt2" "am215_props_Shop_exposition_V8_1.vt2";
connectAttr "place2dTexture210.vt3" "am215_props_Shop_exposition_V8_1.vt3";
connectAttr "place2dTexture210.vc1" "am215_props_Shop_exposition_V8_1.vc1";
connectAttr "place2dTexture210.o" "am215_props_Shop_exposition_V8_1.uv";
connectAttr "place2dTexture210.ofs" "am215_props_Shop_exposition_V8_1.fs";
connectAttr ":defaultColorMgtGlobals.cme" "am215_props_Shop_exposition_V10_1.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "am215_props_Shop_exposition_V10_1.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "am215_props_Shop_exposition_V10_1.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "am215_props_Shop_exposition_V10_1.ws"
		;
connectAttr "place2dTexture211.c" "am215_props_Shop_exposition_V10_1.c";
connectAttr "place2dTexture211.tf" "am215_props_Shop_exposition_V10_1.tf";
connectAttr "place2dTexture211.rf" "am215_props_Shop_exposition_V10_1.rf";
connectAttr "place2dTexture211.mu" "am215_props_Shop_exposition_V10_1.mu";
connectAttr "place2dTexture211.mv" "am215_props_Shop_exposition_V10_1.mv";
connectAttr "place2dTexture211.s" "am215_props_Shop_exposition_V10_1.s";
connectAttr "place2dTexture211.wu" "am215_props_Shop_exposition_V10_1.wu";
connectAttr "place2dTexture211.wv" "am215_props_Shop_exposition_V10_1.wv";
connectAttr "place2dTexture211.re" "am215_props_Shop_exposition_V10_1.re";
connectAttr "place2dTexture211.of" "am215_props_Shop_exposition_V10_1.of";
connectAttr "place2dTexture211.r" "am215_props_Shop_exposition_V10_1.ro";
connectAttr "place2dTexture211.n" "am215_props_Shop_exposition_V10_1.n";
connectAttr "place2dTexture211.vt1" "am215_props_Shop_exposition_V10_1.vt1";
connectAttr "place2dTexture211.vt2" "am215_props_Shop_exposition_V10_1.vt2";
connectAttr "place2dTexture211.vt3" "am215_props_Shop_exposition_V10_1.vt3";
connectAttr "place2dTexture211.vc1" "am215_props_Shop_exposition_V10_1.vc1";
connectAttr "place2dTexture211.o" "am215_props_Shop_exposition_V10_1.uv";
connectAttr "place2dTexture211.ofs" "am215_props_Shop_exposition_V10_1.fs";
connectAttr "am215_props_Shop_exposition_V10_1.oc" "AM215_props_Shop_exposition_V10_SHD.base_color"
		;
connectAttr "am215_props_Shop_exposition_V8_1.oc" "AM215_props_Shop_exposition_V08_SHD.base_color"
		;
connectAttr "am215_props_Shop_exposition_V4_1.oc" "AM215_props_Shop_exposition_V04_SHD.base_color"
		;
connectAttr "AM215_props_Shop_exposition_V04_SHD.out" "AM215_props_Shop_exposition_V4_SHDSG.ss"
		;
connectAttr "AM215_props_Shop_exposition_V08_SHD.out" "AM215_props_Shop_exposition_V8_SHDSG.ss"
		;
connectAttr "AM215_props_Shop_exposition_V10_SHD.out" "AM215_props_Shop_exposition_V10_SHDSG.ss"
		;
connectAttr "AM215_props_Shop_exposition_V4_SHDSG.msg" "materialInfo96.sg";
connectAttr "AM215_props_Shop_exposition_V04_SHD.msg" "materialInfo96.m";
connectAttr "am215_props_Shop_exposition_V4_1.msg" "materialInfo96.t" -na;
connectAttr "AM215_props_Shop_exposition_V8_SHDSG.msg" "materialInfo97.sg";
connectAttr "AM215_props_Shop_exposition_V08_SHD.msg" "materialInfo97.m";
connectAttr "am215_props_Shop_exposition_V8_1.msg" "materialInfo97.t" -na;
connectAttr "AM215_props_Shop_exposition_V10_SHDSG.msg" "materialInfo98.sg";
connectAttr "AM215_props_Shop_exposition_V10_SHD.msg" "materialInfo98.m";
connectAttr "am215_props_Shop_exposition_V10_1.msg" "materialInfo98.t" -na;
connectAttr ":defaultColorMgtGlobals.cme" "AM215_props_Shop_exposition_V7_1.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "AM215_props_Shop_exposition_V7_1.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "AM215_props_Shop_exposition_V7_1.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "AM215_props_Shop_exposition_V7_1.ws";
connectAttr "place2dTexture212.c" "AM215_props_Shop_exposition_V7_1.c";
connectAttr "place2dTexture212.tf" "AM215_props_Shop_exposition_V7_1.tf";
connectAttr "place2dTexture212.rf" "AM215_props_Shop_exposition_V7_1.rf";
connectAttr "place2dTexture212.mu" "AM215_props_Shop_exposition_V7_1.mu";
connectAttr "place2dTexture212.mv" "AM215_props_Shop_exposition_V7_1.mv";
connectAttr "place2dTexture212.s" "AM215_props_Shop_exposition_V7_1.s";
connectAttr "place2dTexture212.wu" "AM215_props_Shop_exposition_V7_1.wu";
connectAttr "place2dTexture212.wv" "AM215_props_Shop_exposition_V7_1.wv";
connectAttr "place2dTexture212.re" "AM215_props_Shop_exposition_V7_1.re";
connectAttr "place2dTexture212.of" "AM215_props_Shop_exposition_V7_1.of";
connectAttr "place2dTexture212.r" "AM215_props_Shop_exposition_V7_1.ro";
connectAttr "place2dTexture212.n" "AM215_props_Shop_exposition_V7_1.n";
connectAttr "place2dTexture212.vt1" "AM215_props_Shop_exposition_V7_1.vt1";
connectAttr "place2dTexture212.vt2" "AM215_props_Shop_exposition_V7_1.vt2";
connectAttr "place2dTexture212.vt3" "AM215_props_Shop_exposition_V7_1.vt3";
connectAttr "place2dTexture212.vc1" "AM215_props_Shop_exposition_V7_1.vc1";
connectAttr "place2dTexture212.o" "AM215_props_Shop_exposition_V7_1.uv";
connectAttr "place2dTexture212.ofs" "AM215_props_Shop_exposition_V7_1.fs";
connectAttr "AM215_props_Shop_exposition_V7_1.oc" "AM215_props_Shop_exposition_V07_SHD.base_color"
		;
connectAttr "AM215_props_Shop_exposition_V07_SHD.out" "AM215_props_Shop_exposition_V7_SHDSG.ss"
		;
connectAttr "AM215_props_Shop_exposition_V7_SHDSG.msg" "materialInfo99.sg";
connectAttr "AM215_props_Shop_exposition_V07_SHD.msg" "materialInfo99.m";
connectAttr "AM215_props_Shop_exposition_V7_1.msg" "materialInfo99.t" -na;
connectAttr ":defaultArnoldDisplayDriver.msg" ":defaultArnoldRenderOptions.drivers"
		 -na;
connectAttr ":defaultArnoldFilter.msg" ":defaultArnoldRenderOptions.filt";
connectAttr ":defaultArnoldDriver.msg" ":defaultArnoldRenderOptions.drvr";
connectAttr "am215_interior_V1_SHD.out" "am215_interior_V1_SHDSG.ss";
connectAttr "am215_interior_V1_SHDSG.msg" "pasted__materialInfo98.sg";
connectAttr "am215_interior_V1_SHD.msg" "pasted__materialInfo98.m";
connectAttr "am215_interior_V1_SHD.msg" "pasted__materialInfo98.t" -na;
connectAttr "am215_interior_V2_SHD.out" "am215_interior_V2_SHDSG.ss";
connectAttr "am215_interior_V2_SHDSG.msg" "pasted__pasted__materialInfo98.sg";
connectAttr "am215_interior_V2_SHD.msg" "pasted__pasted__materialInfo98.m";
connectAttr "am215_interior_V2_SHD.msg" "pasted__pasted__materialInfo98.t" -na;
connectAttr "am215_interior_V3_SHD.out" "am215_interior_V3_SHDSG.ss";
connectAttr "am215_interior_V3_SHDSG.msg" "pasted__pasted__materialInfo99.sg";
connectAttr "am215_interior_V3_SHD.msg" "pasted__pasted__materialInfo99.m";
connectAttr "am215_interior_V3_SHD.msg" "pasted__pasted__materialInfo99.t" -na;
connectAttr "am215_interior_V4_SHD.out" "am215_interior_V4_SHDSG.ss";
connectAttr "am215_interior_V4_SHDSG.msg" "pasted__pasted__materialInfo100.sg";
connectAttr "am215_interior_V4_SHD.msg" "pasted__pasted__materialInfo100.m";
connectAttr "am215_interior_V4_SHD.msg" "pasted__pasted__materialInfo100.t" -na;
connectAttr "am215_interior_V5_SHD.out" "am215_interior_V5_SHDSG.ss";
connectAttr "am215_interior_V5_SHDSG.msg" "pasted__pasted__materialInfo101.sg";
connectAttr "am215_interior_V5_SHD.msg" "pasted__pasted__materialInfo101.m";
connectAttr "am215_interior_V5_SHD.msg" "pasted__pasted__materialInfo101.t" -na;
connectAttr "am215_shop_interior_V1_SHD.out" "AM215_Shop_interior_V1_SHDSG.ss";
connectAttr "AM215_Shop_interior_V1_SHDSG.msg" "pasted__pasted__materialInfo102.sg"
		;
connectAttr "am215_shop_interior_V1_SHD.msg" "pasted__pasted__materialInfo102.m"
		;
connectAttr "am215_shop_interior_V1_SHD.msg" "pasted__pasted__materialInfo102.t"
		 -na;
connectAttr "am215_interior_V2_SHD.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo1.tgi[0].ni[0].dn"
		;
connectAttr "am215_interior_V2_SHDSG.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo1.tgi[0].ni[1].dn"
		;
connectAttr "am215_interior_V2_001_1.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo1.tgi[0].ni[2].dn"
		;
connectAttr "REC__place2dTexture181.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo1.tgi[0].ni[3].dn"
		;
connectAttr "AM215_props_Shop_exposition_V3_SHDSG.pa" ":renderPartition.st" -na;
connectAttr "AM215_props_Shop_exposition_V1_SHDSG.pa" ":renderPartition.st" -na;
connectAttr "AM215_props_Shop_exposition_V2_SHDSG.pa" ":renderPartition.st" -na;
connectAttr "AM215_props_Shop_exposition_V9_SHDSG.pa" ":renderPartition.st" -na;
connectAttr "AM215_props_Shop_exposition_V6_SHDSG.pa" ":renderPartition.st" -na;
connectAttr "AM215_props_Shop_exposition_V5_SHDSG.pa" ":renderPartition.st" -na;
connectAttr "AM215_props_Shop_exposition_V4_SHDSG.pa" ":renderPartition.st" -na;
connectAttr "AM215_props_Shop_exposition_V8_SHDSG.pa" ":renderPartition.st" -na;
connectAttr "AM215_props_Shop_exposition_V10_SHDSG.pa" ":renderPartition.st" -na
		;
connectAttr "AM215_props_Shop_exposition_V7_SHDSG.pa" ":renderPartition.st" -na;
connectAttr "am215_interior_V1_SHDSG.pa" ":renderPartition.st" -na;
connectAttr "am215_interior_V2_SHDSG.pa" ":renderPartition.st" -na;
connectAttr "am215_interior_V3_SHDSG.pa" ":renderPartition.st" -na;
connectAttr "am215_interior_V4_SHDSG.pa" ":renderPartition.st" -na;
connectAttr "am215_interior_V5_SHDSG.pa" ":renderPartition.st" -na;
connectAttr "AM215_Shop_interior_V1_SHDSG.pa" ":renderPartition.st" -na;
connectAttr "am215_interior_V1_SHD.msg" ":defaultShaderList1.s" -na;
connectAttr "am215_interior_V2_SHD.msg" ":defaultShaderList1.s" -na;
connectAttr "am215_interior_V3_SHD.msg" ":defaultShaderList1.s" -na;
connectAttr "am215_interior_V4_SHD.msg" ":defaultShaderList1.s" -na;
connectAttr "am215_interior_V5_SHD.msg" ":defaultShaderList1.s" -na;
connectAttr "am215_shop_interior_V1_SHD.msg" ":defaultShaderList1.s" -na;
connectAttr "AM215_props_Shop_exposition_V03_SHD.msg" ":defaultShaderList1.s" -na
		;
connectAttr "AM215_props_Shop_exposition_V01_SHD.msg" ":defaultShaderList1.s" -na
		;
connectAttr "AM215_props_Shop_exposition_V02_SHD.msg" ":defaultShaderList1.s" -na
		;
connectAttr "AM215_props_Shop_exposition_V09_SHD.msg" ":defaultShaderList1.s" -na
		;
connectAttr "AM215_props_Shop_exposition_V06_SHD.msg" ":defaultShaderList1.s" -na
		;
connectAttr "AM215_props_Shop_exposition_V5_SHD.msg" ":defaultShaderList1.s" -na
		;
connectAttr "AM215_props_Shop_exposition_V04_SHD.msg" ":defaultShaderList1.s" -na
		;
connectAttr "AM215_props_Shop_exposition_V08_SHD.msg" ":defaultShaderList1.s" -na
		;
connectAttr "AM215_props_Shop_exposition_V10_SHD.msg" ":defaultShaderList1.s" -na
		;
connectAttr "AM215_props_Shop_exposition_V07_SHD.msg" ":defaultShaderList1.s" -na
		;
connectAttr "REC__place2dTexture177.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "REC__place2dTexture178.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "REC__place2dTexture179.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "REC__place2dTexture180.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "REC__place2dTexture181.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture226.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture204.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture205.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture206.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture207.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture194.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture208.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture209.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture210.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture211.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture212.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "am215_interior_V1_001_1.msg" ":defaultTextureList1.tx" -na;
connectAttr "am215_interior_V3_001_1.msg" ":defaultTextureList1.tx" -na;
connectAttr "am215_interior_V4_001_1.msg" ":defaultTextureList1.tx" -na;
connectAttr "am215_interior_V5_001_1.msg" ":defaultTextureList1.tx" -na;
connectAttr "am215_interior_V2_001_1.msg" ":defaultTextureList1.tx" -na;
connectAttr "AM215_Shop_interior_V1_1.msg" ":defaultTextureList1.tx" -na;
connectAttr "AM215_props_Shop_exposition_V3_1.msg" ":defaultTextureList1.tx" -na
		;
connectAttr "AM215_props_Shop_exposition_V1_1.msg" ":defaultTextureList1.tx" -na
		;
connectAttr "AM215_props_Shop_exposition_V2_1.msg" ":defaultTextureList1.tx" -na
		;
connectAttr "AM215_props_Shop_exposition_V9_1.msg" ":defaultTextureList1.tx" -na
		;
connectAttr "am215_props_Shop_exposition_V6_1.msg" ":defaultTextureList1.tx" -na
		;
connectAttr "AM215_props_Shop_exposition_V5.msg" ":defaultTextureList1.tx" -na;
connectAttr "am215_props_Shop_exposition_V4_1.msg" ":defaultTextureList1.tx" -na
		;
connectAttr "am215_props_Shop_exposition_V8_1.msg" ":defaultTextureList1.tx" -na
		;
connectAttr "am215_props_Shop_exposition_V10_1.msg" ":defaultTextureList1.tx" -na
		;
connectAttr "AM215_props_Shop_exposition_V7_1.msg" ":defaultTextureList1.tx" -na
		;
// End of interior_shaders.ma
