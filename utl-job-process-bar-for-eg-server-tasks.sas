Job process bar for EG server tasks.

github
https://github.com/rogerjdeangelis/utl-job-process-bar-for-eg-server-tasks

This is needed becase unlike 1980s Classic SAS, EG
does not make the running log available.

This was first proposed by
Chris Hemedinger

Macro on end

HAVE 100,000,000 random numbers


WORK.HAVE total obs=100,000,000

  REC      RAN

    1    0.24381
    2    0.08948
    3    0.38319
    4    0.09793
    5    0.25758
  ...

EXAMPLE OUTPUT
--------------

Click on 'details' in lower right. Details is very small and in blue.

The following panel will pop up and will be updated
about every second


      ---------------------------------------------------------
Secs  Task    |  Status            | Que | Server | Server Type
      -------------------------------------------------------
      ProgBar    Running Data step          sasCCw   workspace

 1    ProgBar    OBS N=10,000,000           sasCCw   workspace
 2    ProgBar    OBS N=20,000,000           sasCCw   workspace
...
10    ProgBar    OBS N=100,000,000          sasCCw   workspace


PROCESS
=======

data want;
  set have;
  %ego_bar(100000);
run;quit;


OUTPUT
======

see panel above

*                _               _       _
 _ __ ___   __ _| | _____     __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \   / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/  | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|   \__,_|\__,_|\__\__,_|

;

data have;
 do rec=1 to 1e8;
   ran=uniform(1234);
   output;
 end;
run;quit;

*
 _ __ ___   __ _  ___ _ __ ___
| '_ ` _ \ / _` |/ __| '__/ _ \
| | | | | | (_| | (__| | | (_) |
|_| |_| |_|\__,_|\___|_|  \___/

;

%macro ego_bar(rec)/ des="process bar for eg job";
     if mod(_n_,&rec)=0 then
        rc = dosubl(cats('SYSECHO "OBS N=',put(_N_,comma18.),'";'));
     drop rc;
%mend ego_bar;




