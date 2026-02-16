ART            := Cards/Art/Art.md
ART_DIR        := Cards/Art
ART_PY         := Scripts/art.py
AWS            := Cards/AWS\ Regions.md
AWS_SRC        := Sources/aws.csv
BUILD          := Cards/Great\ Buildings/Great\ Buildings.md
BUILD_PY       := Scripts/build.py
BUILD_SRC      := Cards/Great\ Buildings/*.jpg
DEF_PY         := Scripts/def.py
ENG            := Cards/English\ Vocabulary.md
ENG_SRC        := Sources/english_vocab.csv
FDI            := Cards/FDI\ Dental\ Notation.md
FDI_PY         := Scripts/fdi.py
INDO_VOCAB     := Cards/Indonesian\ Vocabulary.md
INDO_VOCAB_SRC := Sources/indo_vocab.csv
NATO           := Cards/NATO\ Phonetic\ Alphabet.md
NATO_SRC       := Sources/nato.csv
PERSIAN        := Cards/Persian\ Alphabet.md
PERSIAN_PY     := Scripts/persian.py
POW            := Cards/Powers\ of\ Two.md
POW_PY         := Scripts/pow2.py
PY             := python3
STATS          := stats.json
TEX_OUT        := Cards/TeX.md
TEX_PY         := Scripts/tex.py
TEX_SRC        := Sources/expr.tex
VOCAB_PY       := Scripts/vocab.py

TARGETS        := $(ART) $(AWS) $(ENG) $(INDO_VOCAB) $(NATO) $(PERSIAN) $(POW) $(STATS) $(TEX_OUT) $(FDI) $(BUILD)

.PHONY: all check drill stats clean

all: $(TARGETS)

$(ART): $(ART_PY) $(ART_DIR)
	$(PY) $(ART_PY) > $(ART)

$(AWS): $(AWS_SRC) $(VOCAB_PY)
	$(PY) $(VOCAB_PY) $(AWS_SRC) > $(AWS)

$(BUILD): $(BUILD_PY) $(BUILD_SRC)
	$(PY) $(BUILD_PY) > $(BUILD)

$(ENG): $(ENG_SRC) $(DEF_PY)
	$(PY) $(DEF_PY) $(ENG_SRC) > $(ENG)

$(FDI): $(FDI_PY)
	$(PY) $(FDI_PY) > $(FDI)

$(INDO_VOCAB): $(INDO_VOCAB_SRC) $(VOCAB_PY)
	$(PY) $(VOCAB_PY) $(INDO_VOCAB_SRC) > $(INDO_VOCAB)

$(NATO): $(NATO_SRC) $(DEF_PY)
	$(PY) $(DEF_PY) $(NATO_SRC) > $(NATO)

$(PERSIAN): $(PERSIAN_PY)
	$(PY) $(PERSIAN_PY) > $(PERSIAN)

$(POW): $(POW_PY)
	$(PY) $(POW_PY) > $(POW)

$(STATS): Cards/**.md
	hashcards stats Cards --format=json > $(STATS)

$(TEX_OUT): $(TEX_PY) $(TEX_SRC)
	$(PY) $(TEX_PY) $(TEX_SRC) $(TEX_OUT)

check:
	hashcards check Cards

drill:
	hashcards drill Cards

stats:
	hashcards stats Cards --format=json

clean:
	rm -f $(TARGETS)
