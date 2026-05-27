ART            := Cards/Art/_Art.md
ART_DIR        := Cards/Art
ART_PY         := Scripts/art.py
BUILD          := Cards/Great\ Buildings/_Great\ Buildings.md
BUILD_PY       := Scripts/build.py
BUILD_SRC      := Cards/Great\ Buildings/*.jpg
DEF_PY         := Scripts/def.py
ENG            := Cards/English\ Vocabulary.md
ENG_SRC        := Sources/english_vocab.csv
FDI            := Cards/FDI\ Dental\ Notation.md
FDI_PY         := Scripts/fdi.py
PERSIAN        := Cards/Persian\ Alphabet.md
PERSIAN_PY     := Scripts/persian.py
POW            := Cards/Powers\ of\ Two.md
POW_PY         := Scripts/pow2.py
PY             := python3
TEX_OUT        := Cards/TeX.md
TEX_PY         := Scripts/tex.py
TEX_SRC        := Sources/expr.tex

TARGETS        := $(ART) $(ENG) $(PERSIAN) $(POW) $(TEX_OUT) $(FDI) $(BUILD)

.PHONY: all check drill clean

all: $(TARGETS)

$(ART): $(ART_PY) $(ART_DIR)
	$(PY) $(ART_PY) > $(ART)

$(BUILD): $(BUILD_PY) $(BUILD_SRC)
	$(PY) $(BUILD_PY) > $(BUILD)

$(ENG): $(ENG_SRC) $(DEF_PY)
	$(PY) $(DEF_PY) $(ENG_SRC) > $(ENG)

$(FDI): $(FDI_PY)
	$(PY) $(FDI_PY) > $(FDI)

$(PERSIAN): $(PERSIAN_PY)
	$(PY) $(PERSIAN_PY) > $(PERSIAN)

$(POW): $(POW_PY)
	$(PY) $(POW_PY) > $(POW)

$(TEX_OUT): $(TEX_PY) $(TEX_SRC)
	$(PY) $(TEX_PY) $(TEX_SRC) $(TEX_OUT)

check:
	hashcards check Cards

drill:
	hashcards drill Cards --new-card-limit=5

stats:
	hashcards stats Cards --format=json

due:
	hashcards due Cards

clean:
	rm -f $(TARGETS)
