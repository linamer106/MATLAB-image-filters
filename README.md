# MATLAB Image Filters

A collection of MATLAB image processing filters and effects.

## Overview

This repository contains a set of MATLAB functions to apply different image filters, including basic transformations and artistic effects.

### Available Filters

- **Greyscale** – Convert an image to grayscale.
- **Invert** – Invert the colors of an image.
- **Blur** – Apply a blur effect to smooth an image.
- **Sketch** – Create a sketch-like effect.
- **ColourDifference** – Highlight differences in colors.
- **TwoTone** – Convert an image into two primary colors.
- **FindClosest** – Map image colors to the closest available color palette.
- **Crystallise** – Create a crystallized or mosaic effect.

## Usage

1. Place your image in the project folder.
2. Call the filter function from MATLAB:

```matlab
img = imread('yourImage.jpg');
output = greyscale(img);  % Replace with any filter function
imshow(output);
