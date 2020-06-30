//Maya ASCII 2018ff09 scene
//Name: interior_shaders.ma
//Last modified: Mon, Jun 29, 2020 11:23:06 PM
//Codeset: 1252
requires maya "2018ff09";
requires -nodeType "aiOptions" -nodeType "aiAOVDriver" -nodeType "aiAOVFilter" -nodeType "aiUtility"
		 "mtoa" "4.0.3.1";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2018";
fileInfo "version" "2018";
fileInfo "cutIdentifier" "201903222215-65bada0e52";
fileInfo "osv" "Microsoft Windows 8 Home Premium Edition, 64-bit  (Build 9200)\n";
fileInfo "license" "student";
createNode transform -s -n "persp";
	rename -uid "116DE933-487F-14BC-E705-E18755AE895D";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 28 21 28 ;
	setAttr ".r" -type "double3" -27.938352729602379 44.999999999999972 -5.172681101354183e-14 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "3424F692-43D4-7621-DE62-B086BE00FE4A";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 44.82186966202994;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "9C2BECF4-43A0-0700-4E73-8398183D89E9";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "79FA5889-40CC-C851-E0AC-3B804B1255A2";
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
	rename -uid "E4D80224-47E5-1F76-FF1D-8A90A0D0FC8C";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "0903FAFA-458E-C968-956D-9A8606B7D23F";
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
	rename -uid "E646565D-4FA4-52F2-CA24-7CB6D459CDE2";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "741A49DE-4AA8-CCF0-0C08-9DA994CC3DD8";
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
	rename -uid "B0A6C94B-413F-91DB-B074-EB8E280B489D";
	setAttr -s 8 ".lnk";
	setAttr -s 8 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "7721533F-4CCD-0A9D-11BA-00A0A1728263";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "35976FF4-4204-3B8F-FD2F-8186A8C04BA4";
createNode displayLayerManager -n "layerManager";
	rename -uid "B246B25A-49AB-FE9A-C905-12B5E2184D28";
createNode displayLayer -n "defaultLayer";
	rename -uid "EAA365FB-452B-71F2-05FE-4395CFBFC019";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "4262C2B4-469E-BFA7-BE6C-98B907B447CB";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "A1EF9BC0-4457-4FC8-5303-D8B5BEFDFCF3";
	setAttr ".g" yes;
createNode aiOptions -s -n "defaultArnoldRenderOptions";
	rename -uid "C0951E5E-4591-66D1-FDBB-2F992D5F2AE2";
	setAttr ".version" -type "string" "4.0.3.1";
createNode aiAOVFilter -s -n "defaultArnoldFilter";
	rename -uid "934736C7-4F7D-4743-82CC-95A437DA0588";
createNode aiAOVDriver -s -n "defaultArnoldDriver";
	rename -uid "010D08E2-46E8-1D79-E3FC-C4A259C571AF";
createNode aiAOVDriver -s -n "defaultArnoldDisplayDriver";
	rename -uid "BAA1FDF5-404C-DF21-45FA-278E1AEB421F";
	setAttr ".output_mode" 0;
	setAttr ".ai_translator" -type "string" "maya";
createNode shadingEngine -n "am215_interior_V1_SHDSG";
	rename -uid "5015788F-49CC-285C-8F83-879AD3DCB661";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
	rename -uid "4B8D2457-49F0-E8CE-8B68-97B2B9590EA2";
createNode shadingEngine -n "am215_interior_V2_SHDSG";
	rename -uid "E752D350-4C5B-BE7C-95E8-92A4432DF5B6";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "pasted__materialInfo1";
	rename -uid "1C32CC69-48A5-1B16-37B5-3EBC05CAE263";
createNode aiUtility -n "am215_interior_V2_SHD";
	rename -uid "7D4D0475-4276-F315-5C55-5A9B7F269055";
	setAttr ".shade_mode" 2;
createNode shadingEngine -n "am215_interior_V3_SHDSG";
	rename -uid "15EC87DE-46ED-3B0A-B4E9-1FB5751B5A5E";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
	rename -uid "AFCEAA09-4825-25A9-A8F6-6589C25C3E79";
