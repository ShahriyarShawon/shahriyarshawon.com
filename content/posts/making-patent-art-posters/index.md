---
title: "Making Patent Art Posters"
date: "2026-04-11"
tags: [non-technical, art]
---

# Making Patent Art Posters

## Tools:
- Inkscape
- ImageMagick (for the convert command)

## My Process

1. Find Patent on <a href="patents.google.com" target="_blank">patents.google.com</a>
2. Extract pages as images in tiff format `$ convert -density 300 patent.pdf -quality 100 page_%03d.tiff`
3. Make note of which files have the figures you want
4. For each tiff that has figures you want..
    1. import into Inkscape 
    2. `Shift + Alt + B` or `Path > Trace Bitmap`
    3. Trace Settings
        - Dropdown > Brightness cutoff
        - Brightness Threshold: 0.600
        - Speckles: 5
        - leave everything else as is
    4. Update then Apply (This will put a vector layer either below or above your current layer)
    5. Separate the two layers side by side
    6. press N for the node tool, hover over either image, if red outlines appear, that's the vector you want to keep,
        delete the other one
    7. If there are any remaining speckles around where you want to extract a figure from, the node editor, draw a box around the speckle and hit delete
    8. the following is taken from google to extract the contents of a drawn polygon from the rest of the image:
        ```
        - Draw your polygon: Use the Bezier Pen Tool (shortcut B) to draw an irregular polygon, or the Stars and Polygons Tool (shortcut *) for regular shapes, directly over the section you want to extract.
        - Position: Ensure the polygon is on top of your vector object.
        - Select both: Click the polygon, then hold Shift and click the vector object.
        - Apply Clip: Go to Object > Clip > Set.
        ```
    9. Save as its own vector
5. Arrange However you like

This will get you a final working SVG of the poster you want. I did some additional work with the help of an LLM to generate
a script that takes in a pair of colors from a file that looks like this:
```
#003153 #FFFFFF
#1E1E1E #FFFFFF
#F5F0E8 #000000
```

and spits out a file for each line with the FG and BG colors in each line.
You can see the script <a href="colorize.sh" target="_blank">here</a>
```
Usage: ./colorize.sh input.svg colors.txt
```

## Patent Art So Far
- [Manual-Transmission](#manual-transmission---us-patent-4458551)
- [Stellar-Compass](#stellar-compass---us-patent-703139)
- [Planetarium](#planetarium---us-patent-937892)
- [Browning-1911](#browning-1911---us-patent-us984519)
- [M1-Garand](#m1-garand---us-patent-us1892141)
- [V8](#v8---us-patent-2759463)

## Manual Transmission - US Patent 4458551
[Back To Top of Patent Art](#patent-art-so-far)
![Manual Transmission](images/US4458551-manual-transmission-bg1E1E1E_lineFFFFFF.png)
![Manual Transmission](images/US4458551-manual-transmission-bg003153_lineFFFFFF.png)
![Manual Transmission](images/US4458551-manual-transmission-bgF5F0E8_line000000.png)

## Stellar Compass - US Patent 703139
[Back To Top of Patent Art](#patent-art-so-far)
![](images/US703139-stellar-compass-white-on-prussian-blue.png)

## Planetarium - US Patent 937892
[Back To Top of Patent Art](#patent-art-so-far)
![](images/US937892-planetarium-bg1E1E1E_lineFFFFFF.png)
![](images/US937892-planetarium-bg003153_lineFFFFFF.png)
![](images/US937892-planetarium-bgF5F0E8_line000000.png)

## Browning 1911 - US Patent US984519
[Back To Top of Patent Art](#patent-art-so-far)
![](images/US984519-browning-1911-bg1E1E1E_lineFFFFFF.png)
![](images/US984519-browning-1911-bg003153_lineFFFFFF.png)
![](images/US984519-browning-1911-bgF5F0E8_line000000.png)

## M1 Garand - US Patent US1892141
[Back To Top of Patent Art](#patent-art-so-far)
![](images/US1892141-m1garand-black-on-offwhite-.png)
![](images/US1892141-m1garand-final-white-on-charcoal.png)
![](images/US1892141-m1garand-white-on-prussian-blue.png)

## V8 - US Patent 2759463
[Back To Top of Patent Art](#patent-art-so-far)
![](images/US2759463-v8-bg1E1E1E_lineFFFFFF.png)
![](images/US2759463-v8-bg003153_lineFFFFFF.png)
![](images/US2759463-v8-bgF5F0E8_line000000.png)

