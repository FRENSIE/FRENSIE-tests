import numpy
import os
import sys
import PyFrensie.Geometry as Geometry
import PyFrensie.Geometry.DagMC as DagMC
import PyFrensie.Utility as Utility
import PyFrensie.Utility.MPI as MPI
import PyFrensie.Utility.Prng as Prng
import PyFrensie.Utility.Coordinate as Coordinate
import PyFrensie.Utility.Distribution as Distribution
import PyFrensie.MonteCarlo as MonteCarlo
import PyFrensie.MonteCarlo.Collision as Collision
import PyFrensie.MonteCarlo.ActiveRegion as ActiveRegion
import PyFrensie.MonteCarlo.Event as Event
import PyFrensie.MonteCarlo.Manager as Manager
import PyFrensie.Data as Data
import PyFrensie.Data.Native as Native

energy_bins = [0.001, 0.00344914914915, 0.0058982982983, 0.00834744744745, 0.0107965965966, 0.0132457457457, 
               0.0156948948949, 0.018144044044, 0.0205931931932, 0.0230423423423, 0.0254914914915, 0.0279406406406, 
               0.0303897897898, 0.0328389389389, 0.0352880880881, 0.0377372372372, 0.0401863863864, 0.0426355355355, 
               0.0450846846847, 0.0475338338338, 0.049982982983, 0.0524321321321, 0.0548812812813, 0.0573304304304, 
               0.0597795795796, 0.0622287287287, 0.0646778778779, 0.067127027027, 0.0695761761762, 0.0720253253253, 
               0.0744744744745, 0.0769236236236, 0.0793727727728, 0.0818219219219, 0.0842710710711, 0.0867202202202, 
               0.0891693693694, 0.0916185185185, 0.0940676676677, 0.0965168168168, 0.098965965966, 0.101415115115, 
               0.103864264264, 0.106313413413, 0.108762562563, 0.111211711712, 0.113660860861, 0.11611001001, 
               0.118559159159, 0.121008308308, 0.123457457457, 0.125906606607, 0.128355755756, 0.130804904905, 
               0.133254054054, 0.135703203203, 0.138152352352, 0.140601501502, 0.143050650651, 0.1454997998, 
               0.147948948949, 0.150398098098, 0.152847247247, 0.155296396396, 0.157745545546, 0.160194694695, 
               0.162643843844, 0.165092992993, 0.167542142142, 0.169991291291, 0.17244044044, 0.17488958959, 
               0.177338738739, 0.179787887888, 0.182237037037, 0.1862105, 0.1862115, 0.189584484484, 
               0.192033633634, 0.194482782783, 0.196931931932, 0.199381081081, 0.20183023023, 0.204279379379, 
               0.206728528529, 0.209177677678, 0.211626826827, 0.214075975976, 0.216525125125, 0.218974274274, 
               0.221423423423, 0.223872572573, 0.226321721722, 0.228770870871, 0.23122002002, 0.233669169169, 
               0.236118318318, 0.238567467467, 0.2419945, 0.2419955, 0.245914914915, 0.248364064064, 
               0.250813213213, 0.253262362362, 0.255711511512, 0.258160660661, 0.26060980981, 0.263058958959, 
               0.2655995, 0.2656005, 0.270406406406, 0.272855555556, 0.275304704705, 0.277753853854, 
               0.280203003003, 0.282652152152, 0.285101301301, 0.28755045045, 0.2899995996, 0.292448748749, 
               0.2952223, 0.2952233, 0.299796196196, 0.3045995, 0.3046005, 0.307143643644, 
               0.309592792793, 0.312041941942, 0.314491091091, 0.31694024024, 0.319389389389, 0.321838538539, 
               0.324287687688, 0.326736836837, 0.329185985986, 0.331635135135, 0.334084284284, 0.336533433433, 
               0.338982582583, 0.341431731732, 0.343880880881, 0.34633003003, 0.348779179179, 0.3519316, 
               0.3519326, 0.356126626627, 0.358575775776, 0.361024924925, 0.363474074074, 0.365923223223, 
               0.368372372372, 0.370821521522, 0.373270670671, 0.37571981982, 0.378168968969, 0.380618118118, 
               0.383067267267, 0.385516416416, 0.387965565566, 0.390414714715, 0.392863863864, 0.395313013013, 
               0.397762162162, 0.400211311311, 0.40266046046, 0.40510960961, 0.407558758759, 0.410007907908, 
               0.412457057057, 0.414906206206, 0.417355355355, 0.419804504505, 0.422253653654, 0.424702802803, 
               0.427151951952, 0.429601101101, 0.43205025025, 0.434499399399, 0.436948548549, 0.439397697698, 
               0.441846846847, 0.444295995996, 0.446745145145, 0.449194294294, 0.451643443443, 0.454092592593, 
               0.456541741742, 0.458990890891, 0.46144004004, 0.463889189189, 0.466338338338, 0.468787487487, 
               0.471236636637, 0.473685785786, 0.476134934935, 0.478584084084, 0.481033233233, 0.483482382382, 
               0.485931531532, 0.488380680681, 0.49082982983, 0.493278978979, 0.495728128128, 0.498177277277, 
               0.500626426426, 0.503075575576, 0.505524724725, 0.507973873874, 0.51099841013, 0.51099941013, 
               0.515321321321, 0.51777047047, 0.52021961962, 0.522668768769, 0.525117917918, 0.527567067067, 
               0.530016216216, 0.532465365365, 0.534914514515, 0.537363663664, 0.539812812813, 0.542261961962, 
               0.544711111111, 0.54716026026, 0.549609409409, 0.552058558559, 0.554507707708, 0.556956856857, 
               0.559406006006, 0.561855155155, 0.564304304304, 0.566753453453, 0.569202602603, 0.571651751752, 
               0.574100900901, 0.57655005005, 0.578999199199, 0.581448348348, 0.583897497497, 0.586346646647, 
               0.588795795796, 0.591244944945, 0.593694094094, 0.596143243243, 0.598592392392, 0.601041541542, 
               0.603490690691, 0.60593983984, 0.6093195, 0.6093205, 0.613287287287, 0.615736436436, 
               0.618185585586, 0.620634734735, 0.623083883884, 0.625533033033, 0.627982182182, 0.630431331331, 
               0.63288048048, 0.63532962963, 0.637778778779, 0.640227927928, 0.642677077077, 0.645126226226, 
               0.6495995, 0.6496005, 0.652473673674, 0.654922822823, 0.657371971972, 0.659821121121, 
               0.66227027027, 0.6654465, 0.6654475, 0.669617717718, 0.672066866867, 0.674516016016, 
               0.676965165165, 0.679414314314, 0.681863463463, 0.684312612613, 0.686761761762, 0.689210910911, 
               0.69166006006, 0.694109209209, 0.696558358358, 0.699007507508, 0.701456656657, 0.703905805806, 
               0.706354954955, 0.708804104104, 0.711253253253, 0.713702402402, 0.716151551552, 0.718600700701, 
               0.72104984985, 0.723498998999, 0.725948148148, 0.728397297297, 0.730846446446, 0.733295595596, 
               0.735744744745, 0.738193893894, 0.740643043043, 0.743092192192, 0.745541341341, 0.74799049049, 
               0.75043963964, 0.752888788789, 0.755337937938, 0.757787087087, 0.760236236236, 0.762685385385, 
               0.765134534535, 0.7683595, 0.7683605, 0.772481981982, 0.774931131131, 0.77738028028, 
               0.779829429429, 0.782278578579, 0.7859595, 0.7859605, 0.789626026026, 0.792075175175, 
               0.794524324324, 0.796973473473, 0.799422622623, 0.801871771772, 0.8061795, 0.8061805, 
               0.809219219219, 0.811668368368, 0.814117517518, 0.816566666667, 0.819015815816, 0.821464964965, 
               0.823914114114, 0.826363263263, 0.828812412412, 0.831261561562, 0.833710710711, 0.83615985986, 
               0.838609009009, 0.841058158158, 0.843507307307, 0.845956456456, 0.848405605606, 0.850854754755, 
               0.853303903904, 0.855753053053, 0.858202202202, 0.860651351351, 0.863100500501, 0.86554964965, 
               0.867998798799, 0.870447947948, 0.872897097097, 0.875346246246, 0.877795395395, 0.880244544545, 
               0.882693693694, 0.885142842843, 0.887591991992, 0.890041141141, 0.89249029029, 0.894939439439, 
               0.897388588589, 0.899837737738, 0.902286886887, 0.904736036036, 0.907185185185, 0.909634334334, 
               0.912083483483, 0.914532632633, 0.916981781782, 0.919430930931, 0.92188008008, 0.924329229229, 
               0.926778378378, 0.929227527528, 0.9340555, 0.9340565, 0.936574974975, 0.939024124124, 
               0.941473273273, 0.943922422422, 0.946371571572, 0.948820720721, 0.95126986987, 0.953719019019, 
               0.956168168168, 0.958617317317, 0.961066466466, 0.963515615616, 0.965964764765, 0.968413913914, 
               0.970863063063, 0.973312212212, 0.975761361361, 0.978210510511, 0.98065965966, 0.983108808809, 
               0.985557957958, 0.988007107107, 0.990456256256, 0.992905405405, 0.995354554555, 0.997803703704, 
               1.00025285285, 1.002702002, 1.00515115115, 1.0076003003, 1.01004944945, 1.0124985986, 
               1.01494774775, 1.0173968969, 1.01984604605, 1.0222951952, 1.02474434434, 1.02719349349, 
               1.02964264264, 1.03209179179, 1.03454094094, 1.03699009009, 1.03943923924, 1.04188838839, 
               1.04433753754, 1.04678668669, 1.04923583584, 1.05168498498, 1.05413413413, 1.05658328328, 
               1.05903243243, 1.06148158158, 1.06393073073, 1.06637987988, 1.06882902903, 1.07127817818, 
               1.07372732733, 1.07617647648, 1.07862562563, 1.08107477477, 1.08352392392, 1.08597307307, 
               1.08842222222, 1.09087137137, 1.09332052052, 1.09576966967, 1.09821881882, 1.10066796797, 
               1.10311711712, 1.10556626627, 1.10801541542, 1.11046456456, 1.11291371371, 1.11536286286, 
               1.11781201201, 1.1202935, 1.1202945, 1.12515945946, 1.12760860861, 1.13005775776, 
               1.13250690691, 1.13495605606, 1.13740520521, 1.13985435435, 1.1423035035, 1.14475265265, 
               1.1472018018, 1.14965095095, 1.1521001001, 1.1552095, 1.1552105, 1.15944754755, 
               1.1618966967, 1.16434584585, 1.16679499499, 1.16924414414, 1.17169329329, 1.17414244244, 
               1.17659159159, 1.17904074074, 1.18148988989, 1.18393903904, 1.18638818819, 1.18883733734, 
               1.19128648649, 1.19373563564, 1.19618478478, 1.19863393393, 1.20108308308, 1.20353223223, 
               1.20598138138, 1.20843053053, 1.21087967968, 1.21332882883, 1.21577797798, 1.21822712713, 
               1.22067627628, 1.22312542543, 1.22557457457, 1.22802372372, 1.23047287287, 1.23292202202, 
               1.23537117117, 1.2381215, 1.2381225, 1.24271861862, 1.24516776777, 1.24761691692, 
               1.25006606607, 1.25251521522, 1.25496436436, 1.25741351351, 1.25986266266, 1.26231181181, 
               1.26476096096, 1.26721011011, 1.26965925926, 1.27210840841, 1.27455755756, 1.27700670671, 
               1.2809755, 1.2809765, 1.28435415415, 1.2868033033, 1.28925245245, 1.2917016016, 
               1.29415075075, 1.2965998999, 1.29904904905, 1.3014981982, 1.30394734735, 1.3063964965, 
               1.30884564565, 1.31129479479, 1.31374394394, 1.31619309309, 1.31864224224, 1.32109139139, 
               1.32354054054, 1.32598968969, 1.32843883884, 1.33088798799, 1.33333713714, 1.33578628629, 
               1.33823543544, 1.34068458458, 1.34313373373, 1.34558288288, 1.34803203203, 1.35048118118, 
               1.35293033033, 1.35537947948, 1.35782862863, 1.36027777778, 1.36272692693, 1.36517607608, 
               1.36762522523, 1.37007437437, 1.37252352352, 1.37497267267, 1.3776685, 1.3776695, 
               1.38232012012, 1.38476926927, 1.38721841842, 1.38966756757, 1.39211671672, 1.39456586587, 
               1.39701501502, 1.4015145, 1.4015155, 1.40436246246, 1.4079875, 1.4079885, 
               1.41170990991, 1.41415905906, 1.41660820821, 1.41905735736, 1.42150650651, 1.42395565566, 
               1.4264048048, 1.42885395395, 1.4313031031, 1.43375225225, 1.4362014014, 1.43865055055, 
               1.4410996997, 1.44354884885, 1.445997998, 1.44844714715, 1.4508962963, 1.45334544545, 
               1.45579459459, 1.45824374374, 1.46069289289, 1.46314204204, 1.46559119119, 1.46804034034, 
               1.47048948949, 1.47293863864, 1.47538778779, 1.47783693694, 1.48028608609, 1.48273523524, 
               1.48518438438, 1.48763353353, 1.49008268268, 1.49253183183, 1.49498098098, 1.49743013013, 
               1.49987927928, 1.50232842843, 1.50477757758, 1.5092095, 1.5092105, 1.51212502503, 
               1.51457417417, 1.51702332332, 1.51947247247, 1.52192162162, 1.52437077077, 1.52681991992, 
               1.52926906907, 1.53171821822, 1.53416736737, 1.53661651652, 1.53906566567, 1.54151481481, 
               1.54396396396, 1.54641311311, 1.54886226226, 1.55131141141, 1.55376056056, 1.55620970971, 
               1.55865885886, 1.56110800801, 1.56355715716, 1.56600630631, 1.56845545546, 1.5709046046, 
               1.57335375375, 1.5758029029, 1.57825205205, 1.5807012012, 1.58315035035, 1.5855994995, 
               1.58804864865, 1.5904977978, 1.59294694695, 1.5953960961, 1.59784524525, 1.60029439439, 
               1.60274354354, 1.60519269269, 1.60764184184, 1.61009099099, 1.61254014014, 1.61498928929, 
               1.61743843844, 1.61988758759, 1.62233673674, 1.62478588589, 1.62723503504, 1.62968418418, 
               1.63213333333, 1.63458248248, 1.63703163163, 1.63948078078, 1.64192992993, 1.64437907908, 
               1.64682822823, 1.64927737738, 1.65172652653, 1.65417567568, 1.65662482482, 1.6612735, 
               1.6612745, 1.66397227227, 1.66642142142, 1.66887057057, 1.67131971972, 1.67376886887, 
               1.67621801802, 1.67866716717, 1.68111631632, 1.68356546547, 1.68601461461, 1.68846376376, 
               1.69091291291, 1.69336206206, 1.69581121121, 1.69826036036, 1.70070950951, 1.70315865866, 
               1.70560780781, 1.70805695696, 1.71050610611, 1.71295525526, 1.7154044044, 1.71785355355, 
               1.7203027027, 1.72275185185, 1.725201001, 1.7295945, 1.7295955, 1.73254844845, 
               1.7349975976, 1.73744674675, 1.7398958959, 1.74234504505, 1.74479419419, 1.74724334334, 
               1.74969249249, 1.75214164164, 1.75459079079, 1.75703993994, 1.75948908909, 1.76193823824, 
               1.7644905, 1.7644915, 1.76928568569, 1.77173483483, 1.77418398398, 1.77663313313, 
               1.77908228228, 1.78153143143, 1.78398058058, 1.78642972973, 1.78887887888, 1.79132802803, 
               1.79377717718, 1.79622632633, 1.79867547548, 1.80112462462, 1.80357377377, 1.80602292292, 
               1.80847207207, 1.81092122122, 1.81337037037, 1.81581951952, 1.81826866867, 1.82071781782, 
               1.82316696697, 1.82561611612, 1.82806526527, 1.83051441441, 1.83296356356, 1.83541271271, 
               1.83786186186, 1.84031101101, 1.84276016016, 1.8474285, 1.8474295, 1.85010760761, 
               1.85255675676, 1.85500590591, 1.85745505506, 1.8599042042, 1.86235335335, 1.8648025025, 
               1.86725165165, 1.8697008008, 1.87214994995, 1.8745990991, 1.87704824825, 1.8794973974, 
               1.88194654655, 1.8843956957, 1.88684484484, 1.88929399399, 1.89174314314, 1.89419229229, 
               1.89664144144, 1.89909059059, 1.90153973974, 1.90398888889, 1.90643803804, 1.90888718719, 
               1.91133633634, 1.91378548549, 1.91623463463, 1.91868378378, 1.92113293293, 1.92358208208, 
               1.92603123123, 1.92848038038, 1.93092952953, 1.93337867868, 1.93582782783, 1.93827697698, 
               1.94072612613, 1.94317527528, 1.94562442442, 1.94807357357, 1.95052272272, 1.95297187187, 
               1.95542102102, 1.95787017017, 1.96031931932, 1.96276846847, 1.96521761762, 1.96766676677, 
               1.97011591592, 1.97256506507, 1.97501421421, 1.97746336336, 1.97991251251, 1.98236166166, 
               1.98481081081, 1.98725995996, 1.98970910911, 1.99215825826, 1.99460740741, 1.99705655656, 
               1.99950570571, 2.00195485485, 2.004404004, 2.00685315315, 2.0093023023, 2.01175145145, 
               2.0142006006, 2.01664974975, 2.0190988989, 2.02154804805, 2.0239971972, 2.02644634635, 
               2.0288954955, 2.03134464464, 2.03379379379, 2.03624294294, 2.03869209209, 2.04114124124, 
               2.04359039039, 2.04603953954, 2.04848868869, 2.05093783784, 2.05338698699, 2.05583613614, 
               2.05828528529, 2.06073443443, 2.06318358358, 2.06563273273, 2.06808188188, 2.07053103103, 
               2.07298018018, 2.07542932933, 2.07787847848, 2.08032762763, 2.08277677678, 2.08522592593, 
               2.08767507508, 2.09012422422, 2.09257337337, 2.09502252252, 2.09747167167, 2.09992082082, 
               2.10236996997, 2.10481911912, 2.10726826827, 2.10971741742, 2.11216656657, 2.11461571572, 
               2.1185135, 2.1185145, 2.12196316316, 2.12441231231, 2.12686146146, 2.12931061061, 
               2.13175975976, 2.13420890891, 2.13665805806, 2.13910720721, 2.14155635636, 2.14400550551, 
               2.14645465465, 2.1489038038, 2.15135295295, 2.1538021021, 2.15625125125, 2.1587004004, 
               2.16114954955, 2.1635986987, 2.16604784785, 2.168496997, 2.17094614615, 2.1733952953, 
               2.17584444444, 2.17829359359, 2.18074274274, 2.18319189189, 2.18564104104, 2.18809019019, 
               2.19053933934, 2.19298848849, 2.19543763764, 2.19788678679, 2.20033593594, 2.2040585, 
               2.2040595, 2.20768338338, 2.21013253253, 2.21258168168, 2.21503083083, 2.21747997998, 
               2.21992912913, 2.22237827828, 2.22482742743, 2.22727657658, 2.22972572573, 2.23217487487, 
               2.23462402402, 2.23707317317, 2.23952232232, 2.24197147147, 2.24442062062, 2.24686976977, 
               2.24931891892, 2.25176806807, 2.25421721722, 2.25666636637, 2.25911551552, 2.26156466466, 
               2.26401381381, 2.26646296296, 2.26891211211, 2.27136126126, 2.27381041041, 2.27625955956, 
               2.27870870871, 2.28115785786, 2.28360700701, 2.28605615616, 2.28850530531, 2.29095445445, 
               2.2934036036, 2.29585275275, 2.2983019019, 2.30075105105, 2.3032002002, 2.30564934935, 
               2.3080984985, 2.31054764765, 2.3129967968, 2.31544594595, 2.3178950951, 2.32034424424, 
               2.32279339339, 2.32524254254, 2.32769169169, 2.33014084084, 2.33258998999, 2.33503913914, 
               2.33748828829, 2.33993743744, 2.34238658659, 2.34483573574, 2.34728488488, 2.34973403403, 
               2.35218318318, 2.35463233233, 2.35708148148, 2.35953063063, 2.36197977978, 2.36442892893, 
               2.36687807808, 2.36932722723, 2.37177637638, 2.37422552553, 2.37667467467, 2.37912382382, 
               2.38157297297, 2.38402212212, 2.38647127127, 2.38892042042, 2.39136956957, 2.39381871872, 
               2.39626786787, 2.39871701702, 2.40116616617, 2.40361531532, 2.40606446446, 2.40851361361, 
               2.41096276276, 2.41341191191, 2.41586106106, 2.41831021021, 2.42075935936, 2.42320850851, 
               2.42565765766, 2.42810680681, 2.43055595596, 2.43300510511, 2.43545425425, 2.4379034034, 
               2.44035255255, 2.4428017017, 2.4476995, 2.4477005]

