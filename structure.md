# Einführung
## Allgemeine Beschreibung
* Nötige Aufgaben: Headtracking, Kalibrierung
* Beschreibung Vuzix-Brille (Sensoren [Gyro, Mag, Acc], Kamera)
### Motivation
* Einsatzzwecke, Fahererunterstützung oder Testen von Autonomen Verfahren

# Headtracking
## Einleitung
* Bestimmung der Kopforientierung
* Verwendung von Lagesensoren und Kamera
* Kamera zur Marker-Erkennung
##Sensorik
###Gyroskope
* Funktionsweise
* Tiefpassfilter
* Bias-Korrektur
* HBW & LBW Fusion
* Wertebereiche, wie alte Präsentation
* Integration
* Eigenschaften (schnell, aber Drift durch Integration)

###Beschleunigungssensor
* Funktionsweise
* für Roll und Pitch
* Tiefpassfilter
* Umrechnung auf m/s²
* Berechnung von Roll und Pitch direkt aus Werten
* Problem: ungenügendes Yaw

###Magnetometer
* Funktionsweise
* Tiefpassfilter
* Magnetometer-Bias-Korrektur (durch Min/Max-Werte), Normierung auf [-1,1]
* Magnetometer-Kreisplots vor/nach Kalibrierung, Magnetometer-Fehler in Kreisplots 
* Transformation auf XY Ebene (Algorithmus Ralf)
##Sensor-Fusion 
Ziel: Orientierung
###Betrachtung verschiedener Algorithmen
Madgwick (Grund dagegen: Optimierungsverfahren basierend auf Quaternionendarstellung dadurch schwer nachvollziehbar/debuggbar), Kalman, Komplementärfilter
Entscheidung für Komplementärfilter: gut genug für unsere Zwecke, leicht anpassbar, Fehlerverteilungen für Sensoren unbekannt (für Kalman nötig)
###Komplementärfilter
Blockschaltbild der Fusion
Gewichtung: Funktionsweise formal: “gyro.slerp(0.05, acc).slerp(0.01, mag)”
Zwischenfazit
Insgesamt eingeständiger Ansatz (offline)

##Marker-Tracking
Motivation
Stützung relativ zum Fahrzeug (Korrektur)
Verwendung von ALVAR zur Marker-Erkennung
Berechnung der Kopf-Pose aus Maker-Orientierung
Verrechnung mit Komplementärfilter

##Kinect
Probleme mit Erkennung des Kopfes (Brille passt nicht zur Kopfmaske)
Mit der Bille geht es insgesamt nicht so gut
Verarbeitungspipeline ist langsam

##Koordinatensysteme
(Bild mit allen TFs und deren Abh.)
Erklärung der verschiedenen Pfade (Mit/Ohne Marker..)

##Loosely-Coupled-System
Verrechnung von Auto-IMU-Daten und Brillen-IMU-Daten
Zur Bestimmung der Sensordaten in Autokoordinaten
Es fehlt nur noch die Integration
# Objekt-Einblendung/Kalibrierung
* Bestimmung der Größe der einzublendenden Fahrszenen (=> soll real wirken)
* TODO

#Zusammenfassung
#Ausblick