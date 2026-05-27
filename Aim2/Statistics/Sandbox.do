clear all

import excel "C:\Users\fahim\Downloads\!! paper 1 PV loop\Statistics\PV Loop Statistics-Raw Data.xlsx", sheet("Pre and Post Occlusion") firstrow


/* destring all the data columns in case there are some which are empty data sets due to data corruption */
destring StrokeWork StrokeVolume EjectionFraction HeartRate CardiacOutput Elastance MaxPressure MinPressure MaxVolume MinVolume ESV ESP EDV EDP, replace force


/*
ssc install vioplot, replace


vioplot StrokeWork, over(TimeNumerical) by(Group PrePostOcclusion) vertical name (StrokeWork)


vioplot StrokeWork, over(TimeNumerical) by(Group PrePostOcclusion) vertical name (StrokeWork)

set autotabgraphs on
vioplot StrokeWork, over(TimeNumerical) by(Group PrePostOcclusion) name(SW)
vioplot StrokeVolume, over(TimeNumerical) by(Group PrePostOcclusion) name(SV)
vioplot EjectionFraction, over(TimeNumerical) by(Group PrePostOcclusion) name(EJF)
vioplot HeartRate, over(TimeNumerical) by(Group PrePostOcclusion) name(HR)
vioplot CardiacOutput, over(TimeNumerical) by(Group PrePostOcclusion) name(CO)
vioplot Elastance, over(TimeNumerical) by(Group PrePostOcclusion) name(Ea)
vioplot MaxPressure, over(TimeNumerical) by(Group PrePostOcclusion) name(MaxPress)
vioplot MinPressure, over(TimeNumerical) by(Group PrePostOcclusion) name(MinPress)
vioplot MaxVolume, over(TimeNumerical) by(Group PrePostOcclusion) name(MaxVol)
vioplot MinVolume, over(TimeNumerical) by(Group PrePostOcclusion) name(Min_Vol)
vioplot ESV  EDV, over(TimeNumerical) by(Group PrePostOcclusion) name(ESV_EDV)
vioplot ESP EDP, over(TimeNumerical) by(Group PrePostOcclusion) name(ESP_EDP)
set autotabgraphs off


title("Violin Plot of Mileage") subtitle("By repair record") 
ytitle(Repair Record) ylab(, angle(0)) scheme(s2mono)


*/


/*generate box plots */
set autotabgraphs on

graph box StrokeWork, over(TimeNumerical) by(Group PrePostOcclusion) name(SW)
set autotabgraphs off
graph box EjectionFraction, over(TimeNumerical) by(Group PrePostOcclusion) name(EJF)
set autotabgraphs on
graph box StrokeVolume, over(TimeNumerical) by(Group PrePostOcclusion) name(SV)
set autotabgraphs off



destring 
graph box StrokeWork PrePostOcclusion, over(TimeNumerical) by(Group ) name(SW2)