##---------------------------------------------------------------------------##
## Set up and run the forward simulation
def runForwardSimulation( sim_name,
                          db_path,
                          geom_name,
                          num_particles,
                          incoherent_model_type,
                          threads,
                          use_energy_bins = False,
                          use_native = False,
                          log_file = None ):

    ## Initialize the MPI session
    session = MPI.GlobalMPISession( len(sys.argv), sys.argv )

    # Suppress logging on all procs except for the master (proc=0)
    Utility.removeAllLogs()
    session.initializeLogs( 0, True )

    if not log_file is None:
        session.initializeLogs( log_file, 0, True )

    ## Set the simulation properties
    simulation_properties = MonteCarlo.SimulationProperties()

    # Simulate photons only
    simulation_properties.setParticleMode( MonteCarlo.PHOTON_MODE )
    simulation_properties.setIncoherentModelType( incoherent_model_type )
    simulation_properties.setNumberOfPhotonHashGridBins( 100 )

    # Set the number of histories to run and the number of rendezvous
    simulation_properties.setNumberOfHistories( num_particles )
    simulation_properties.setMinNumberOfRendezvous( 10 )
    simulation_properties.setNumberOfSnapshotsPerBatch( 10 )

    ## Set up the materials
    database = Data.ScatteringCenterPropertiesDatabase( db_path )

    # Extract the properties from the database
    c_atom_properties = database.getAtomProperties( Data.ZAID(6000) )
    n_atom_properties = database.getAtomProperties( Data.ZAID(7000) )
    o_atom_properties = database.getAtomProperties( Data.ZAID(8000) )
    na_atom_properties = database.getAtomProperties( Data.ZAID(11000) )
    mg_atom_properties = database.getAtomProperties( Data.ZAID(12000) )
    al_atom_properties = database.getAtomProperties( Data.ZAID(13000) )
    si_atom_properties = database.getAtomProperties( Data.ZAID(14000) )
    ar_atom_properties = database.getAtomProperties( Data.ZAID(18000) )
    k_atom_properties = database.getAtomProperties( Data.ZAID(19000) )
    ca_atom_properties = database.getAtomProperties( Data.ZAID(20000) )
    ti_atom_properties = database.getAtomProperties( Data.ZAID(22000) )
    mn_atom_properties = database.getAtomProperties( Data.ZAID(25000) )
    fe_atom_properties = database.getAtomProperties( Data.ZAID(26000) )

    # Set the atom definitions
    scattering_center_definitions = Collision.ScatteringCenterDefinitionDatabase()

    c_atom_definition = scattering_center_definitions.createDefinition( "C", Data.ZAID(6000) )
    n_atom_definition = scattering_center_definitions.createDefinition( "N", Data.ZAID(7000) )
    o_atom_definition = scattering_center_definitions.createDefinition( "O", Data.ZAID(8000) )
    na_atom_definition = scattering_center_definitions.createDefinition( "Na", Data.ZAID(11000) )
    mg_atom_definition = scattering_center_definitions.createDefinition( "Mg", Data.ZAID(12000) )
    al_atom_definition = scattering_center_definitions.createDefinition( "Al", Data.ZAID(13000) )
    si_atom_definition = scattering_center_definitions.createDefinition( "Si", Data.ZAID(14000) )
    ar_atom_definition = scattering_center_definitions.createDefinition( "Ar", Data.ZAID(18000) )
    k_atom_definition = scattering_center_definitions.createDefinition( "K", Data.ZAID(19000) )
    ca_atom_definition = scattering_center_definitions.createDefinition( "Ca", Data.ZAID(20000) )
    ti_atom_definition = scattering_center_definitions.createDefinition( "Ti", Data.ZAID(22000) )
    mn_atom_definition = scattering_center_definitions.createDefinition( "Mn", Data.ZAID(25000) )
    fe_atom_definition = scattering_center_definitions.createDefinition( "Fe", Data.ZAID(26000) )

    if use_native:
        data_file_type = Data.PhotoatomicDataProperties.Native_EPR_FILE
        file_version = 0
    else:
        data_file_type = Data.PhotoatomicDataProperties.ACE_EPR_FILE
        file_version = 12

    c_atom_definition.setPhotoatomicDataProperties( c_atom_properties.getSharedPhotoatomicDataProperties( data_file_type, file_version ) )
    n_atom_definition.setPhotoatomicDataProperties( n_atom_properties.getSharedPhotoatomicDataProperties( data_file_type, file_version ) )
    o_atom_definition.setPhotoatomicDataProperties( o_atom_properties.getSharedPhotoatomicDataProperties( data_file_type, file_version ) )
    na_atom_definition.setPhotoatomicDataProperties( na_atom_properties.getSharedPhotoatomicDataProperties( data_file_type, file_version ) )
    mg_atom_definition.setPhotoatomicDataProperties( mg_atom_properties.getSharedPhotoatomicDataProperties( data_file_type, file_version ) )
    al_atom_definition.setPhotoatomicDataProperties( al_atom_properties.getSharedPhotoatomicDataProperties( data_file_type, file_version ) )
    si_atom_definition.setPhotoatomicDataProperties( si_atom_properties.getSharedPhotoatomicDataProperties( data_file_type, file_version ) )
    ar_atom_definition.setPhotoatomicDataProperties( ar_atom_properties.getSharedPhotoatomicDataProperties( data_file_type, file_version ) )
    k_atom_definition.setPhotoatomicDataProperties( k_atom_properties.getSharedPhotoatomicDataProperties( data_file_type, file_version ) )
    ca_atom_definition.setPhotoatomicDataProperties( ca_atom_properties.getSharedPhotoatomicDataProperties( data_file_type, file_version ) )
    ti_atom_definition.setPhotoatomicDataProperties( ti_atom_properties.getSharedPhotoatomicDataProperties( data_file_type, file_version ) )
    mn_atom_definition.setPhotoatomicDataProperties( mn_atom_properties.getSharedPhotoatomicDataProperties( data_file_type, file_version ) )
    fe_atom_definition.setPhotoatomicDataProperties( fe_atom_properties.getSharedPhotoatomicDataProperties( data_file_type, file_version ) )

    # Set the definition for material 1 (ave soil US from PNNL-15870 Rev1)
    material_definitions = Collision.MaterialDefinitionDatabase()
    material_definitions.addDefinition( "Soil", 1, ["O", "Na", "Mg", "Al", "Si", "K", "Ca", "Ti", "Mn", "Fe"], [0.670604, 0.005578, 0.011432, 0.053073, 0.201665, 0.007653, 0.026664, 0.002009, 0.000272, 0.021050] )
    
    material_definitions.addDefinition( "Air", 2, ["C", "N", "O", "Ar"], [0.000150, 0.784431, 0.231781, 0.004671] )

    # Set up the geometry
    model_properties = DagMC.DagMCModelProperties( geom_name )
    model_properties.setMaterialPropertyName( "mat" )
    model_properties.setDensityPropertyName( "rho" )
    model_properties.setTerminationCellPropertyName( "termination.cell" )
    model_properties.setReflectingSurfacePropertyName( "reflecting.surface" )
    model_properties.setSurfaceFluxName( "surface.flux" )
    model_properties.useFastIdLookup()

    # Load the model
    model = DagMC.DagMCModel( model_properties )

    # Fill the model with the defined material
    filled_model = Collision.FilledGeometryModel( db_path, scattering_center_definitions, material_definitions, simulation_properties, model, True )

    # Set up the source
    particle_distribution = ActiveRegion.StandardParticleDistribution( "contaminated soil dist" )

    decay_energy_dist = Distribution.DiscreteDistribution( [0.186211, 0.241995, 0.2656, 0.2952228, 0.3046, 0.3519321, 0.60932, 0.6496, 0.665447, 0.76836, 0.78596, 0.80618, 0.934056, 1.120294, 1.15521, 1.238122, 1.280976, 1.377669, 1.401515, 1.407988, 1.50921, 1.661274, 1.729595, 1.764491, 1.847429, 2.118514, 2.204059, 2.44770],
                                                        [3.64, 7.251, 51.0, 18.42, 28.0, 35.60, 45.49, 3.4, 1.531, 4.894, 1.06, 1.264, 3.107, 14.92, 1.633, 5.834, 1.434, 3.988, 1.330, 2.394, 2.130, 1.047, 2.878, 15.30, 2.025, 1.160, 4.924, 1.548] )
        
    energy_dimension_dist = ActiveRegion.IndependentEnergyDimensionDistribution( decay_energy_dist )
    particle_distribution.setDimensionDistribution( energy_dimension_dist )

    uniform_xy_position_dist = Distribution.UniformDistribution( -5.0, 5.0 )
    uniform_z_position_dist = Distribution.UniformDistribution( 5000, 5100 )

    x_position_dimension_dist = ActiveRegion.IndependentPrimarySpatialDimensionDistribution( uniform_xy_position_dist )
    y_position_dimension_dist = ActiveRegion.IndependentSecondarySpatialDimensionDistribution( uniform_xy_position_dist )
    z_position_dimension_dist = ActiveRegion.IndependentTertiarySpatialDimensionDistribution( uniform_z_position_dist )

    particle_distribution.setDimensionDistribution( x_position_dimension_dist )
    particle_distribution.setDimensionDistribution( y_position_dimension_dist )
    particle_distribution.setDimensionDistribution( z_position_dimension_dist )

    particle_distribution.constructDimensionDistributionDependencyTree()

    # The generic distribution will be used to generate photons
    photon_distribution = ActiveRegion.StandardPhotonSourceComponent( 0, 1.0, model, particle_distribution )

    # Assign the photon source component to the source
    source = ActiveRegion.StandardParticleSource( [photon_distribution] )

    # Set up the event handler
    event_handler = Event.EventHandler( model, simulation_properties )

    # Create the estimator response functions (flux-to-effective dose from
    # ICRP-116 table A.1, ISO values)
    flux_to_dose_dist = Distribution.TabularDistribution_LinLin( [0.01, 0.015, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.1, 0.15, 0.2, 0.3, 0.4, 0.5, 0.511, 0.6, 0.662, 0.8, 1.0, 1.117, 1.33, 1.5, 2.0, 3.0],
                                                                 [0.0288, 0.0560, 0.0812, 0.127, 0.158, 0.180, 0.199, 0.218, 0.239, 0.287, 0.429, 0.589, 0.932, 1.28, 1.63, 1.67, 1.97, 2.17, 2.62, 3.25, 3.60, 4.20, 4.66, 5.90, 8.08] )
    
    partial_response_function = ActiveRegion.EnergyParticleResponseFunction( flux_to_dose_dist )

    # convert from pSv to nSv
    response_function = partial_response_function / 1000.0

    response = ActiveRegion.StandardParticleResponse( response_function )

    source_norm = 1462129.344

    # Create the surface flux estimator
    surface_flux_estimator = Event.WeightMultipliedSurfaceFluxEstimator( 1, source_norm, [19], model )
    surface_flux_estimator.setParticleTypes( [MonteCarlo.PHOTON] )
    surface_flux_estimator.setCosineCutoffValue( 0.1 )
    surface_flux_estimator.setResponseFunctions( [response] )
    
    event_handler.addEstimator( surface_flux_estimator )

    # Create the second surface flux estimator
    if use_energy_bins:
        surface_flux_estimator_2 = Event.WeightMultipliedSurfaceFluxEstimator( 2, source_norm, [19], model )
        surface_flux_estimator_2.setEnergyDiscretization( energy_bins )
        surface_flux_estimator_2.setParticleTypes( [MonteCarlo.PHOTON] )
        surface_flux_estimator_2.setCosineCutoffValue( 0.1 )
        surface_flux_estimator_2.setResponseFunctions( [response] )

        event_handler.addEstimator( surface_flux_estimator_2 )

    # Set up the simulation manager
    factory = Manager.ParticleSimulationManagerFactory( filled_model,
                                                        source,
                                                        event_handler,
                                                        simulation_properties,
                                                        sim_name,
                                                        "xml",
                                                        threads )

    # Create the simulation manager
    manager = factory.getManager()
    manager.useSingleRendezvousFile()

    # Allow logging on all procs
    session.restoreOutputStreams()

    ## Run the simulation
    if session.size() == 1:
        manager.runInterruptibleSimulation()
    else:
        manager.runSimulation()

