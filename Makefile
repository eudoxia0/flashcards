ART            := cards/Art/_Art.md
ART_DIR        := cards/Art
ART_PY         := scripts/art.py
BUILD          := cards/Great\ Buildings/_Great\ Buildings.md
BUILD_PY       := scripts/build.py
BUILD_SRC      := cards/Great\ Buildings/*.jpg
DEF_PY         := scripts/def.py
ENG            := cards/Language/English/English\ Vocabulary.md
ENG_SRC        := sources/english_vocab.csv
PERSIAN        := cards/Language/Persian/Persian\ Alphabet.md
PERSIAN_PY     := scripts/persian.py
POW            := cards/Mathematics/Powers\ of\ Two.md
POW_PY         := scripts/pow2.py
PY             := python3
TEX_OUT        := cards/Tech/TeX.md
TEX_PY         := scripts/tex.py
TEX_SRC        := sources/expr.tex

TARGETS        := $(ART) $(ENG) $(PERSIAN) $(POW) $(TEX_OUT) $(BUILD)

.PHONY: all check drill clean

all: $(TARGETS)

$(ART): $(ART_PY) $(ART_DIR)
	$(PY) $(ART_PY) > $(ART)

$(BUILD): $(BUILD_PY) $(BUILD_SRC)
	$(PY) $(BUILD_PY) > $(BUILD)

$(ENG): $(ENG_SRC) $(DEF_PY)
	$(PY) $(DEF_PY) $(ENG_SRC) > $(ENG)

$(PERSIAN): $(PERSIAN_PY)
	$(PY) $(PERSIAN_PY) > $(PERSIAN)

$(POW): $(POW_PY)
	$(PY) $(POW_PY) > $(POW)

$(TEX_OUT): $(TEX_PY) $(TEX_SRC)
	$(PY) $(TEX_PY) $(TEX_SRC) $(TEX_OUT)

check:
	hashcards check cards

drill:
	hashcards drill cards --new-card-limit=5

stats:
	hashcards stats cards --format=json

due:
	hashcards due cards

clean:
	rm -f $(TARGETS)