createNode script -n "uiConfigurationScriptNode";
	rename -uid "39A06A7F-4933-1D51-EB50-4BA573BDA71C";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n"
		+ "            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n"
		+ "            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n"
		+ "            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1587\n            -height 1054\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 1\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n"
		+ "            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n"
		+ "            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n"
		+ "            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n"
		+ "                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n"
		+ "                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 1\n                -autoFitTime 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n"
		+ "                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -showCurveNames 0\n                -showActiveCurveNames 0\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                -valueLinesToggle 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n"
		+ "                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n"
		+ "                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n"
		+ "                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n"
		+ "\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n"
		+ "                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n"
		+ "                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n"
		+ "        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1587\\n    -height 1054\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1587\\n    -height 1054\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "1950BE64-4935-139A-0DC7-42A43580CCB1";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode shadingEngine -n "am215_interior_V4_SHDSG";
	rename -uid "95F478F4-46CE-6F45-57B5-8988E380DA0E";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo4";
	rename -uid "B8CE708E-4FF9-BC8F-A066-EEB3B4E1C48D";
createNode shadingEngine -n "am215_interior_V5_SHDSG";
	rename -uid "EEC7A5A2-40AA-B830-23D1-6AA96F7F5F14";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo5";
	rename -uid "BEEC9E10-4466-DE35-A627-5FB5A666CC43";
createNode shadingEngine -n "am215_shop_interior_V1_SHDSG";
	rename -uid "8A1B786A-4E0C-2618-D4BF-0288EEDC4FA5";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo6";
	rename -uid "5535B31B-4E14-ED49-9EC3-219BA8362A4F";
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "300E0102-4A79-424E-7DE7-329C836759E7";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" 2631.5879738565241 -234.35329698475343 ;
	setAttr ".tgi[0].vh" -type "double2" 3668.8127316939667 354.28491583872938 ;
	setAttr -s 4 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 2598.571533203125;
	setAttr ".tgi[0].ni[0].y" 154.28572082519531;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" 3149.970458984375;
	setAttr ".tgi[0].ni[1].y" 150.96444702148438;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" 2291.428466796875;
	setAttr ".tgi[0].ni[2].y" 131.42857360839844;
	setAttr ".tgi[0].ni[2].nvs" 1923;
	setAttr ".tgi[0].ni[3].x" 2905.71435546875;
	setAttr ".tgi[0].ni[3].y" 154.28572082519531;
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
	setAttr -s 8 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 10 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 6 ".u";
select -ne :defaultRenderingList1;
select -ne :defaultTextureList1;
	setAttr -s 6 ".tx";
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
relationship "link" ":lightLinker1" "am215_interior_V1_SHDSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "am215_interior_V2_SHDSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "am215_interior_V3_SHDSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "am215_interior_V5_SHDSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "am215_interior_V4_SHDSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "am215_shop_interior_V1_SHDSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "am215_interior_V1_SHDSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "am215_interior_V2_SHDSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "am215_interior_V3_SHDSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "am215_interior_V5_SHDSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "am215_interior_V4_SHDSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "am215_shop_interior_V1_SHDSG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr ":defaultArnoldDisplayDriver.msg" ":defaultArnoldRenderOptions.drivers"
		 -na;
