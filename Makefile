AWS            := Cards/AWS\ Regions.md
AWS_SRC        := Sources/aws.csv
DEF_PY         := Scripts/def.py
ENG            := Cards/English\ Vocabulary.md
ENG_SRC        := Sources/english_vocab.csv
INDO_VOCAB     := Cards/Indonesian\ Vocabulary.md
INDO_VOCAB_SRC := Sources/indo_vocab.csv
NATO           := Cards/NATO\ Phonetic\ Alphabet.md
NATO_SRC       := Sources/nato.csv
PERSIAN        := Cards/Persian\ Alphabet.md
PERSIAN_PY     := Scripts/persian.py
POW            := Cards/Powers\ of\ Two.md
POW_PY         := Scripts/pow2.py
PY             := python3
TARGETS        := $(AWS) $(ENG) $(INDO_VOCAB) $(NATO) $(PERSIAN) $(POW)
VOCAB_PY       := Scripts/vocab.py

.PHONY: all
all: $(TARGETS)

$(AWS): $(AWS_SRC) $(VOCAB_PY)
	$(PY) $(VOCAB_PY) $(AWS_SRC) > $(AWS)

$(ENG): $(ENG_SRC) $(DEF_PY)
	$(PY) $(DEF_PY) $(ENG_SRC) > $(ENG)

$(INDO_VOCAB): $(INDO_VOCAB_SRC) $(VOCAB_PY)
	$(PY) $(VOCAB_PY) $(INDO_VOCAB_SRC) > $(INDO_VOCAB)

$(NATO): $(NATO_SRC) $(DEF_PY)
	$(PY) $(DEF_PY) $(NATO_SRC) > $(NATO)

$(PERSIAN): $(PERSIAN_PY)
	$(PY) $(PERSIAN_PY) > $(PERSIAN)

$(POW): $(POW_PY)
	$(PY) $(POW_PY) > $(POW)

.PHONY: clean
clean:
	rm -f $(TARGETS)

.PHONY: check
check:
	hashcards check Cards

.PHONY: drill
drill:
	hashcards drill Cards

.PHONY: stats
stats:
	hashcards stats Cards --format=json
