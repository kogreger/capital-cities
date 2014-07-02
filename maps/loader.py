#!/usr/bin/env Python
"""Load all shapefiles in a given directory.
  This script (loader.py) runs from the QGIS Python console.
  From the console, use:
	from loader import Loader
	ldr = Loader(qgis.utils.iface)
	ldr.load_shapefiles('/my/path/to/shapefile/directory')

  """
from glob import glob
from os import path

class Loader:
	def __init__(self, iface):
		"""Initialize using the qgis.utils.iface 
		object passed from the console.
		
		"""
		self.iface = iface

	def load_shapefiles(self, shp_path):
		"""Load all shapefiles found in shp_path"""
		print "Loading shapes from %s" % path.join(shp_path, "*.shp")
		shps = glob(path.join(shp_path, "*.shp"))
		for shp in shps:
			(shpdir, shpfile) = path.split(shp)
			self.iface.addVectorLayer(shp, shpfile, 'ogr' )