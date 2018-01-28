### About

The purpose of the scripts here is to split out the automodapi extension in
astropy-helpers into a separate sphinx-automodapi repository. To reproduce the
git workflow, run the ``run.sh`` script in this directory.

The tricky part here is that the extension was previously split out into the
following repository:

  https://github.com/astropy/sphinx-automodapi/

but the history had not been preserved at the time. So we basically need to
replace the commit that added the files in that repository (d68fcde4) by
whatever history we extract from astropy-helpers here.

Note that throughout the scripts, the commit hashes are not necessarily the
old ones since they will often change when filter-branch is run, so if
some early steps are changed, the commit hashes later on need to be changed.
