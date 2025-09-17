
 ;load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
 ;load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl" 
 ;load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"
 ;load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
begin
;---Open WRF output file.
  ;f1  =addfile("/home/220220948481/585/5852060/CAMx6.test.190520.avrg.grd01.nc","r")
   f1  =addfile("/home/220220948481/245/24520301/wrfout_d01_2019-07-11_00:00:00","r")
 ;outfile = addfile("/group_homes/lzu_public/home/zhangml20/wrf-chem/WRFV3/test/wrf-out/20220719.nc","c")
   ;lat!0                      = "lat"
   ;lat@long_name    = "latitude"
    ;lat@units              = "degrees_north"
    ;lon!0                     = "lon"
    ;lon@long_name   = "longitude"
    ;lon@units              = "degrees_easy"
    ;u!0       = "lat"                            ;
    ;u!1       = "lon"
    ;u&lat    =  lat                             ; coordinate variables
    ;u&lon   =  lon                            ; assign values
    ;u@long_name = "zonal wind¡°  ; attributes
    ;u@units            = "m/s"

o31=wrf_user_getvar(f1, "QVAPOR", -1);time,bottom_top,south_north,west_east
O31:=o31(0:240,0,:,:)
o32=wrf_user_getvar(f1, "P", -1);time,bottom_top,south_north,west_east
O32:=o32(0:240,0,:,:)
o33=wrf_user_getvar(f1, "PB", -1);time,bottom_top,south_north,west_east
O33:=o33(0:240,0,:,:)
;P=new((/241,189,199/),float,"No_FillValue")
;P(:,:,:) = O32(:,:,:) + O33(:,:,:)
;o34=wrf_user_getvar(f1, "T", -1);time,bottom_top,south_north,west_east
;O34:=o34(0:240,0,:,:)
o34=wrf_user_getvar(f1, "T2", -1);time,bottom_top,south_north,west_east
O34:=o34(0:240,:,:)
;t(:,:,:) = O34(:,:,:) + 300
;TK = wrf_tk (P, theta)
 ; RH = wrf_rh (qv, P, TK)

;o35=wrf_user_getvar(f1, "no2", -1);time,bottom_top,south_north,west_east
;O35:=o35(0:240,0,:,:)

;f1 var
;tk1=wrf_user_getvar(f1, "tk", -1);time,bottom_top,south_north,west_east
;tk1:=tk1(:,0,:,:);time,bottom_top(choose 0),south_north,west_east
;p1=wrf_user_getvar(f1, "p", -1);time,bottom_top,south_north,west_east
;p1:=p1(:,0,:,:)
;o32 = dim_avg_n(o3,0);time,bottom_top,south_north,west_east
;calculate o3 from ppmv to ug/m3 f12
Mo3=47.9982
;create new o3 var include all time
O31mean=dim_avg_n_Wrap(O31,0)
printVarSummary(O31mean)
O32mean=dim_avg_n_Wrap(O32,0)
printVarSummary(O32mean)
O33mean=dim_avg_n_Wrap(O33,0)
printVarSummary(O33mean)
O34mean=dim_avg_n_Wrap(O34,0)
printVarSummary(O34mean)
;O35mean=dim_avg_n_Wrap(RH,0)
;printVarSummary(O35mean)
;  t1 = ncfile1->PM2_5_DRY(41:64,0,:,:)
;  T1=t1(south_north|:,west_east|:,Time|:)
;  T = dim_avg_n_Wrap(T1,2)
  
;  printVarSummary(T)
 ; lat2d=wrf_user_getvar(ncfile1,"lat",0)
   
 ; lon2d=wrf_user_getvar(ncfile1,"lon",0)
; T@lat2d=wrf_user_getvar(ncfile,"XLAT", 0)
 ; T@lon2d=wrf_user_getvar(ncfile, "XLONG", 0) 
 ; outfile->PM2_5_DRY =T
 ; outfile->lat =lat2d
 ; outfile->lon =lon2d
 asciiwrite("QVAPOR.csv",O31mean)
 asciiwrite("P.csv",O32mean)
 asciiwrite("PB.csv",O33mean)
 asciiwrite("T.csv",O34mean)
; asciiwrite("rhmean.csv",O35mean)

 ;asciiwrite("lat1.txt",lat2d)
end

