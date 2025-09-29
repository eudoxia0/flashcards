AWS      := Cards/AWS\ Regions.md
AWS_SRC  := Sources/aws.csv
NATO     := Cards/NATO\ Phonetic\ Alphabet.md
NATO_SRC := Sources/nato.csv
POW      := Cards/Powers\ of\ Two.md
POW_PY   := Scripts/pow2.py
PY       := python3
SIMPLE   := Scripts/simple.py
TARGETS  := $(NATO) $(POW) $(AWS)
VOCAB    := Scripts/vocab.py

.PHONY: all
all: $(TARGETS)

$(AWS): $(AWS_SRC) $(SIMPLE)
		$(PY) $(SIMPLE) $(AWS_SRC) > $(AWS)

$(NATO): $(NATO_SRC) $(VOCAB)
			$(PY) $(VOCAB) $(NATO_SRC) > $(NATO)

$(POW):$(POW_PY)
			$(PY) $(POW_PY) > $(POW)

.PHONY: clean
clean:
	rm -f $(TARGETS)

.PHONY: drill
drill:
	RUST_LOG=debug hashcards drill Cards
