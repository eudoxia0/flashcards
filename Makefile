ART         := cards/art/Art.md
BUILD       := cards/architecture/Great\ Buildings.md
DEF_PY      := scripts/def.py
ELEMENTS    := cards/science/periodic-table.md
ENG         := cards/language/english/English\ Vocabulary.md
FACES       := cards/history/faces/Faces.md
GREEK       := cards/language/greek-alphabet.md
PERSIAN     := cards/language/persian/Persian\ Alphabet.md
POW         := cards/math/Powers\ of\ Two.md
PY			:= python3
SPECTRUM	:= cards/science/em-spectrum.md
TEX			:= cards/tech/TeX.md

TARGETS  := $(ART) $(ENG) $(FACES) $(PERSIAN) $(POW) $(TEX) $(BUILD) $(ELEMENTS) $(GREEK) $(SPECTRUM)

.PHONY: all check drill clean

all: $(TARGETS)

$(ART): scripts/art.py cards/art/images
	$(PY) scripts/art.py > $(ART)

$(BUILD): scripts/build.py cards/architecture/images/*.jpg
	$(PY) scripts/build.py > $(BUILD)

$(FACES): scripts/faces.py cards/history/faces/images/*.jpg cards/history/faces/images/*.png
	$(PY) scripts/faces.py > $(FACES)

$(ENG): sources/english_vocab.csv scripts/def.py
	$(PY) scripts/def.py sources/english_vocab.csv > $(ENG)

$(PERSIAN): scripts/persian.py
	$(PY) scripts/persian.py > $(PERSIAN)

$(POW): scripts/pow2.py
	$(PY) scripts/pow2.py > $(POW)

$(TEX): scripts/tex.py sources/expr.tex
	$(PY) scripts/tex.py sources/expr.tex $(TEX)

$(ELEMENTS): scripts/tmpl.py sources/elements.csv sources/elements.tmpl
	python scripts/tmpl.py --csv=sources/elements.csv --template=sources/elements.tmpl --name="Periodic Table" --output=$@

$(GREEK): scripts/tmpl.py sources/greek-alphabet.csv sources/greek-alphabet.tmpl
	python scripts/tmpl.py --csv=sources/greek-alphabet.csv --template=sources/greek-alphabet.tmpl --name="Greek Alphabet" --output=$@

$(SPECTRUM): scripts/tmpl.py sources/em-spectrum.csv sources/em-spectrum.tmpl
	python scripts/tmpl.py --csv=sources/em-spectrum.csv --template=sources/em-spectrum.tmpl --name="Electromagnetic Spectrum" --output=$@

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