connectAttr ":defaultArnoldFilter.msg" ":defaultArnoldRenderOptions.filt";
connectAttr ":defaultArnoldDriver.msg" ":defaultArnoldRenderOptions.drvr";
connectAttr "am215_interior_V1_SHD.out" "am215_interior_V1_SHDSG.ss";
connectAttr "am215_interior_V1_SHDSG.msg" "materialInfo1.sg";
connectAttr "am215_interior_V1_SHD.msg" "materialInfo1.m";
connectAttr "am215_interior_V1_SHD.msg" "materialInfo1.t" -na;
connectAttr "am215_interior_V2_SHD.out" "am215_interior_V2_SHDSG.ss";
connectAttr "am215_interior_V2_SHDSG.msg" "pasted__materialInfo1.sg";
connectAttr "am215_interior_V2_SHD.msg" "pasted__materialInfo1.m";
connectAttr "am215_interior_V2_SHD.msg" "pasted__materialInfo1.t" -na;
connectAttr "am215_interior_V2_001_1.oc" "am215_interior_V2_SHD.color";
connectAttr "am215_interior_V3_SHD.out" "am215_interior_V3_SHDSG.ss";
connectAttr "am215_interior_V3_SHDSG.msg" "materialInfo2.sg";
connectAttr "am215_interior_V3_SHD.msg" "materialInfo2.m";
connectAttr "am215_interior_V3_SHD.msg" "materialInfo2.t" -na;
connectAttr "am215_interior_V4_SHD.out" "am215_interior_V4_SHDSG.ss";
connectAttr "am215_interior_V4_SHDSG.msg" "materialInfo4.sg";
connectAttr "am215_interior_V4_SHD.msg" "materialInfo4.m";
connectAttr "am215_interior_V4_SHD.msg" "materialInfo4.t" -na;
connectAttr "am215_interior_V5_SHD.out" "am215_interior_V5_SHDSG.ss";
connectAttr "am215_interior_V5_SHDSG.msg" "materialInfo5.sg";
connectAttr "am215_interior_V5_SHD.msg" "materialInfo5.m";
connectAttr "am215_interior_V5_SHD.msg" "materialInfo5.t" -na;
connectAttr "am215_shop_interior_V1_SHD.out" "am215_shop_interior_V1_SHDSG.ss";
connectAttr "am215_shop_interior_V1_SHDSG.msg" "materialInfo6.sg";
connectAttr "am215_shop_interior_V1_SHD.msg" "materialInfo6.m";
connectAttr "am215_shop_interior_V1_SHD.msg" "materialInfo6.t" -na;
connectAttr "AM215_Shop_interior_V1_1.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "am215_shop_interior_V1_SHDSG.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "place2dTexture226.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "am215_shop_interior_V1_SHD.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "am215_interior_V1_SHDSG.pa" ":renderPartition.st" -na;
connectAttr "am215_interior_V2_SHDSG.pa" ":renderPartition.st" -na;
connectAttr "am215_interior_V3_SHDSG.pa" ":renderPartition.st" -na;
connectAttr "am215_interior_V4_SHDSG.pa" ":renderPartition.st" -na;
connectAttr "am215_interior_V5_SHDSG.pa" ":renderPartition.st" -na;
connectAttr "am215_shop_interior_V1_SHDSG.pa" ":renderPartition.st" -na;
connectAttr "am215_interior_V1_SHD.msg" ":defaultShaderList1.s" -na;
connectAttr "am215_interior_V2_SHD.msg" ":defaultShaderList1.s" -na;
connectAttr "am215_interior_V3_SHD.msg" ":defaultShaderList1.s" -na;
connectAttr "am215_interior_V4_SHD.msg" ":defaultShaderList1.s" -na;
connectAttr "am215_interior_V5_SHD.msg" ":defaultShaderList1.s" -na;
connectAttr "am215_shop_interior_V1_SHD.msg" ":defaultShaderList1.s" -na;
connectAttr "REC__place2dTexture177.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "REC__place2dTexture178.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "REC__place2dTexture179.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "REC__place2dTexture180.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "REC__place2dTexture181.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture226.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "am215_interior_V1_001_1.msg" ":defaultTextureList1.tx" -na;
connectAttr "am215_interior_V3_001_1.msg" ":defaultTextureList1.tx" -na;
connectAttr "am215_interior_V4_001_1.msg" ":defaultTextureList1.tx" -na;
connectAttr "am215_interior_V5_001_1.msg" ":defaultTextureList1.tx" -na;
connectAttr "am215_interior_V2_001_1.msg" ":defaultTextureList1.tx" -na;
connectAttr "AM215_Shop_interior_V1_1.msg" ":defaultTextureList1.tx" -na;
// End of interior_shaders.ma