##---------------------------------------------------------------------------##
## Set up and run the adjoint simulation
def runAdjointSimulation( sim_name,
                          db_path,
                          geom_name,
                          num_particles,
                          incoherent_model_type,
                          threads,
                          use_energy_bins = False,
                          log_file= None ):

    ## Initialize the MPI session
    session = MPI.GlobalMPISession( len(sys.argv), sys.argv )

    # Suppress logging on all procs except for the master (proc=0)
    Utility.removeAllLogs()
    session.initializeLogs( 0, True )

    if not log_file is None:
        session.initializeLogs( log_file, 0, True )

    ## Set the simulation properties
    simulation_properties = MonteCarlo.SimulationProperties()

    # Simulate photons only
    simulation_properties.setParticleMode( MonteCarlo.ADJOINT_PHOTON_MODE )
    simulation_properties.setIncoherentAdjointModelType( incoherent_model_type )
    simulation_properties.setMinAdjointPhotonEnergy( 1e-3 )

    if incoherent_model_type == MonteCarlo.DB_IMPULSE_INCOHERENT_ADJOINT_MODEL:
        simulation_properties.setMaxAdjointPhotonEnergy( energy_bins[-1]*1.5 )
    else:
        simulation_properties.setMaxAdjointPhotonEnergy( energy_bins[-1] )
    
    simulation_properties.setCriticalAdjointPhotonLineEnergies( [0.186211, 0.241995, 0.2656, 0.2952228, 0.3046, 0.3519321, 0.60932, 0.6496, 0.665447, 0.76836,  0.78596, 0.80618, 0.934056, 1.120294, 1.15521, 1.238122, 1.280976, 1.377669, 1.401515, 1.407988, 1.50921, 1.661274, 1.729595, 1.764491, 1.847429, 2.118514, 2.204059, 2.44770] )
    simulation_properties.setAdjointPhotonRouletteThresholdWeight( 0.0025 )
    simulation_properties.setAdjointPhotonRouletteSurvivalWeight(  0.005 )
    simulation_properties.setNumberOfAdjointPhotonHashGridBins( 100 )

    # Set the number of histories to run and the number of rendezvous
    simulation_properties.setNumberOfHistories( num_particles )
    simulation_properties.setMinNumberOfRendezvous( 100 )
    simulation_properties.setNumberOfSnapshotsPerBatch( 1 )

    ## Set up the materials
    database = Data.ScatteringCenterPropertiesDatabase( db_path )

    # Extract the properties from the database
    c_atom_properties = database.getAtomProperties( Data.ZAID(6000) )
    n_atom_properties = database.getAtomProperties( Data.ZAID(7000) )
    o_atom_properties = database.getAtomProperties( Data.ZAID(8000) )
    na_atom_properties = database.getAtomProperties( Data.ZAID(11000) )
    mg_atom_properties = database.getAtomProperties( Data.ZAID(12000) )
    al_atom_properties = database.getAtomProperties( Data.ZAID(13000) )
    si_atom_properties = database.getAtomProperties( Data.ZAID(14000) )
    ar_atom_properties = database.getAtomProperties( Data.ZAID(18000) )
    k_atom_properties = database.getAtomProperties( Data.ZAID(19000) )
    ca_atom_properties = database.getAtomProperties( Data.ZAID(20000) )
    ti_atom_properties = database.getAtomProperties( Data.ZAID(22000) )
    mn_atom_properties = database.getAtomProperties( Data.ZAID(25000) )
    fe_atom_properties = database.getAtomProperties( Data.ZAID(26000) )

    # Set the atom definitions
    scattering_center_definitions = Collision.ScatteringCenterDefinitionDatabase()

    c_atom_definition = scattering_center_definitions.createDefinition( "C", Data.ZAID(6000) )
    n_atom_definition = scattering_center_definitions.createDefinition( "N", Data.ZAID(7000) )
    o_atom_definition = scattering_center_definitions.createDefinition( "O", Data.ZAID(8000) )
    na_atom_definition = scattering_center_definitions.createDefinition( "Na", Data.ZAID(11000) )
    mg_atom_definition = scattering_center_definitions.createDefinition( "Mg", Data.ZAID(12000) )
    al_atom_definition = scattering_center_definitions.createDefinition( "Al", Data.ZAID(13000) )
    si_atom_definition = scattering_center_definitions.createDefinition( "Si", Data.ZAID(14000) )
    ar_atom_definition = scattering_center_definitions.createDefinition( "Ar", Data.ZAID(18000) )
    k_atom_definition = scattering_center_definitions.createDefinition( "K", Data.ZAID(19000) )
    ca_atom_definition = scattering_center_definitions.createDefinition( "Ca", Data.ZAID(20000) )
    ti_atom_definition = scattering_center_definitions.createDefinition( "Ti", Data.ZAID(22000) )
    mn_atom_definition = scattering_center_definitions.createDefinition( "Mn", Data.ZAID(25000) )
    fe_atom_definition = scattering_center_definitions.createDefinition( "Fe", Data.ZAID(26000) )

    data_file_type = Data.AdjointPhotoatomicDataProperties.Native_EPR_FILE
    file_version = 0

    c_atom_definition.setAdjointPhotoatomicDataProperties( c_atom_properties.getSharedAdjointPhotoatomicDataProperties( data_file_type, file_version ) )
    n_atom_definition.setAdjointPhotoatomicDataProperties( n_atom_properties.getSharedAdjointPhotoatomicDataProperties( data_file_type, file_version ) )
    o_atom_definition.setAdjointPhotoatomicDataProperties( o_atom_properties.getSharedAdjointPhotoatomicDataProperties( data_file_type, file_version ) )
    na_atom_definition.setAdjointPhotoatomicDataProperties( na_atom_properties.getSharedAdjointPhotoatomicDataProperties( data_file_type, file_version ) )
    mg_atom_definition.setAdjointPhotoatomicDataProperties( mg_atom_properties.getSharedAdjointPhotoatomicDataProperties( data_file_type, file_version ) )
    al_atom_definition.setAdjointPhotoatomicDataProperties( al_atom_properties.getSharedAdjointPhotoatomicDataProperties( data_file_type, file_version ) )
    si_atom_definition.setAdjointPhotoatomicDataProperties( si_atom_properties.getSharedAdjointPhotoatomicDataProperties( data_file_type, file_version ) )
    ar_atom_definition.setAdjointPhotoatomicDataProperties( ar_atom_properties.getSharedAdjointPhotoatomicDataProperties( data_file_type, file_version ) )
    k_atom_definition.setAdjointPhotoatomicDataProperties( k_atom_properties.getSharedAdjointPhotoatomicDataProperties( data_file_type, file_version ) )
    ca_atom_definition.setAdjointPhotoatomicDataProperties( ca_atom_properties.getSharedAdjointPhotoatomicDataProperties( data_file_type, file_version ) )
    ti_atom_definition.setAdjointPhotoatomicDataProperties( ti_atom_properties.getSharedAdjointPhotoatomicDataProperties( data_file_type, file_version ) )
    mn_atom_definition.setAdjointPhotoatomicDataProperties( mn_atom_properties.getSharedAdjointPhotoatomicDataProperties( data_file_type, file_version ) )
    fe_atom_definition.setAdjointPhotoatomicDataProperties( fe_atom_properties.getSharedAdjointPhotoatomicDataProperties( data_file_type, file_version ) )

    # Set the definition for material 1 (ave soil US from PNNL-15870 Rev1)
    material_definitions = Collision.MaterialDefinitionDatabase()
    material_definitions.addDefinition( "Soil", 1, ["O", "Na", "Mg", "Al", "Si", "K", "Ca", "Ti", "Mn", "Fe"], [0.670604, 0.005578, 0.011432, 0.053073, 0.201665, 0.007653, 0.026664, 0.002009, 0.000272, 0.021050] )
    
    material_definitions.addDefinition( "Air", 2, ["C", "N", "O", "Ar"], [0.000150, 0.784431, 0.231781, 0.004671] )

    # Set up the geometry
    model_properties = DagMC.DagMCModelProperties( geom_name )
    model_properties.setMaterialPropertyName( "mat" )
    model_properties.setDensityPropertyName( "rho" )
    model_properties.setTerminationCellPropertyName( "termination.cell" )
    model_properties.setReflectingSurfacePropertyName( "reflecting.surface" )
    model_properties.setSurfaceFluxName( "surface.flux" )
    model_properties.useFastIdLookup()

    # Load the model
    model = DagMC.DagMCModel( model_properties )

    # Fill the model with the defined material
    filled_model = Collision.FilledGeometryModel( db_path, scattering_center_definitions, material_definitions, simulation_properties, model, True )

    # Set up the source
    particle_distribution = ActiveRegion.StandardParticleDistribution( "isotropic point source" )

    uniform_energy = Distribution.UniformDistribution( 1e-3, energy_bins[-1] )
    energy_dimension_dist = ActiveRegion.IndependentEnergyDimensionDistribution( uniform_energy )
    particle_distribution.setDimensionDistribution( energy_dimension_dist )
    particle_distribution.setPosition( 0.0, 0.0, 5280.0 )
    particle_distribution.constructDimensionDistributionDependencyTree()

    # The generic distribution will be used to generate photons
    adjoint_photon_distribution = ActiveRegion.StandardAdjointPhotonSourceComponent( 0, 1.0, filled_model, particle_distribution )

    # Assign the photon source component to the source
    source = ActiveRegion.StandardParticleSource( [adjoint_photon_distribution] )

    ## Set up the event handler
    event_handler = Event.EventHandler( model, simulation_properties )

    # Create the discrete forward source line energy response function
    discrete_energy_response_function = ActiveRegion.EnergyParticleResponseFunction( Distribution.DiscreteDistribution( [0.186211, 0.241995, 0.2656, 0.2952228, 0.3046, 0.3519321, 0.60932, 0.6496, 0.665447, 0.76836, 0.78596, 0.80618, 0.934056, 1.120294, 1.15521, 1.238122, 1.280976, 1.377669, 1.401515, 1.407988, 1.50921, 1.661274, 1.729595, 1.764491, 1.847429, 2.118514, 2.204059, 2.44770],
                                                                                                                        [0.013622652525055947, 0.02713677292834634, 0.1908668348290806, 0.068936609755915, 0.10478963480812267, 0.13323253568461313, 0.17024573169362503, 0.012724455655272039, 0.0057297475318298504, 0.01831573116967687, 0.00396703617487893, 0.004730503514195252, 0.011627906976744184, 0.05583790540489965, 0.006111481201488011, 0.021833668909663845, 0.005366726296958854, 0.014925037986242614, 0.004977507653385827, 0.00895951377609449, 0.007971497219332189, 0.003918383844432301, 0.010770877463492038, 0.057260050448724176, 0.007578536088801728, 0.004341284870622224, 0.01842800577839986, 0.005793369810106211] ) )

    # Create the flux-to-effective dose from ICRP-116 table A.1, ISO values)
    flux_to_dose_response_function = ActiveRegion.SourceEnergyParticleResponseFunction( Distribution.TabularDistribution_LinLin( [0.01, 0.015, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.1, 0.15, 0.2, 0.3, 0.4, 0.5, 0.511, 0.6, 0.662, 0.8, 1.0, 1.117, 1.33, 1.5, 2.0, 3.0],
                                                                                                                                 [0.0288, 0.0560, 0.0812, 0.127, 0.158, 0.180, 0.199, 0.218, 0.239, 0.287, 0.429, 0.589, 0.932, 1.28, 1.63, 1.67, 1.97, 2.17, 2.62, 3.25, 3.60, 4.20, 4.66, 5.90, 8.08] ) )

    # Create the complete response function
    response = ActiveRegion.StandardParticleResponse( discrete_energy_response_function*flux_to_dose_response_function/1000.0 )

    source_norm = 1462129.344*(energy_bins[-1] - 1e-3)

    # Create the cell track-length flux estimator
    cell_flux_estimator = Event.WeightMultipliedCellTrackLengthFluxEstimator( 1, source_norm, [2], model )
    cell_flux_estimator.setParticleTypes( [MonteCarlo.ADJOINT_PHOTON] )
    cell_flux_estimator.setResponseFunctions( [response] )

    event_handler.addEstimator( cell_flux_estimator )

    # Create the second estimator
    if use_energy_bins:
        cell_flux_estimator_2 = Event.WeightMultipliedCellTrackLengthFluxEstimator( 2, source_norm, [2], model )
        cell_flux_estimator_2.setSourceEnergyDiscretization( energy_bins )
        cell_flux_estimator_2.setParticleTypes( [MonteCarlo.ADJOINT_PHOTON] )
        cell_flux_estimator_2.setResponseFunctions( [response] )
        
        event_handler.addEstimator( cell_flux_estimator_2 )

    # Set up the simulation manager
    factory = Manager.ParticleSimulationManagerFactory( filled_model,
                                                        source,
                                                        event_handler,
                                                        simulation_properties,
                                                        sim_name,
                                                        "xml",
                                                        threads )

    # Create the simulation manager
    manager = factory.getManager()
    manager.useSingleRendezvousFile()

    # Allow logging on all procs
    session.restoreOutputStreams()

    ## Run the simulation
    if session.size() == 1:
        manager.runInterruptibleSimulation()
    else:
        manager.runSimulation()
