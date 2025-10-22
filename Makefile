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
TARGETS        := $(AWS) $(ENG) $(INDO_VOCAB) $(NATO) $(PERSIAN) $(POW) $(STATS) README.md
VOCAB_PY       := Scripts/vocab.py
STATS          := stats.json

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

$(STATS): Cards/**.md
	hashcards stats Cards --format=json > $(STATS)

README.md: stats.json Sources/README.tmpl.md
	sed "s/CARDS_IN_DECK/$$(hashcards stats Cards --format=json | jq -r .cardsInDeckCount)/" Sources/README.tmpl.md > README.md

.PHONY: check
check:
	hashcards check Cards

.PHONY: drill
drill:
	hashcards drill Cards

.PHONY: stats
stats:
	hashcards stats Cards --format=json

.PHONY: clean
clean:
	rm -f $(TARGETS)
