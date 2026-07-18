ART            := cards/art/Art.md
ART_DIR        := cards/art/images
ART_PY         := scripts/art.py
BUILD          := cards/architecture/Great\ Buildings.md
BUILD_PY       := scripts/build.py
BUILD_SRC      := cards/architecture/images/*.jpg
DEF_PY         := scripts/def.py
ENG            := cards/language/english/English\ Vocabulary.md
ENG_SRC        := sources/english_vocab.csv
FACES          := cards/history/faces/Faces.md
FACES_PY       := scripts/faces.py
FACES_SRC      := cards/history/faces/images/*.jpg cards/history/faces/images/*.png
PERSIAN        := cards/language/persian/Persian\ Alphabet.md
PERSIAN_PY     := scripts/persian.py
POW            := cards/math/Powers\ of\ Two.md
POW_PY         := scripts/pow2.py
PY             := python3
TEX_OUT        := cards/tech/TeX.md
TEX_PY         := scripts/tex.py
TEX_SRC        := sources/expr.tex
ELEMENTS       := cards/science/periodic-table.md
GREEK          := cards/language/greek-alphabet.md
SPECTRUM       := cards/science/em-spectrum.md

TARGETS        := $(ART) $(ENG) $(FACES) $(PERSIAN) $(POW) $(TEX_OUT) $(BUILD) $(ELEMENTS) $(GREEK) $(SPECTRUM)

.PHONY: all check drill clean

all: $(TARGETS)

$(ART): $(ART_PY) $(ART_DIR)
	$(PY) $(ART_PY) > $(ART)

$(BUILD): $(BUILD_PY) $(BUILD_SRC)
	$(PY) $(BUILD_PY) > $(BUILD)

$(FACES): $(FACES_PY) $(FACES_SRC)
	$(PY) $(FACES_PY) > $(FACES)

$(ENG): $(ENG_SRC) $(DEF_PY)
	$(PY) $(DEF_PY) $(ENG_SRC) > $(ENG)

$(PERSIAN): $(PERSIAN_PY)
	$(PY) $(PERSIAN_PY) > $(PERSIAN)

$(POW): $(POW_PY)
	$(PY) $(POW_PY) > $(POW)

$(TEX_OUT): $(TEX_PY) $(TEX_SRC)
	$(PY) $(TEX_PY) $(TEX_SRC) $(TEX_OUT)

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
