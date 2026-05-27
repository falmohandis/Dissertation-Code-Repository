/*  STATA Analysis of Pre and Post Occlusion Data */
/* Fahim Usshihab Mobin */
/* 18.12.22 */
clear all

import excel "C:\Users\fahim\Downloads\!! paper 1 PV loop\Statistics\PV Loop Statistics-Raw Data.xlsx", sheet("Pre and Post Occlusion") firstrow


/* destring all the data columns in case there are some which are empty data sets due to the original data not being present or corrupted */
destring StrokeWork StrokeVolume EjectionFraction HeartRate CardiacOutput Elastance MaxPressure MinPressure MaxVolume MinVolume ESV ESP EDV EDP, replace force


/* generate box plots */
/* commented out for now */

/*
set autotabgraphs on
graph box StrokeWork, over(TimeNumerical) by(Group PrePostOcclusion) name(SW)
graph box StrokeVolume, over(TimeNumerical) by(Group PrePostOcclusion) name(SV)
graph box EjectionFraction, over(TimeNumerical) by(Group PrePostOcclusion) name(EJF)
graph box HeartRate, over(TimeNumerical) by(Group PrePostOcclusion) name(HR)
graph box CardiacOutput, over(TimeNumerical) by(Group PrePostOcclusion) name(CO)
graph box Elastance, over(TimeNumerical) by(Group PrePostOcclusion) name(Ea)
graph box MaxPressure, over(TimeNumerical) by(Group PrePostOcclusion) name(MaxPress)
graph box MinPressure, over(TimeNumerical) by(Group PrePostOcclusion) name(MinPress)
graph box MaxVolume, over(TimeNumerical) by(Group PrePostOcclusion) name(MaxVol)
graph box MinVolume, over(TimeNumerical) by(Group PrePostOcclusion) name(Min_Vol)
graph box ESV  EDV, over(TimeNumerical) by(Group PrePostOcclusion) name(ESV_EDV)
graph box ESP EDP, over(TimeNumerical) by(Group PrePostOcclusion) name(ESP_EDP)
set autotabgraphs off
*/



/* ANOVA */

anova StrokeWork TimeNumerical GroupNumerical
anova StrokeVolume TimeNumerical GroupNumerical

anova EjectionFraction TimeNumerical GroupNumerical
anova HeartRate TimeNumerical GroupNumerical

anova CardiacOutput TimeNumerical GroupNumerical
anova Elastance TimeNumerical GroupNumerical

anova MaxPressure TimeNumerical GroupNumerical
anova MinPressure TimeNumerical GroupNumerical

anova MaxPressure TimeNumerical GroupNumerical
anova MinPressure TimeNumerical GroupNumerical

anova MaxVolume TimeNumerical GroupNumerical
anova MinVolume TimeNumerical GroupNumerical

anova ESV TimeNumerical GroupNumerical
anova ESP TimeNumerical GroupNumerical

anova EDV TimeNumerical GroupNumerical
anova EDP TimeNumerical GroupNumerical


/* MANOVA without PrePostOcclusion */

manova StrokeWork= TimeNumerical GroupNumerical
manova StrokeVolume= TimeNumerical GroupNumerical

manova EjectionFraction= TimeNumerical GroupNumerical
manova HeartRate= TimeNumerical GroupNumerical

manova CardiacOutput= TimeNumerical GroupNumerical
manova Elastance=TimeNumerical GroupNumerical

manova MaxPressure= TimeNumerical GroupNumerical
manova MinPressure= TimeNumerical GroupNumerical

manova MaxPressure= TimeNumerical GroupNumerical
manova MinPressure= TimeNumerical GroupNumerical

manova MaxVolume= TimeNumerical GroupNumerical
manova MinVolume= TimeNumerical GroupNumerical

manova ESV= TimeNumerical GroupNumerical
manova ESP= TimeNumerical GroupNumerical

