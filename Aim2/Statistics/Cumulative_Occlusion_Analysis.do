/*  STATA Analysis of All Occlusion PhaseData */
/* Fahim Usshihab Mobin */
/* 18.12.22 */
clear all

import excel "C:\Users\fahim\Downloads\!! paper 1 PV loop\Statistics\PV Loop Statistics-Raw Data.xlsx", sheet("Cumulative Sheet") firstrow


/* destring all the data columns in case there are some which are empty data sets due to the original data not being present or corrupted */
destring StrokeWork StrokeVolume EjectionFraction HeartRate CardiacOutput Elastance MaxPressure MinPressure MaxVolume MinVolume ESV ESP EDV EDP, replace force


/* generate box plots */
/* commented out for now */

/*
set autotabgraphs on
graph box StrokeWork, over(TimeNumerical) by(Group CavalOcclusion) name(SW)
graph box StrokeVolume, over(TimeNumerical) by(Group CavalOcclusion) name(SV)
graph box EjectionFraction, over(TimeNumerical) by(Group CavalOcclusion) name(EJF)
graph box HeartRate, over(TimeNumerical) by(Group CavalOcclusion) name(HR)
graph box CardiacOutput, over(TimeNumerical) by(Group CavalOcclusion) name(CO)
graph box Elastance, over(TimeNumerical) by(Group CavalOcclusion) name(Ea)
graph box MaxPressure, over(TimeNumerical) by(Group CavalOcclusion) name(MaxPress)
graph box MinPressure, over(TimeNumerical) by(Group CavalOcclusion) name(MinPress)
graph box MaxVolume, over(TimeNumerical) by(Group CavalOcclusion) name(MaxVol)
graph box MinVolume, over(TimeNumerical) by(Group CavalOcclusion) name(Min_Vol)
graph box ESV  EDV, over(TimeNumerical) by(Group CavalOcclusion) name(ESV_EDV)
graph box ESP EDP, over(TimeNumerical) by(Group CavalOcclusion) name(ESP_EDP)
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


/* MANOVA without CavalOcclusion */

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



/* MANOVA with CavalOcclusion */

manova StrokeWork CavalOcclusionNumerical= TimeNumerical GroupNumerical
manova StrokeVolume CavalOcclusionNumerical= TimeNumerical GroupNumerical

manova EjectionFraction= TimeNumerical GroupNumerical
manova HeartRate CavalOcclusionNumerical= TimeNumerical GroupNumerical

manova CardiacOutput CavalOcclusionNumerical= TimeNumerical GroupNumerical
manova Elastance CavalOcclusionNumerical=TimeNumerical GroupNumerical

manova MaxPressure CavalOcclusionNumerical= TimeNumerical GroupNumerical
manova MinPressure CavalOcclusionNumerical= TimeNumerical GroupNumerical

manova MaxPressure CavalOcclusionNumerical= TimeNumerical GroupNumerical
manova MinPressure CavalOcclusionNumerical= TimeNumerical GroupNumerical

manova MaxVolume CavalOcclusionNumerical= TimeNumerical GroupNumerical
manova MinVolume CavalOcclusionNumerical= TimeNumerical GroupNumerical

manova ESV CavalOcclusionNumerical= TimeNumerical GroupNumerical
manova ESP CavalOcclusionNumerical= TimeNumerical GroupNumerical

manova EDV CavalOcclusionNumerical= TimeNumerical GroupNumerical
manova EDP CavalOcclusionNumerical= TimeNumerical GroupNumerical


/* Regressions without CavalOcclusion */
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




/* Regressions with CavalOcclusion */

regress StrokeWork CavalOcclusionNumerical TimeNumerical GroupNumerical
regress StrokeVolume CavalOcclusionNumerical TimeNumerical GroupNumerical

regress EjectionFraction TimeNumerical GroupNumerical
regress HeartRate CavalOcclusionNumerical TimeNumerical GroupNumerical

regress CardiacOutput CavalOcclusionNumerical TimeNumerical GroupNumerical
regress Elastance CavalOcclusionNumerical TimeNumerical GroupNumerical

regress MaxPressure CavalOcclusionNumerical TimeNumerical GroupNumerical
regress MinPressure CavalOcclusionNumerical TimeNumerical GroupNumerical

regress MaxPressure CavalOcclusionNumerical TimeNumerical GroupNumerical
regress MinPressure CavalOcclusionNumerical TimeNumerical GroupNumerical

regress MaxVolume CavalOcclusionNumerical TimeNumerical GroupNumerical
regress MinVolume CavalOcclusionNumerical TimeNumerical GroupNumerical

regress ESV CavalOcclusionNumerical TimeNumerical GroupNumerical
regress ESP CavalOcclusionNumerical TimeNumerical GroupNumerical

regress EDV CavalOcclusionNumerical TimeNumerical GroupNumerical
regress EDP CavalOcclusionNumerical TimeNumerical GroupNumerical



