#!/usr/bin/env Python
""" capitalCities.py

Contains a number of functions and scripts used in the context of the 
capital cities (mobility) project at the Division for Spatial Information 
Science (SIS) at the University of Tsukuba. More information about this 
research project can be found in its official GitHub repository: 
https://github.com/kogreger/capital-cities


Author:  Konstantin Greger
Version: 0.1
Date:    2014-07-02


Scripts:
- hourlyAnimationOfSubtripOrigins(self, location)


These scripts run from the QGIS Python console:
	from capitalCities import capitalCities
	cc = capitalCities(qgis.utils.iface)
	cc.nameOfScript()

"""


from qgis.core import *
from qgis.gui import *
from qgis.utils import *
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from PyQt4.QtXml import *


class capitalCities:
	def __init__(self, iface):
		"""
		Initialize using the qgis.utils.iface 
		object passed from the console.
		"""
		self.iface = iface

	def hourlyAnimationOfSubtripOrigins(self, location):
		"""
		Create an animation of 24 map images (0am-11pm) showing the subtrip 
		origin locations of the chosen location (dhk09, hni04, jkt02, mnl96)
		"""
		# add validation of "location" here
		
		print "Creating animation of hourly origin locations for {}:".format(location)
		
		query = "(SELECT p.puid id, s.pid, s.tno, s.sno, s.tmodec, p.geom, date_part('hour', s.pdate_s) phour_s FROM {0}.point p JOIN {0}.subtrip s ON p.puid = s.puid_s WHERE s.tmodec != 99 AND s.tmodec != 97)".format(location)
		layer = "subtrip_origins_{}".format(location)
		uri = QgsDataSourceURI()
		uri.setConnection("localhost", "1111", "pflow", "postgres", "postgres")
		uri.setDataSource("", query, "geom", "", "id")
		qgis.utils.iface.addVectorLayer(uri.uri(), layer, "postgres")
		
		img = QImage(QSize(1024, 768), QImage.Format_ARGB32_Premultiplied)
		color = QColor(255,255,255)
		img.fill(color.rgb())
		p = QPainter()
		p.begin(img)
		p.setRenderHint(QPainter.Antialiasing)
		render = QgsMapRenderer()
		