AWS      := Cards/AWS\ Regions.md
AWS_SRC  := Sources/aws.csv
ENG      := Cards/English\ Vocabulary.md
ENG_SRC  := Sources/english_vocab.csv
NATO     := Cards/NATO\ Phonetic\ Alphabet.md
NATO_SRC := Sources/nato.csv
POW      := Cards/Powers\ of\ Two.md
POW_PY   := Scripts/pow2.py
PY       := python3
SIMPLE   := Scripts/simple.py
TARGETS  := $(AWS) $(ENG) $(NATO) $(POW)
VOCAB    := Scripts/vocab.py

.PHONY: all
all: $(TARGETS)

$(AWS): $(AWS_SRC) $(SIMPLE)
	$(PY) $(SIMPLE) $(AWS_SRC) > $(AWS)

$(ENG): $(ENG_SRC) $(VOCAB)
	$(PY) $(VOCAB) $(ENG_SRC) > $(ENG)

$(NATO): $(NATO_SRC) $(VOCAB)
	$(PY) $(VOCAB) $(NATO_SRC) > $(NATO)

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
	hashcards drill Cards --card-limit=10
