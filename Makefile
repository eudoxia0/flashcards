ART      := cards/art/Art.md
BUILD    := cards/architecture/Great\ Buildings.md
ELEMENTS := cards/science/elements.md
FACES    := cards/history/faces/Faces.md
GREEK    := cards/language/greek-alphabet.md
PERSIAN  := cards/language/persian/Persian\ Alphabet.md
POW      := cards/math/Powers\ of\ Two.md
PY       := python3
SPECTRUM := cards/science/em-spectrum.md
TEX      := cards/tech/tex.md

TARGETS  := $(ART) $(ENG) $(FACES) $(PERSIAN) $(POW) $(TEX) $(BUILD) $(ELEMENTS) $(GREEK) $(SPECTRUM)

.PHONY: all check drill clean

all: $(TARGETS)

$(ART): scripts/art.py cards/art/images
	$(PY) scripts/art.py > $(ART)

$(BUILD): scripts/build.py cards/architecture/images/*.jpg
	$(PY) scripts/build.py > $(BUILD)

$(FACES): scripts/faces.py cards/history/faces/images/*.jpg cards/history/faces/images/*.png
	$(PY) scripts/faces.py > $(FACES)

$(PERSIAN): scripts/persian.py
	$(PY) scripts/persian.py > $(PERSIAN)

$(POW): scripts/pow2.py
	$(PY) scripts/pow2.py > $(POW)

$(TEX): scripts/tex.py cards/tech/tex.txt
	$(PY) scripts/tex.py cards/tech/tex.txt $(TEX)

$(ELEMENTS): scripts/tmpl.py cards/science/elements.csv cards/science/elements.tmpl
	python scripts/tmpl.py \
	    --csv=cards/science/elements.csv \
		--template=cards/science/elements.tmpl \
		--name="Periodic Table" \
		--output=$@

$(GREEK): scripts/tmpl.py cards/language/greek-alphabet.csv cards/language/greek-alphabet.tmpl
	python scripts/tmpl.py \
	    --csv=cards/language/greek-alphabet.csv \
		--template=cards/language/greek-alphabet.tmpl \
		--name="Greek Alphabet" \
		--output=$@

$(SPECTRUM): scripts/tmpl.py cards/science/em-spectrum.csv cards/science/em-spectrum.tmpl
	python scripts/tmpl.py \
	    --csv=cards/science/em-spectrum.csv \
		--template=cards/science/em-spectrum.tmpl \
		--name="Electromagnetic Spectrum" \
		--output=$@

check:
	hashcards check cards

drill:
	hashcards drill cards --new-card-limit=5

stats:
	hashcards stats cards --format=json

due:
	hashcards due cards

browse:
	hashcards browse cards

clean:
	rm -f $(TARGETS)
