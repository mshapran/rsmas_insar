# vim: set filetype=sh:
echo "sourcing ${PWD}/bashfiles/alias.bash ..."

###################################################################
# skip remaining setup if not an interactive shell
if [ -z "${USER}" ] || [ -z "${PS1}" ]
then
    return
fi
######################################
###### scheduler #####################
######################################
alias setqueuedebug='export QUEUENAME=debug;    echo "QUEUENAME:   "${QUEUENAME}' 
alias setqueuegeneral='export QUEUENAME=general;  echo "QUEUENAME:   "${QUEUENAME}' 
alias setqueueparallel='export QUEUENAME=parallel; echo "QUEUENAME:   "${QUEUENAME}' 
alias setqueuebigmem='export QUEUENAME=bigmem; echo "QUEUENAME:   "${QUEUENAME}' 

######################################
######## roi_pac and setup ###########
######################################
alias cdr='cd ${PARENTDIR}'
alias cdrb='cd ${PARENTDIR}/bashfiles'
alias cdrs='cd ${INT_SCR}'
alias cdrsa='cd ${PARENTDIR}/samples'
alias cdri='cd ${PARENTDIR}/minsar'
alias cdmi='cd ${PARENTDIR}/minsar'
alias cdmimt='cd ${PARENTDIR}/sources/mimt'
alias cdrt='cd ${PARENTDIR}/sources/rsmas_tools'
alias cdrts='cd ${PARENTDIR}/sources/rsmas_tools/SAR'
alias cdrtg='cd ${PARENTDIR}/sources/rsmas_tools/GPS'
alias cdrtn='cd ${PARENTDIR}/sources/rsmas_tools/notebooks'
alias cdrtm='cd ${PARENTDIR}/sources/rsmas_tools/matlab'
alias cdrtmf='cd ${PARENTDIR}/sources/rsmas_tools/matlab/falk'
alias cdss='cd ${PARENTDIR}/3rdparty/sentinelstack/sentinelstack'
alias VDMSCRATCH='cd ${PARENTDIR}; source default.bash; source custom.bash; cd -; export SCRATCHDIR=/scratch/projects/vdm/${USER};  echo "SCRATCHDIR:   "${SCRATCHDIR}'
alias INSARLABSCRATCH='cd ${PARENTDIR}; source default.bash; source custom.bash; cd -; export SCRATCHDIR=/scratch/projects/insarlab/famelung;  echo "SCRATCHDIR:   "${SCRATCHDIR}'
alias TESTBENCH='NOTESTBENCH;  export SCRATCHDIR=${SCRATCHDIR}/TESTBENCH;  echo "SCRATCHDIR:   "${SCRATCHDIR}'
alias TESTBENCH1='NOTESTBENCH; export SCRATCHDIR=${SCRATCHDIR}/TESTBENCH1; echo "SCRATCHDIR:   "${SCRATCHDIR}'
alias TESTBENCH2='NOTESTBENCH; export SCRATCHDIR=${SCRATCHDIR}/TESTBENCH2; echo "SCRATCHDIR:   "${SCRATCHDIR}'
alias TESTBENCH3='NOTESTBENCH; export SCRATCHDIR=${SCRATCHDIR}/TESTBENCH3; echo "SCRATCHDIR:   "${SCRATCHDIR}'
alias TESTBENCH4='NOTESTBENCH; export SCRATCHDIR=${SCRATCHDIR}/TESTBENCH4; echo "SCRATCHDIR:   "${SCRATCHDIR}'
alias OPERATIONS='export OPERATIONS=${HOME}/insarlab/OPERATIONS; echo "OPERATIONS:  "${OPERATIONS}'
alias TESTOPERATIONS='export OPERATIONS=${HOME}/TESTOPERATIONS; echo "OPERATIONS:  "${OPERATIONS}'
alias TESTBENCHDAVID='export SCRATCHDIR="/projects/scratch/insarlab/dwg11"; echo "SCRATCHDIR:   "${SCRATCHDIR}'
alias NOTESTBENCH='cd $PARENTDIR; source bashfiles/platforms.bash; source bashfiles/custom.bash; cd -; echo "SCRATCHDIR:   "${SCRATCHDIR}'
alias ITESTBENCH1='cd ${PARENTDIR}; source default.bash; source custom.bash; cd -; export SCRATCHDIR=/scratch/projects/insarlab/${USER}/TESTBENCH1;  echo "SCRATCHDIR:   "${SCRATCHDIR}'
alias ITESTBENCH2='cd ${PARENTDIR}; source default.bash; source custom.bash; cd -; export SCRATCHDIR=/scratch/projects/insarlab/${USER}/TESTBENCH2;  echo "SCRATCHDIR:   "${SCRATCHDIR}'
alias ITESTBENCH3='cd ${PARENTDIR}; source default.bash; source custom.bash; cd -; export SCRATCHDIR=/scratch/projects/insarlab/${USER}/TESTBENCH3;  echo "SCRATCHDIR:   "${SCRATCHDIR}'
#alias setfamelung='export SCRATCHDIR=$(dirname "${SCRATCHDIR}")"/famelung"'
#alias setfamelung='export TEMPLATES=$(dirname $(dirname $(dirname $(dirname $(dirname "${TEMPLATES}")))))"/famelung/insarlab/infiles/famelung/TEMPLATES"'
alias setfamelung='export SCRATCHDIR=$(dirname "${SCRATCHDIR}")"/famelung"; export TEMPLATES=$(dirname $(dirname $(dirname $(dirname $(dirname "${TEMPLATES}")))))"/famelung/insarlab/infiles/famelung/TEMPLATES"'
alias setsxm1611='export SCRATCHDIR=$(dirname "${SCRATCHDIR}")"/sxm1611"; export TEMPLATES=$(dirname $(dirname $(dirname $(dirname $(dirname "${TEMPLATES}")))))"/sxm1611/insarlab/infiles/sxm1611/TEMPLATES"'
alias TESTBENCHBIGEND='export SCRATCHDIR=${SCRATCHDIR_ORIG}/TESTBENCHBIGEND; echo "SCRATCHDIR:   "${SCRATCHDIR}'
alias TESTBENCHLITEND='export SCRATCHDIR=${SCRATCHDIR_ORIG}/TESTBENCHLITEND; echo "SCRATCHDIR:   "${SCRATCHDIR}'
alias TESTBENCHBINARY='export SCRATCHDIR=${SCRATCHDIR_ORIG}/TESTBENCHBINARY; echo "SCRATCHDIR:   "${SCRATCHDIR}'
alias setGAMMALITEND='export GAMMA_BIN=${PARENTDIR}/3rdparty/gamma/GAMMA_SOFTWARE-20160625_LITEND/BIN; export GAMMA_LITEND_BIN=${PARENTDIR}/3rdparty/gamma/GAMMA_SOFTWARE-20160625_LITEND/BIN; echo "GAMMA_BIN: "${GAMMA_BIN}'
alias setGAMMABIGEND='export GAMMA_BIN=${PARENTDIR}/3rdparty/gamma/GAMMA_SOFTWARE-20160625_BIGEND/BIN; export GAMMA_LITEND_BIN=${PARENTDIR}/3rdparty/gamma/GAMMA_SOFTWARE-20160625_LITEND/BIN; echo "GAMMA_BIN: "${GAMMA_BIN}'
alias setGAMMABINARY='export GAMMA_BIN=${PARENTDIR}/3rdparty/gamma/GAMMA_SOFTWARE-20160625_BINARY/BIN; export GAMMA_LITEND_BIN=${PARENTDIR}/3rdparty/gamma/GAMMA_SOFTWARE-20160625_LITEND/BIN; echo "GAMMA_BIN: "${GAMMA_BIN}'
alias setGAMMApxs566='export GAMMA_BIN=/nethome/pxs566/test/testg/rsmas_insar/3rdparty/gamma/GAMMA_SOFTWARE-20160625_BIGEND/BIN'
alias rmt='cd ${PARENTDIR}; source default.bash; source custom.bash; echo "Removing ${SCRATCHDIR}/TESTBENCH/*  ....";  rm -r ${SCRATCHDIR}/TESTBENCH/*'
alias rmt1='cd ${PARENTDIR}; source default.bash; source custom.bash; echo "Removing ${SCRATCHDIR}/TESTBENCH1/* ....";  rm -r ${SCRATCHDIR}/TESTBENCH1/*'
alias rmt2='cd ${PARENTDIR}; source default.bash; source custom.bash; echo "Removing ${SCRATCHDIR}/TESTBENCH2/* ....";  rm -r ${SCRATCHDIR}/TESTBENCH2/*'
alias rmt3='cd ${PARENTDIR}; source default.bash; source custom.bash; echo "Removing ${SCRATCHDIR}/TESTBENCH3/* ....";  rm -r ${SCRATCHDIR}/TESTBENCH3/*'
######################################
###### MintPy #########################
######################################
alias cdp='cd ${MINTPY_HOME}/mintpy'
alias cdP='cd ${PARENTDIR}/sources/MintPy'
alias cppp='cp ${MINTPY_HOME}/sh/plot_smallbaselineApp.sh .'
alias mailkmz='echo " " | mail -a *.kmz -s MintPy_kmz_file ${NOTIFICATIONEMAIL} ; echo "kmz file sent to <${NOTIFICATIONEMAIL}>"'
function mailfile() { echo " " | mail -a *"$1"* -s mailing_files ${NOTIFICATIONEMAIL} ; echo "file sent to <${NOTIFICATIONEMAIL}>" ; }
function mailfile() { echo " " | mail -a "$1" -s mailing_files ${NOTIFICATIONEMAIL} ; echo "file sent to <${NOTIFICATIONEMAIL}>" ; }
alias mailcoherence='echo " " | mail -a coherence{_1,_2,_3,_4}* -s coherence_files ${NOTIFICATIONEMAIL} ; echo "coherence file sent to <${NOTIFICATIONEMAIL}>"'
alias mailssarakml='echo " " | mail -a *.kml -s ssara_kml_file ${NOTIFICATIONEMAIL} ; echo "kml file sent to <${NOTIFICATIONEMAIL}>"'
######################################
###### geodmod #######################
######################################
alias cdg='cd ${GEODMODHOME}'
alias cdm='cd ${MINTPY_HOME}/mintpy'
alias cdgs='cd ${GEODMODHOME}/examples'
alias cdge='cd ${GEODMODHOME}/examples'
alias cdgp='cd ${GEODMODHOME}/preparelib'
alias cdgm='cd ${GEODMODHOME}/masterfile'
alias cdgu='cd ${GEODMODHOME}/utillib'
alias cdgmo='cd ${GEODMODHOME}/modellib'
######################################
######## SVN shortcuts ########## ####
######################################
alias svnlogr='svn log http://web.ccs.miami.edu/repos/insarlab/trunk/rsmas_insar    | less'
alias svnlogs='svn log https://github.com/bakerunavco/SSARA.git/trunk               | less'
alias svnlogpyaps='svn log http://earthdef.caltech.edu/svn/pyaps                        | less'
alias gitpp='cdp; git pull; cd -'
######################################
######## killjob, LSF shortcuts ######
######################################
alias bsubi='bsub -q interactive -P insarlab -Is -XF /bin/bash'
alias bsubi4='bsub -q interactive -P insarlab -Is -n4 -R "span[hosts=1]" -XF /bin/bash'
alias bsubgeocode='bsub < ${PARENTDIR}/sources/rsmas_tools/notebooks/falk/geocode.job'
alias killcreateBatch='kill -9 `ps uax | grep famelung | grep createBatch | awk '\''{printf $2 " "}'\''`'
alias killperl='kill -9 `ps uax | grep famelung | grep perl | awk '\''{printf $2 " "}'\''`'
alias killpython='kill -9 `ps uax | grep famelung | grep python | awk '\''{printf $2 " "}'\''`'
alias killssara='kill -9 `ps uax | grep famelung | grep ssara_federated_query | awk '\''{printf $2 " "}'\''`'
alias killwget='kill -9 `ps uax | grep famelung | grep wget | awk '\''{printf $2 " "}'\''`'
function bkillsubmit_time() { bkill `bjobs | grep "$1" | awk '{print $"BASH_ARGV[1]" " "}'` ; }
function bbotsubmit_time() { echo `bjobs | grep "$1" | awk '{print $"{BASH_ARGV[1]" " "}'` ; }
function qdelsubmit_time() { qdel `showq | grep "$1" | awk '{printf $"{BASH_ARGV[1]" " "}'` ; }
alias bjobssum='bjobs | grep Sen; bjobs | grep RUN | wc -l | awk '\''{print "Running jobs:",$1}'\''; bjobs | grep PEND | wc -l | awk '\''{print "Pending jobs:",$1}'\'''
######################################
######## general #####################
######################################
function diffwith() { diff "$1" "$2"/"$1" ; }                # diff with same in other directory
function sdiffwith() { sdiff "$1" "$2"/"$1" ; }              # diff with same in other directory
function replacestr() { sed -i -- 's/'"$1"'/'"$2"'/g' "$3" ; }   # diff with same in other directory
######################################
######################################
alias echop='echo ${PATH} | tr ":" "\n"'
alias echold='echo ${LD_LIBRARY_PATH} | tr ":" "\n"'
alias echoPP='echo ${PYTHONPATH} | tr ":" "\n"'
alias echoPPR='echo ${PYTHONPATH_RSMAS} | tr ":" "\n"'
function repath() { export "$1"=`echo $"$1"\: | perl -pe 's[^"$2"\:]["$3"\:]g; s[\:"$2"\:][\:"$3"\:]g; s[\:\:][\:]g; s[^\:][]g'` ; }

#alias vi=/bin/vi
alias rrsync='rsync -avzh --progress'
alias igrep='grep -n --color'
alias x='chmod +x'
alias h='history | tail -20'
alias h50='history | tail -50'
alias h100='history | tail -100'
alias h200='history | tail -200'
function hg() { history | grep "$@" ; }
function grepr() { grep "$@" log log1 */log */log1 ; }
function grepm() { grep "$@" *.m */*.m */*/*.m */*/*/*.m ; }
alias gpl='grep process_ log'
alias v.g='vi ~/.gmtdefaults'
alias printpdb='echo import pdb\; pdb.set_trace\(\)'
alias sortrms='sort -k2,2 -nr'
function cdd() { old=${cwd} ; cd "$@" ; } 
alias back='cd -'
function awkf() { gawk -f ${HOME_PROG}/awks/"$@" ; }
alias m=more
function makeolder() { touch -r "$2" "$1" ; }
function grep2() { grep "$1" "$3"-$ | grep "$2" ; }
function mwhich() { m `which "$@" | grep "$@"` ; }
function ff() { find . -name \*"$@"\* -print ; }
alias rm0='find . -size 0c  -exec rm {} \;'
alias rm1544='find . -size 1544c  -exec rm {} \;'
alias rm1568='find . -size 1568c  -exec rm {} \;' 
#alias rm0l='find . -type f | xargs -i bash -c 'if [ $(wc -l {}|cut -d" " -f1) -lt 200 ]; then rm -f {}; fi''
alias rm1544='find . -size 1544c  -exec rm {} \;'
function rmswp() { rm \."$@".swp ; }
function rmb() { mv "$@" tmp_remove_"$@" ; sleep 60 ; rm -r tmp_remove_"$@" & }    # remove in background - use for large directories
alias xterm='xterm -sb &'
alias rmtopsStack='rm -rf run_files configs baselines coarse_interferograms coreg_slaves ESD geom_master interferograms master merged misreg slaves stack orbits hazard_products geom_master_noDEM'
alias rmltopsStack='rm -rf run_files configs baselines coarse_interferograms coreg_slaves ESD interferograms merged misreg slaves stack hazard_products geom_master_noDEM'
alias rmltopsStack='rm -rf run_files configs baselines coarse_interferograms coreg_slaves ESD interferograms merged misreg slaves stack hazard_products geom_master_noDEM'
alias rmoperations='rm -r ${OPERATIONS} &'
alias lloperations='ls -l ${OPERATIONS}/LOGS/*out'
alias gthumbf='I*/filt*int.bthumb.jpg'
#alias ls='ls -F'
alias ll='ls -l'
alias llh='ls -lh'
alias llrmswp='llrm *m~ */*m~ */*/*m~ */*/*/*m~ .*.swp */.*.swp */*/.*.swp */*/*/.*.swp'
alias llrmq='llrm q qq q1 q.m qq.m q1.m q.pl qq.pl q1.pl  */q */qq */q1 */q.m */qq.m */q1.m */q.pl */qq.pl */q1.pl */*/q */*/qq */*/q1 */*/q.m */*/qq.m */*/q1.m */*/q.pl */*/qq.pl */*/q1.pl'
alias lsd='/bin/ls -F | grep \/'
alias lstd='/bin/ls -Flrt | grep \/'
function lst() { ls -tlro "$@" | tail -15 ; }
function lstt() { ls -tro "$@" | tail -30 ; }
function lsttt() { ls -tro "$@" | tail -100 ; }
function lstdg() { /bin/ls -Flrt | grep \/ | grep "$@" ; }
function lstdg2() { /bin/ls -Flrt | grep \/ | grep "$1" | grep "$2" ; }
function lst1() { ls -tro "$@" | tail -2 ; }
function lstttt() { ls -tro --full-time "$@" | tail -100 ; }
alias lsrun='ls run_*_*{master,baseline,overlaps,resample,misreg,region,igram,coherence,slc,unwrap}'
alias catrun='head 10 run_*_*{master,baseline,overlaps,resample,misreg,region,igram,coherence,slc,unwrap}'
alias lss='ll | sort -n -k 5 | tail -20'
alias lsss='ls -s | sort -n | tail -50'
alias dum1='du --max-depth=1 --block-size=1G -h | sort -n'
alias dum2='du --max-depth=2 --block-size=1G -h | sort -n'
alias dum3='du --max-depth=3 --block-size=1G -h | sort -n'
alias dumM1='du --max-depth=1 --block-size=1M -h | sort -n'
alias dumM2='du --max-depth=2 --block-size=1M -h | sort -n'
alias dumM3='du --max-depth=3 --block-size=1M -h | sort -n'
alias ci='echo ...better type vi.... '
alias dush='du -sh --total'         # prints size of a directory
alias dus='du -sh --total /projects/scratch/insarlab/*'         # prints sizes of directories in SCRATCH
alias duv='du -sh --total /projects/scratch/vdm/*'              # prints sizes of directories in SCRATCH
alias duvu='du -sh --total /projects/scratch/vdm/${USER}'              # prints sizes of directories in SCRATCH
alias dui='du -s --block-size=1G --total /projects/scratch/insarlab/* | sort -nr'   # sorts sizes of directories in SCRATCH (FA 4/17)
alias duiu='du -sh --total /projects/scratch/insarlab/${USER}'     # prints size of USER directory in SCRATCH
function dug() { du -s --block-size=1G "$1" | sort -nr | head -20 ; }    # prints 20 biggest (FA 5/17)
alias cleanvu3='find /scratch/projects/vdm/${USER} -type f -mtime +3 -exec rm -f {} \;'     # 
alias cleanvu1='find /scratch/projects/vdm/${USER} -type f -mtime +1 -exec rm -f {} \;'     # 
alias display='/usr/bin/display'   
alias killperl='kill -9             `ps uax |  grep perl   |  awk '\''{printf                            $2 " "}'\''`'
############ python tools  ########
alias pylint='pylint --max-line-length=240'
############################
PS1='//\h${PWD}[\!] '