manova EDV= TimeNumerical GroupNumerical
manova EDP= TimeNumerical GroupNumerical



/* MANOVA with PrePostOcclusion */

manova StrokeWork PrePostOcclusionNumerical= TimeNumerical GroupNumerical
manova StrokeVolume PrePostOcclusionNumerical= TimeNumerical GroupNumerical

manova EjectionFraction= TimeNumerical GroupNumerical
manova HeartRate PrePostOcclusionNumerical= TimeNumerical GroupNumerical

manova CardiacOutput PrePostOcclusionNumerical= TimeNumerical GroupNumerical
manova Elastance PrePostOcclusionNumerical=TimeNumerical GroupNumerical

manova MaxPressure PrePostOcclusionNumerical= TimeNumerical GroupNumerical
manova MinPressure PrePostOcclusionNumerical= TimeNumerical GroupNumerical

manova MaxPressure PrePostOcclusionNumerical= TimeNumerical GroupNumerical
manova MinPressure PrePostOcclusionNumerical= TimeNumerical GroupNumerical

manova MaxVolume PrePostOcclusionNumerical= TimeNumerical GroupNumerical
manova MinVolume PrePostOcclusionNumerical= TimeNumerical GroupNumerical

manova ESV PrePostOcclusionNumerical= TimeNumerical GroupNumerical
manova ESP PrePostOcclusionNumerical= TimeNumerical GroupNumerical

manova EDV PrePostOcclusionNumerical= TimeNumerical GroupNumerical
manova EDP PrePostOcclusionNumerical= TimeNumerical GroupNumerical


/* Regressions without PrePostOcclusion */
regress StrokeWork  TimeNumerical GroupNumerical
regress StrokeVolume  TimeNumerical GroupNumerical

regress EjectionFraction TimeNumerical GroupNumerical
regress HeartRate  TimeNumerical GroupNumerical

regress CardiacOutput  TimeNumerical GroupNumerical
regress Elastance  TimeNumerical GroupNumerical

regress MaxPressure  TimeNumerical GroupNumerical
regress MinPressure  TimeNumerical GroupNumerical

regress MaxPressure  TimeNumerical GroupNumerical
regress MinPressure  TimeNumerical GroupNumerical

regress MaxVolume  TimeNumerical GroupNumerical
regress MinVolume  TimeNumerical GroupNumerical

regress ESV  TimeNumerical GroupNumerical
regress ESP  TimeNumerical GroupNumerical

regress EDV  TimeNumerical GroupNumerical
regress EDP  TimeNumerical GroupNumerical




/* Regressions with PrePostOcclusion */

regress StrokeWork PrePostOcclusionNumerical TimeNumerical GroupNumerical
regress StrokeVolume PrePostOcclusionNumerical TimeNumerical GroupNumerical

regress EjectionFraction TimeNumerical GroupNumerical
regress HeartRate PrePostOcclusionNumerical TimeNumerical GroupNumerical

regress CardiacOutput PrePostOcclusionNumerical TimeNumerical GroupNumerical
regress Elastance PrePostOcclusionNumerical TimeNumerical GroupNumerical

regress MaxPressure PrePostOcclusionNumerical TimeNumerical GroupNumerical
regress MinPressure PrePostOcclusionNumerical TimeNumerical GroupNumerical

regress MaxPressure PrePostOcclusionNumerical TimeNumerical GroupNumerical
regress MinPressure PrePostOcclusionNumerical TimeNumerical GroupNumerical

regress MaxVolume PrePostOcclusionNumerical TimeNumerical GroupNumerical
regress MinVolume PrePostOcclusionNumerical TimeNumerical GroupNumerical

regress ESV PrePostOcclusionNumerical TimeNumerical GroupNumerical
regress ESP PrePostOcclusionNumerical TimeNumerical GroupNumerical

regress EDV PrePostOcclusionNumerical TimeNumerical GroupNumerical
regress EDP PrePostOcclusionNumerical TimeNumerical GroupNumerical



