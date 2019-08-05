#! /usr/bin/env python3
###############################################################################
#
# Project: process_rsmas.py
# Author: Sara Mirzaee
# Created: 10/2018
#
###############################################################################
# Backwards compatibility for Python 2
from __future__ import print_function

import os
import sys
import time
from minsar.objects import message_rsmas
import minsar.utils.process_utilities as putils
import minsar.job_submission as js
from minsar.objects.auto_defaults import PathFind

from minsar import download_rsmas, dem_rsmas, create_runfiles, execute_runfiles, smallbaseline_wrapper
from minsar import ingest_insarmaps, export_ortho_geo

pathObj = PathFind()
step_list, step_help = pathObj.process_rsmas_help()
###############################################################################


def main(iargs=None):

    start_time = time.time()

    inps = putils.cmd_line_parse(iargs, script='process_rsmas')

    template_file = pathObj.auto_template

    # print default template
    if inps.print_template:
        raise SystemExit(open(template_file, 'r').read())

    inps = check_directories_and_inputs(inps)

    command_line = os.path.basename(sys.argv[0]) + ' ' + ' '.join(sys.argv[1:])
    message_rsmas.log(inps.work_dir, '##### NEW RUN #####')
    message_rsmas.log(inps.work_dir, command_line)

    config = putils.get_config_defaults(config_file='job_defaults.cfg')

    #########################################
    # Submit job
    #########################################
    if inps.submit_flag:
        job_file_name = 'process_rsmas'
        if inps.wall_time == 'None':
            inps.wall_time = config[job_file_name]['walltime']

        job = js.submit_script(inps.project_name, job_file_name, sys.argv[:], inps.work_dir, inps.wall_time)
        # run_operations.py needs this print statement for now.
        # This is not for debugging purposes.
        # DO NOT REMOVE.
        print(job)

    else:
        objInsar = RsmasInsar(inps)
        objInsar.run(steps=inps.runSteps)

    # Timing
    m, s = divmod(time.time() - start_time, 60)
    print('\nTotal time: {:02.0f} mins {:02.1f} secs'.format(m, s))
    return

###########################################################################################


def check_directories_and_inputs(inputs):

    inps = inputs

    # invalid input of custom template
    if inps.customTemplateFile:
        if not os.path.isfile(inps.customTemplateFile):
            raise FileNotFoundError(inps.customTemplateFile)

    if inps.remove_project_dir:
        putils.remove_directories(directories_to_delete=[inps.work_dir])

    if not os.path.isdir(inps.work_dir):
        os.makedirs(inps.work_dir)

    os.chdir(inps.work_dir)

    inps.slc_dir = os.path.join(inps.work_dir, 'SLC')
    if not os.path.isdir(inps.slc_dir):
        os.makedirs(inps.slc_dir)

    # check input --start/end/step
    for key in ['startStep', 'endStep', 'step']:
        value = vars(inps)[key]
        if value and value not in step_list:
            msg = 'Input step not found: {}'.format(value)
            msg += '\nAvailable steps: {}'.format(step_list)
            raise ValueError(msg)

    # ignore --start/end input if --step is specified
    if inps.step:
        inps.startStep = inps.step
        inps.endStep = inps.step

    # get list of steps to run
    idx0 = step_list.index(inps.startStep)
    idx1 = step_list.index(inps.endStep)

    if idx0 > idx1:
        msg = 'input start step "{}" is AFTER input end step "{}"'.format(inps.startStep, inps.endStep)
        raise ValueError(msg)
    inps.runSteps = step_list[idx0:idx1 + 1]

    print('Run routine processing with {} on steps: {}'.format(os.path.basename(__file__), inps.runSteps))
    if len(inps.runSteps) == 1:
        print('Remaining steps: {}'.format(step_list[idx0 + 1:]))

    print('-' * 50)

    return inps

###########################################################################################


class RsmasInsar:
    """ Routine processing workflow for time series analysis of small baseline InSAR stacks
    """

    def __init__(self, inps):
        self.customTemplateFile = inps.customTemplateFile
        self.work_dir = inps.work_dir
        self.project_name = inps.project_name

        if 'demMethod' in inps.template and inps.template['demMethod'] == 'boundingBox':
            self.dem_flag = '--boundingBox'
        else:
            self.dem_flag = '--ssara'

        if inps.template['processingMethod'] == 'smallbaseline':
            self.method = 'mintpy'
        else:
            self.method = 'minopy'

        return

    def run_download_data(self):
        """ Downloading images using download_rsmas.py script.
        """

        clean_list = pathObj.isce_clean_list()
        for item in clean_list[0:int(inps.template['cleanopt'])]:
            for directory in item:
                if os.path.isdir(os.path.join(self.work_dir, directory)):
                    shutil.rmtree(os.path.join(self.work_dir, directory))

        download_rsmas.main([self.customTemplateFile])
        return

    def run_download_dem(self):
        """ Downloading DEM using dem_rsmas.py script.
        """
        dem_rsmas.main([self.customTemplateFile, self.dem_flag])
        return

    def run_interferogram(self):
        """ Process images from unpacking to making interferograms using ISCE
        1. create run_files
        2. execute run_files
        """
        create_runfiles.main([self.customTemplateFile])
        execute_runfiles.main([self.customTemplateFile])
        return

    def run_mintpy(self):
        """ Process smallbaseline using MintPy or non-linear inversion using MiNoPy and email results
        """
        if self.method == 'mintpy':
            smallbaseline_wrapper.main([self.customTemplateFile])
        else:
            minopy_wrapper.main([self.customTemplateFile])
        return

    def run_insarmaps(self):
        """ prepare outputs for insarmaps website.
        """
        ingest_insarmaps.main([self.customTemplateFile])
        return

    def run_geocode(self):
        """ create ortho/geo-rectified products.
        """
        export_ortho_geo.main([self.customTemplateFile])
        return

    def run(self, steps=step_list):
        # run the chosen steps
        for sname in steps:

            print('\n\n******************** step - {} ********************'.format(sname))

            if sname == 'download':
                self.run_download_data()

            elif sname == 'dem':
                self.run_download_dem()

            elif sname == 'ifgrams':
                self.run_interferogram()

            elif sname == 'mintpy':
                self.run_mintpy()

            elif sname == 'insarmaps':
                self.run_insarmaps()

            elif sname == 'geocode':
                self.run_geocode()

        # message
        msg = '\n###############################################################'
        msg += '\nNormal end of Process Rsmas routine InSAR processing workflow!'
        msg += '\n##############################################################'
        print(msg)
        return

###########################################################################################


if __name__ == '__main__':
    main()
