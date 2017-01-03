+++
# Date this page was created.
date = "2016-04-27"

# Project title.
title = "Exhaled acetone dependency on inhalation"

# Project summary to display on homepage.
#summary = "Dependency of exhaled breath acetone on inhaledconcentration. Considering a simple three compartment model. "

# Optional image to display on homepage (relative to `static/img/` folder).
image_preview = "proj/acet.png"

# Optional image to display on project detail page (relative to `static/img/` folder).
image = ""

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["breath", "metabolomic", "voc"]

# Optional external URL for project (replaces project detail page).
external_link = ""

# Does the project detail page use math formatting?
math = false

+++

Exhaled concentration of inert gases simply depends on the inhaled
concentration.  Especially in steady state it is obvious that exhaled
concentration needs to be equal to the inhaled concentration.  In the
case of volatile organic compounds (VOCs) that take part in the
metabolism the relationship becomes more complicated.  The exhaled
concentration then also depends on metabolic production and
metabolization rates. 

We consider the concentration in steady state.  We already know that
exhaled concentration is a linear function of inhaled concentration,
fully described by two numbers - slope and intercept.  Based on a PBPK
model we derive the corresponding functions and discuss the influence
of physiological parameter on these numbers.  We also intend to
estimate these parameter based on recorded measurements.
