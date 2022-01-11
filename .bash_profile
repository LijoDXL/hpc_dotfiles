# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

#if [ -f ~/.login ]; then
#        . ~/.login
#fi

#setting prompt
export PS1="[\[\e[0;31m\]\u@\h \[\e[0;37m\]\W]\[\e[1;37m\]$ \[\e[0m\]"
### export PATH
export PATH=/usr/bin:/bin:/usr/local/bin:/local/bin:/sbin:/usr/sbin:/usr/ucb:/usr/sbin:/usr/bsd:/gpfs1/Platform/lsf912/9.1/linux2.6-glibc2.3-x86_64/etc:/gpfs1/Platform/lsf912/9.1/linux2.6-glibc2.3-x86_64/bin:/gpfs1/Platform/ppm912/9.1/bin:/gpfs1/Platform/ppm912/9.1/linux2.6-glibc2.3-x86_64/bin:/gpfs1/Platform/pac912/gui/3.0/bin:/gpfs1/Platform/pac912/perf/1.2/bin:/gpfs1/Platform/ppm912/9.1/bin:/gpfs1/Platform/ppm912/9.1/linux2.6-glibc2.3-x86_64/bin:/gpfs1/opt/intel/icsxe//impi/4.1.3.048/intel64/bin:/gpfs1/opt/intel/icsxe//impi/4.1.3.048/intel64/bin:/usr/lib64/qt-3.3/bin:/usr/lpp/mmfs/bin:/gpfs1/opt/intel/flexlm

export LD_LIBRARY_PATH=
export LIBRARY_PATH=
export NLSPATH=
export CPATH=
export INCLUDE=
export MIC_LD_LIBRARY_PATH=
export MIC_LIBRARY_PATH=

module purge
module load pnetcdf/1.8.1_v16
module load netcdf/4.1.3_v16
module load jasper/1.900.1_v16
module load hdf5/1.8.11_v16
module load szip/2.1_v16
module load zlib/1.2.8_v16
module load libpng/1.6.28_with_v17
module load ncview
module load nco/4.6.5
module load ncl/6.4.0
module load octave/4.0.0
module load wgrib2/0.2.0.7
module load lapack
module load blas
module load GNU-ferret/7.4
module list

source /gpfs1/opt/intel/parallel_studio_xe_2016/compilers_and_libraries_2016.2.181/linux/bin/compilervars.sh intel64
source /gpfs1/opt/intel/parallel_studio_xe_2016/compilers_and_libraries_2016.2.181/linux/mpi/intel64/bin/mpivars.sh
source /gpfs1/opt/intel/parallel_studio_xe_2016/compilers_and_libraries_2016.2.181/linux/mkl/bin/mklvars.sh intel64

export PATH=$PATH:$HOME/local/bin:$HOME/bin

#################################conda setup##################################################
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/incois_ncmrwfx/incois/hycom/mambaforge/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/incois_ncmrwfx/incois/hycom/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/incois_ncmrwfx/incois/hycom/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/incois_ncmrwfx/incois/hycom/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
##############################################################################################
